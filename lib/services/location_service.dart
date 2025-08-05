import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HospitalLocation {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final double distance; // in kilometers
  final String phone;
  final String type; // public, private, etc.
  final bool isOpen;

  HospitalLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.phone,
    required this.type,
    required this.isOpen,
  });

  factory HospitalLocation.fromJson(Map<String, dynamic> json) {
    return HospitalLocation(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      distance: json['distance']?.toDouble() ?? 0.0,
      phone: json['phone'],
      type: json['type'],
      isOpen: json['isOpen'] ?? false,
    );
  }
}

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  Position? _currentPosition;
  bool _hasPermission = false;

  Position? get currentPosition => _currentPosition;
  bool get hasPermission => _hasPermission;

  // Request location permissions
  Future<bool> requestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    _hasPermission = true;
    return true;
  }

  // Get current location
  Future<Position?> getCurrentLocation() async {
    if (!_hasPermission) {
      final hasPermission = await requestLocationPermission();
      if (!hasPermission) return null;
    }

    try {
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return _currentPosition;
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  // Get address from coordinates
  Future<String> getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return '${place.street}, ${place.locality}, ${place.administrativeArea}';
      }
      return 'Unknown location';
    } catch (e) {
      return 'Unknown location';
    }
  }

  // Calculate distance between two points
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1000; // Convert to kilometers
  }

  // Find nearby hospitals
  Future<List<HospitalLocation>> findNearbyHospitals({
    double radius = 10.0, // Default 10km radius
    String? type,
  }) async {
    if (_currentPosition == null) {
      await getCurrentLocation();
      if (_currentPosition == null) {
        return [];
      }
    }

    try {
      // Mock data - replace with actual API call
      final mockHospitals = [
        {
          'id': '1',
          'name': 'Bir Hospital',
          'address': 'Kantipath, Kathmandu',
          'latitude': 27.7172,
          'longitude': 85.3240,
          'phone': '+977-1-4221111',
          'type': 'public',
          'isOpen': true,
        },
        {
          'id': '2',
          'name': 'Tribhuvan University Teaching Hospital',
          'address': 'Maharajgunj, Kathmandu',
          'latitude': 27.7200,
          'longitude': 85.3500,
          'phone': '+977-1-4412300',
          'type': 'public',
          'isOpen': true,
        },
        {
          'id': '3',
          'name': 'Nepal Medical College',
          'address': 'Jorpati, Kathmandu',
          'latitude': 27.7500,
          'longitude': 85.3800,
          'phone': '+977-1-4911000',
          'type': 'private',
          'isOpen': true,
        },
        {
          'id': '4',
          'name': 'Patan Hospital',
          'address': 'Lalitpur, Kathmandu Valley',
          'latitude': 27.6800,
          'longitude': 85.3200,
          'phone': '+977-1-5522295',
          'type': 'public',
          'isOpen': false,
        },
      ];

      List<HospitalLocation> nearbyHospitals = [];

      for (final hospital in mockHospitals) {
        final distance = calculateDistance(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
          hospital['latitude'],
          hospital['longitude'],
        );

        if (distance <= radius && (type == null || hospital['type'] == type)) {
          nearbyHospitals.add(HospitalLocation.fromJson({
            ...hospital,
            'distance': distance,
          }));
        }
      }

      // Sort by distance
      nearbyHospitals.sort((a, b) => a.distance.compareTo(b.distance));
      return nearbyHospitals;
    } catch (e) {
      print('Error finding nearby hospitals: $e');
      return [];
    }
  }

  // Get directions to hospital
  Future<String> getDirectionsToHospital(HospitalLocation hospital) async {
    if (_currentPosition == null) {
      await getCurrentLocation();
      if (_currentPosition == null) {
        return 'Unable to get current location';
      }
    }

    try {
      List<Location> locations = await locationFromAddress(hospital.address);
      if (locations.isNotEmpty) {
        final distance = calculateDistance(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
          locations.first.latitude,
          locations.first.longitude,
        );

        return 'Distance: ${distance.toStringAsFixed(1)} km\nAddress: ${hospital.address}';
      }
      return 'Address: ${hospital.address}';
    } catch (e) {
      return 'Address: ${hospital.address}';
    }
  }

  // Check if location services are enabled
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Open location settings
  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  // Get location accuracy
  Future<LocationAccuracy> getLocationAccuracy() async {
    return await Geolocator.getLocationAccuracy();
  }
} 