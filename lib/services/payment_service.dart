import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentMethod {
  final String id;
  final String name;
  final String type; // card, mobile_money, bank_transfer, etc.
  final String? icon;
  final bool isEnabled;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.type,
    this.icon,
    this.isEnabled = true,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      icon: json['icon'],
      isEnabled: json['isEnabled'] ?? true,
    );
  }
}

class PaymentTransaction {
  final String id;
  final String appointmentId;
  final double amount;
  final String currency;
  final String status; // pending, completed, failed, refunded
  final String paymentMethod;
  final DateTime createdAt;
  final DateTime? completedAt;
  final String? transactionId;

  PaymentTransaction({
    required this.id,
    required this.appointmentId,
    required this.amount,
    required this.currency,
    required this.status,
    required this.paymentMethod,
    required this.createdAt,
    this.completedAt,
    this.transactionId,
  });

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) {
    return PaymentTransaction(
      id: json['id'],
      appointmentId: json['appointmentId'],
      amount: json['amount'].toDouble(),
      currency: json['currency'],
      status: json['status'],
      paymentMethod: json['paymentMethod'],
      createdAt: DateTime.parse(json['createdAt']),
      completedAt: json['completedAt'] != null 
          ? DateTime.parse(json['completedAt']) 
          : null,
      transactionId: json['transactionId'],
    );
  }
}

class PaymentService {
  static final PaymentService _instance = PaymentService._internal();
  factory PaymentService() => _instance;
  PaymentService._internal();

  static const String baseUrl = 'https://api.swasthanepal.com';

  // Get available payment methods
  Future<List<PaymentMethod>> getPaymentMethods() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/payment/methods'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['methods'] as List)
            .map((method) => PaymentMethod.fromJson(method))
            .toList();
      }

      // Return mock data if API is not available
      return [
        PaymentMethod(
          id: '1',
          name: 'Credit/Debit Card',
          type: 'card',
          icon: 'assets/images/credit_card.png',
        ),
        PaymentMethod(
          id: '2',
          name: 'eSewa',
          type: 'mobile_money',
          icon: 'assets/images/esewa.png',
        ),
        PaymentMethod(
          id: '3',
          name: 'Khalti',
          type: 'mobile_money',
          icon: 'assets/images/khalti.png',
        ),
        PaymentMethod(
          id: '4',
          name: 'Bank Transfer',
          type: 'bank_transfer',
          icon: 'assets/images/bank.png',
        ),
      ];
    } catch (e) {
      print('Error getting payment methods: $e');
      return [];
    }
  }

  // Process payment
  Future<PaymentTransaction?> processPayment({
    required String appointmentId,
    required double amount,
    required String paymentMethodId,
    required String currency,
    Map<String, dynamic>? paymentDetails,
    BuildContext? context,
  }) async {
    try {
      // Show loading dialog
      if (context != null) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Processing payment...'),
              ],
            ),
          ),
        );
      }

      final response = await http.post(
        Uri.parse('$baseUrl/payment/process'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'appointmentId': appointmentId,
          'amount': amount,
          'currency': currency,
          'paymentMethodId': paymentMethodId,
          'paymentDetails': paymentDetails,
        }),
      );

      // Hide loading dialog
      if (context != null) {
        Navigator.of(context).pop();
      }

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return PaymentTransaction.fromJson(data);
      } else {
        throw Exception('Payment failed: ${response.statusCode}');
      }
    } catch (e) {
      // Hide loading dialog
      if (context != null) {
        Navigator.of(context).pop();
      }
      print('Error processing payment: $e');
      return null;
    }
  }

  // Get payment status
  Future<String> getPaymentStatus(String paymentId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/payment/status/$paymentId'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['status'];
      }
      return 'unknown';
    } catch (e) {
      print('Error getting payment status: $e');
      return 'unknown';
    }
  }

  // Refund payment
  Future<bool> refundPayment({
    required String paymentId,
    required double amount,
    String? reason,
    BuildContext? context,
  }) async {
    try {
      // Show loading dialog
      if (context != null) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Processing refund...'),
              ],
            ),
          ),
        );
      }

      final response = await http.post(
        Uri.parse('$baseUrl/payment/refund'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'paymentId': paymentId,
          'amount': amount,
          'reason': reason,
        }),
      );

      // Hide loading dialog
      if (context != null) {
        Navigator.of(context).pop();
      }

      return response.statusCode == 200;
    } catch (e) {
      // Hide loading dialog
      if (context != null) {
        Navigator.of(context).pop();
      }
      print('Error refunding payment: $e');
      return false;
    }
  }

  // Get payment history
  Future<List<PaymentTransaction>> getPaymentHistory({
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    try {
      String url = '$baseUrl/payment/history';
      List<String> params = [];
      
      if (status != null) params.add('status=$status');
      if (fromDate != null) params.add('fromDate=${fromDate.toIso8601String()}');
      if (toDate != null) params.add('toDate=${toDate.toIso8601String()}');
      
      if (params.isNotEmpty) {
        url += '?${params.join('&')}';
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['transactions'] as List)
            .map((transaction) => PaymentTransaction.fromJson(transaction))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting payment history: $e');
      return [];
    }
  }

  // Calculate appointment cost
  double calculateAppointmentCost({
    required String doctorType,
    required String appointmentType, // consultation, follow_up, emergency
    required int duration, // in minutes
  }) {
    double baseCost = 0;
    
    // Base costs by doctor type
    switch (doctorType.toLowerCase()) {
      case 'specialist':
        baseCost = 2000; // NPR
        break;
      case 'general':
        baseCost = 1000;
        break;
      case 'emergency':
        baseCost = 3000;
        break;
      default:
        baseCost = 1500;
    }

    // Adjust by appointment type
    switch (appointmentType.toLowerCase()) {
      case 'consultation':
        baseCost *= 1.0;
        break;
      case 'follow_up':
        baseCost *= 0.7; // 30% discount
        break;
      case 'emergency':
        baseCost *= 1.5; // 50% premium
        break;
    }

    // Adjust by duration
    if (duration > 30) {
      baseCost *= (duration / 30.0);
    }

    return baseCost;
  }

  // Validate payment details
  bool validatePaymentDetails(Map<String, dynamic> details) {
    // Add validation logic based on payment method
    if (details['paymentMethod'] == 'card') {
      return details['cardNumber'] != null && 
             details['expiryDate'] != null && 
             details['cvv'] != null;
    } else if (details['paymentMethod'] == 'mobile_money') {
      return details['phoneNumber'] != null;
    }
    return true;
  }

  // Format currency
  String formatCurrency(double amount, String currency) {
    switch (currency.toUpperCase()) {
      case 'NPR':
        return 'रु ${amount.toStringAsFixed(2)}';
      case 'USD':
        return '\$${amount.toStringAsFixed(2)}';
      default:
        return '${amount.toStringAsFixed(2)} $currency';
    }
  }
} 