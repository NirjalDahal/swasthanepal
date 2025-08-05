import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class UploadedFile {
  final String id;
  final String name;
  final String path;
  final String type;
  final int size;
  final DateTime uploadedAt;
  final String? url;

  UploadedFile({
    required this.id,
    required this.name,
    required this.path,
    required this.type,
    required this.size,
    required this.uploadedAt,
    this.url,
  });

  factory UploadedFile.fromJson(Map<String, dynamic> json) {
    return UploadedFile(
      id: json['id'],
      name: json['name'],
      path: json['path'],
      type: json['type'],
      size: json['size'],
      uploadedAt: DateTime.parse(json['uploadedAt']),
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'path': path,
      'type': type,
      'size': size,
      'uploadedAt': uploadedAt.toIso8601String(),
      'url': url,
    };
  }
}

class FileUploadService {
  static final FileUploadService _instance = FileUploadService._internal();
  factory FileUploadService() => _instance;
  FileUploadService._internal();

  final ImagePicker _imagePicker = ImagePicker();
  static const String baseUrl = 'https://api.swasthanepal.com';

  // Pick image from gallery
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      return image != null ? File(image.path) : null;
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  // Take photo with camera
  Future<File?> takePhotoWithCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );
      return image != null ? File(image.path) : null;
    } catch (e) {
      print('Error taking photo: $e');
      return null;
    }
  }

  // Pick document
  Future<File?> pickDocument({
    List<String> allowedExtensions = const ['pdf', 'doc', 'docx'],
  }) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
      );

      if (result != null && result.files.isNotEmpty) {
        return File(result.files.first.path!);
      }
      return null;
    } catch (e) {
      print('Error picking document: $e');
      return null;
    }
  }

  // Upload file to server
  Future<UploadedFile?> uploadFile({
    required File file,
    required String category, // prescription, report, etc.
    String? description,
    BuildContext? context,
  }) async {
    try {
      // Show loading dialog
      if (context != null) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      // Create multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/upload'),
      );

      // Add file
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
        ),
      );

      // Add metadata
      request.fields['category'] = category;
      if (description != null) {
        request.fields['description'] = description;
      }

      // Send request
      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      // Hide loading dialog
      if (context != null) {
        Navigator.of(context).pop();
      }

      if (response.statusCode == 200) {
        final data = jsonDecode(responseData);
        return UploadedFile.fromJson(data);
      } else {
        throw Exception('Upload failed: ${response.statusCode}');
      }
    } catch (e) {
      // Hide loading dialog
      if (context != null) {
        Navigator.of(context).pop();
      }
      print('Error uploading file: $e');
      return null;
    }
  }

  // Upload multiple files
  Future<List<UploadedFile>> uploadMultipleFiles({
    required List<File> files,
    required String category,
    String? description,
    BuildContext? context,
  }) async {
    List<UploadedFile> uploadedFiles = [];

    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      
      // Show progress
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
                Text('Uploading file ${i + 1} of ${files.length}'),
              ],
            ),
          ),
        );
      }

      final uploadedFile = await uploadFile(
        file: file,
        category: category,
        description: description,
      );

      if (uploadedFile != null) {
        uploadedFiles.add(uploadedFile);
      }

      // Hide progress dialog
      if (context != null) {
        Navigator.of(context).pop();
      }
    }

    return uploadedFiles;
  }

  // Get file size in readable format
  String getFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  // Get file type icon
  IconData getFileTypeIcon(String fileName) {
    final extension = path.extension(fileName).toLowerCase();
    
    switch (extension) {
      case '.pdf':
        return Icons.picture_as_pdf;
      case '.doc':
      case '.docx':
        return Icons.description;
      case '.jpg':
      case '.jpeg':
      case '.png':
      case '.gif':
        return Icons.image;
      case '.mp4':
      case '.avi':
      case '.mov':
        return Icons.video_file;
      default:
        return Icons.insert_drive_file;
    }
  }

  // Validate file size
  bool isValidFileSize(int bytes, {int maxSizeMB = 10}) {
    return bytes <= maxSizeMB * 1024 * 1024;
  }

  // Validate file type
  bool isValidFileType(String fileName, List<String> allowedExtensions) {
    final extension = path.extension(fileName).toLowerCase();
    return allowedExtensions.contains(extension.replaceAll('.', ''));
  }

  // Delete uploaded file
  Future<bool> deleteFile(String fileId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/upload/$fileId'),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting file: $e');
      return false;
    }
  }

  // Get user's uploaded files
  Future<List<UploadedFile>> getUserFiles({
    String? category,
    BuildContext? context,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/upload/user-files${category != null ? '?category=$category' : ''}'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['files'] as List)
            .map((file) => UploadedFile.fromJson(file))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting user files: $e');
      return [];
    }
  }

  // Download file
  Future<Uint8List?> downloadFile(String fileId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/upload/download/$fileId'),
      );

      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
      return null;
    } catch (e) {
      print('Error downloading file: $e');
      return null;
    }
  }
} 