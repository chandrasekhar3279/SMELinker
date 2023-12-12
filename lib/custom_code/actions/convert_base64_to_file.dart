// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:mime/mime.dart';

Future<FFUploadedFile?> convertBase64ToFile(String? base64String) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath =
      '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
  final bytes = base64Decode(base64String!);

  try {
    await File(filePath).writeAsBytes(bytes);

    // Get file information
    final file = File(filePath);
    final filename = file.path.split('/').last;
    final mimeType = lookupMimeType(filePath) ?? 'application/octet-stream';

    // Create and return FFUploadedFile
    return FFUploadedFile(
      bytes: bytes,
      name: filename,
      blurHash: mimeType,
    );
  } catch (e) {
    print('Error converting base64 string to file: $e');
    return null;
  }
}
