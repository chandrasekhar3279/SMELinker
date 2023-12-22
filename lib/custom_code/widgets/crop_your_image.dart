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

import '../../flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:s_m_e_linker/custom_code/widgets/cropped_file_preview.dart';

// import 'dart:typed_data';

class CropYourImage extends StatefulWidget {
  const CropYourImage({
    Key? key,
    this.width,
    this.height,
    this.oldImage,
    this.ratio,
    required this.onCrop,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? ratio;
  final FFUploadedFile? oldImage;
  final Future<dynamic> Function() onCrop;

  @override
  _CropYourImageState createState() => _CropYourImageState();
}

class _CropYourImageState extends State<CropYourImage> {
  final _cropController = CropController();

  @override
  Widget build(BuildContext context) {
    final _imageData = widget.oldImage;
    final _cropRatio = widget.ratio;

    // Convert FFUploadedFile to Uint8List
    final Uint8List? imageDataBytes =
        _imageData != null ? _imageData.bytes?.buffer.asUint8List() : null;

    final String? filename = _imageData != null ? _imageData.name : null;

    return Container(
        child: Column(children: [
      // Crop
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Crop(
            // maskColor: FlutterFlowTheme.of(context).primaryBackground,
            cornerDotBuilder: (size, edgeAlignment) =>
                DotControl(color: FlutterFlowTheme.of(context).primary),
            baseColor: FlutterFlowTheme.of(context).secondaryBackground,
            image: imageDataBytes!,
            aspectRatio: _cropRatio,
            // initialAreaBuilder: (rect) => Rect.fromLTRB(rect.left + 24,
            //     rect.top + 32, rect.right - 24, rect.bottom - 32),

            onCropped: (Uint8List croppedData) async {
              // Convert Uint8List to base64-encoded string
              String base64String = base64Encode(croppedData);

              // Create a new FFUploadedFile instance using the cropped data
              FFUploadedFile newCroppedImage = FFUploadedFile(
                name: filename!, // You may set a name for the new file
                bytes: Uint8List.fromList(croppedData),
              );

              // Assuming FFAppState() is a singleton, you might want to create an instance and store it.
              FFAppState appState = FFAppState();

              // Set the uploadCroppedImage property in the FFAppState
              // Update the app state variable with base64String
              setState(() {
                // appState.croppedImageFile = newCroppedImage.bytes;
                appState.croppedImage = base64String;
              });

              Navigator.pop(context, {
                'croppedFile': newCroppedImage,
                'croppedBytes': base64String,
              });
              // print("checking old image: $_imageData");
              // print("checking $base64String");
              // print("i am checking which data is passing $newCroppedImage");
              // print("checking cropped data $croppedImage");

              await widget.onCrop.call();
            },
            controller: _cropController,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: FFButtonWidget(
          onPressed: () async {
            _cropController.crop();
          },
          text: 'Crop Image',
          options: FFButtonOptions(
            height: 40,
            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ]));
  }
}
