// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CroppedFilePreview extends StatefulWidget {
  const CroppedFilePreview({
    Key? key,
    this.width,
    this.height,
    this.croppedImageFile,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? croppedImageFile;

  @override
  _CroppedFilePreviewState createState() => _CroppedFilePreviewState();
}

class _CroppedFilePreviewState extends State<CroppedFilePreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: widget.croppedImageFile != null
          ? Image.memory(Uint8List.fromList(widget.croppedImageFile!.codeUnits))
          : const SizedBox.shrink(),
    );
  }
}
