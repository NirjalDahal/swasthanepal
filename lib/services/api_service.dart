import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiService {
  static const String baseUrl = 'https://api.swasthanepal.com'; // Replace with your actual API
  static const Duration timeout = Duration(seconds: 30);

  // Generic GET request
  static Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
    BuildContext? context,
  }) async {
    try {
      final response = await http
          .get(
            Uri.parse('$baseUrl$endpoint'),
            headers: {
              'Content-Type': 'application/json',
              ...?headers,
            },
          )
          .timeout(timeout);

      return _handleResponse(response, context);
    } catch (e) {
      _handleError(e, context);
      rethrow;
    }
  }

  // Generic POST request
  static Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    BuildContext? context,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('$baseUrl$endpoint'),
            headers: {
              'Content-Type': 'application/json',
              ...?headers,
            },
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(timeout);

      return _handleResponse(response, context);
    } catch (e) {
      _handleError(e, context);
      rethrow;
    }
  }

  // Handle API response
  static Map<String, dynamic> _handleResponse(
    http.Response response,
    BuildContext? context,
  ) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        throw Exception('Invalid JSON response');
      }
    } else {
      String errorMessage = 'Server error';
      try {
        final errorData = jsonDecode(response.body);
        errorMessage = errorData['message'] ?? errorMessage;
      } catch (e) {
        // Use default error message
      }
      throw Exception(errorMessage);
    }
  }

  // Handle errors
  static void _handleError(dynamic error, BuildContext? context) {
    String message = 'An error occurred';
    
    if (error.toString().contains('SocketException')) {
      message = 'No internet connection';
    } else if (error.toString().contains('TimeoutException')) {
      message = 'Request timeout';
    } else {
      message = error.toString();
    }

    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Mock API calls for development
  static Future<Map<String, dynamic>> mockApiCall({
    required String endpoint,
    Map<String, dynamic>? body,
    Duration delay = const Duration(seconds: 1),
  }) async {
    await Future.delayed(delay);
    
    // Mock responses based on endpoint
    switch (endpoint) {
      case '/doctors':
        return {
          'success': true,
          'data': [
            {
              'id': '1',
              'name': 'Dr. Ram Sharma',
              'specialty': 'Cardiologist',
              'rating': 4.5,
              'experience': '15 years',
              'available': true,
            },
            {
              'id': '2',
              'name': 'Dr. Sita Devi',
              'specialty': 'Pediatrician',
              'rating': 4.8,
              'experience': '12 years',
              'available': true,
            },
          ],
        };
      
      case '/appointments':
        return {
          'success': true,
          'data': [
            {
              'id': '1',
              'doctorName': 'Dr. Ram Sharma',
              'date': '2024-01-15',
              'time': '10:00 AM',
              'status': 'confirmed',
            },
          ],
        };
      
      case '/blood-donation':
        return {
          'success': true,
          'message': 'Blood donation request submitted successfully',
        };
      
      case '/chat':
        return {
          'success': true,
          'response': 'Thank you for your message. How can I help you today?',
        };
      
      default:
        return {
          'success': true,
          'message': 'Operation completed successfully',
        };
    }
  }
} 