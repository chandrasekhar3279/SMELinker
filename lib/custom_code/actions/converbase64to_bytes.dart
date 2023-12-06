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
import 'dart:html';

Future<FFUploadedFile>? converbase64toBytes(
  BuildContext context,
  String base64Image,
) async {
  // Function to convert base64 to bytes
  Uint8List base64ToBytes(String base64String) {
    return Uint8List.fromList(base64.decode(base64String));
  }
}
