// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class PreviewUploadedImage extends StatefulWidget {
  const PreviewUploadedImage({
    Key? key,
    this.width,
    this.height,
    this.uploadedImageInBytes,
  }) : super(key: key);

  final double? width;
  final double? height;
  final FFUploadedFile? uploadedImageInBytes;

  @override
  _PreviewUploadedImageState createState() => _PreviewUploadedImageState();
}

class _PreviewUploadedImageState extends State<PreviewUploadedImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: widget.uploadedImageInBytes != null
          ? Image.memory(widget.uploadedImageInBytes!.bytes!)
          : const SizedBox.shrink(),
    );
  }
}
