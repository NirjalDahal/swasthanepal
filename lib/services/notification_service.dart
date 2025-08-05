import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;

  // Initialize notifications
  Future<void> initialize() async {
    if (_isInitialized) return;

    const AndroidInitializationSettings androidSettings = 
        AndroidInitializationSettings('@mipmap/ic_launcher');
    
    const DarwinInitializationSettings iosSettings = 
        DarwinInitializationSettings();

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(settings);
    _isInitialized = true;
  }

  // Request notification permissions
  Future<bool> requestPermissions() async {
    if (!_isInitialized) await initialize();
    
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        _notifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    final bool? granted = await androidImplementation?.requestPermission();
    return granted ?? false;
  }

  // Show local notification
  Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
    int id = 0,
  }) async {
    if (!_isInitialized) await initialize();

    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'swastha_nepal_channel',
      'Swastha Nepal',
      channelDescription: 'Notifications from Swastha Nepal app',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(id, title, body, details, payload: payload);
  }

  // Schedule notification
  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
    int id = 0,
  }) async {
    if (!_isInitialized) await initialize();

    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'swastha_nepal_channel',
      'Swastha Nepal',
      channelDescription: 'Notifications from Swastha Nepal app',
      importance: Importance.high,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      details,
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // Cancel notification
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  // Show appointment reminder
  Future<void> showAppointmentReminder({
    required String doctorName,
    required DateTime appointmentTime,
    required String location,
  }) async {
    final timeString = '${appointmentTime.hour.toString().padLeft(2, '0')}:${appointmentTime.minute.toString().padLeft(2, '0')}';
    
    await showNotification(
      title: 'Appointment Reminder',
      body: 'Your appointment with $doctorName is at $timeString at $location',
      payload: 'appointment_reminder',
    );
  }

  // Show blood donation reminder
  Future<void> showBloodDonationReminder({
    required String donorName,
    required DateTime donationDate,
  }) async {
    await showNotification(
      title: 'Blood Donation Reminder',
      body: 'Thank you $donorName for your blood donation on ${donationDate.day}/${donationDate.month}/${donationDate.year}',
      payload: 'blood_donation_reminder',
    );
  }

  // Show prescription ready notification
  Future<void> showPrescriptionReady({
    required String doctorName,
    required String prescriptionType,
  }) async {
    await showNotification(
      title: 'Prescription Ready',
      body: 'Your $prescriptionType prescription from $doctorName is ready',
      payload: 'prescription_ready',
    );
  }

  // Show general health update
  Future<void> showHealthUpdate({
    required String title,
    required String message,
  }) async {
    await showNotification(
      title: title,
      body: message,
      payload: 'health_update',
    );
  }

  // Listen to notification taps
  void onNotificationTap(Function(String?) callback) {
    _notifications.initialize(
      const InitializationSettings(),
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        callback(response.payload);
      },
    );
  }
} 