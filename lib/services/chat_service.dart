import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatMessage {
  final String id;
  final String senderId;
  final String senderName;
  final String message;
  final DateTime timestamp;
  final bool isUser;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.message,
    required this.timestamp,
    required this.isUser,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderId: json['senderId'],
      senderName: json['senderName'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
      isUser: json['senderId'] == 'user',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isUser': isUser,
    };
  }
}

class ChatService {
  static const String baseUrl = 'https://api.swasthanepal.com';
  static const Duration pollingInterval = Duration(seconds: 2);
  
  Timer? _pollingTimer;
  final StreamController<List<ChatMessage>> _messagesController = 
      StreamController<List<ChatMessage>>.broadcast();
  
  List<ChatMessage> _messages = [];
  bool _isConnected = false;

  Stream<List<ChatMessage>> get messagesStream => _messagesController.stream;
  List<ChatMessage> get messages => List.unmodifiable(_messages);
  bool get isConnected => _isConnected;

  // Initialize chat
  Future<void> initializeChat(String userId) async {
    try {
      _isConnected = true;
      _startPolling();
      _messagesController.add(_messages);
    } catch (e) {
      _isConnected = false;
      rethrow;
    }
  }

  // Send message
  Future<void> sendMessage(String message, String userId, String userName) async {
    try {
      final newMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: userId,
        senderName: userName,
        message: message,
        timestamp: DateTime.now(),
        isUser: true,
      );

      _messages.add(newMessage);
      _messagesController.add(_messages);

      // Send to server
      await _sendToServer(newMessage);

      // Simulate AI response
      await Future.delayed(Duration(seconds: 1));
      final aiResponse = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: 'ai',
        senderName: 'AI Assistant',
        message: _generateAIResponse(message),
        timestamp: DateTime.now(),
        isUser: false,
      );

      _messages.add(aiResponse);
      _messagesController.add(_messages);

    } catch (e) {
      print('Error sending message: $e');
      rethrow;
    }
  }

  // Send message to server
  Future<void> _sendToServer(ChatMessage message) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(message.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      // For demo purposes, we'll continue even if server is not available
      print('Server not available, continuing with local chat');
    }
  }

  // Generate AI response (mock)
  String _generateAIResponse(String userMessage) {
    final responses = [
      'Thank you for your message. How can I help you today?',
      'I understand your concern. Let me help you with that.',
      'That\'s an interesting question. Here\'s what I can tell you...',
      'I\'m here to help. Could you provide more details?',
      'Thank you for reaching out. I\'ll assist you with this.',
    ];
    
    return responses[DateTime.now().millisecond % responses.length];
  }

  // Start polling for new messages
  void _startPolling() {
    _pollingTimer = Timer.periodic(pollingInterval, (timer) async {
      if (!_isConnected) {
        timer.cancel();
        return;
      }
      
      try {
        await _fetchNewMessages();
      } catch (e) {
        print('Error polling messages: $e');
      }
    });
  }

  // Fetch new messages from server
  Future<void> _fetchNewMessages() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/chat/messages'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final newMessages = (data['messages'] as List)
            .map((msg) => ChatMessage.fromJson(msg))
            .toList();

        // Add only new messages
        for (final message in newMessages) {
          if (!_messages.any((m) => m.id == message.id)) {
            _messages.add(message);
          }
        }

        _messagesController.add(_messages);
      }
    } catch (e) {
      // Server might not be available, continue with local messages
    }
  }

  // Disconnect
  void disconnect() {
    _isConnected = false;
    _pollingTimer?.cancel();
    _messagesController.close();
  }

  // Clear messages
  void clearMessages() {
    _messages.clear();
    _messagesController.add(_messages);
  }
} 