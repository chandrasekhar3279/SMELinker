// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CropImageWidgetShareState {
  FFUploadedFile? croppedImageData;
  static final CropImageWidgetShareState _instance =
      CropImageWidgetShareState._internal();

  factory CropImageWidgetShareState() {
    return _instance;
  }

  CropImageWidgetShareState._internal();

  void clear() {
    croppedImageData = null;
  }
}

Future clearCroppImageShareCache() async {
  // Add your function code here!
  CropImageWidgetShareState().clear();
}
