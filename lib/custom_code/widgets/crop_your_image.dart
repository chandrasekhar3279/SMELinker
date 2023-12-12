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

import '../../flutter_flow/flutter_flow_widgets.dart';

import '../../components/croped_upload_image_widget.dart';

import '../../components/edit_profile_widget.dart';

import 'dart:convert';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:s_m_e_linker/custom_code/widgets/cropped_file_preview.dart';

import 'dart:convert';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:s_m_e_linker/custom_code/widgets/cropped_file_preview.dart';
import 'dart:typed_data';

class CropYourImage extends StatefulWidget {
  const CropYourImage({
    Key? key,
    this.width,
    this.height,
    this.oldImage,
    required this.onCrop,
  }) : super(key: key);

  final double? width;
  final double? height;
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

    // Convert FFUploadedFile to Uint8List
    final Uint8List? imageDataBytes =
        _imageData != null ? _imageData.bytes?.buffer.asUint8List() : null;

    return Container(
        child: Column(children: [
      // Text("Crop your imagess"),
      Expanded(
        child: Crop(
          image: imageDataBytes!,
          aspectRatio: 1.0,
          onCropped: (Uint8List croppedData) async {
            // Create a new FFUploadedFile instance using the cropped data
            FFUploadedFile newCroppedImage = FFUploadedFile(
              name: "Cropped Image", // You may set a name for the new file
              bytes: Uint8List.fromList(croppedData),
            );

            // MemoryImage croppedImage = MemoryImage(croppedData);
            // FFUploadedFile newCropedImage = croppedImage;
            // FFAppState().update(() {setState(() => FFAppState(). = data); });

            // Update the page state variable
            // widget.updatedCroppedImage(newCroppedImage);

            // Pop the navigation
            // Navigator.pop(context);

            // Handle the cropped image data as needed
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => CropedUploadImageWidget(
            //       cropeduploadedImagePreview: newCroppedImage,
            //     ),
            //   ),
            // );

            // print("checking $newCroppedImage");
            Navigator.pop(context, {'croppedFile': newCroppedImage.bytes});
            print(
                "i am checking which data is passing ${newCroppedImage.bytes}");
            // print("checking cropped data $croppedImage");

            await widget.onCrop.call();
          },
          controller: _cropController,
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
            height: 50,
            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ]));
  }
}
