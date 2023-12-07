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

import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../actions/clear_cropp_image_share_cache.dart';

import '../../flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert'; // Import the dart:convert library

import 'dart:ui';
import "dart:math" show pi;
import '../../flutter_flow/flutter_flow_icon_button.dart';
import 'package:custom_image_crop/custom_image_crop.dart';

class CropImageViewWidget extends StatefulWidget {
  const CropImageViewWidget({
    Key? key,
    this.width,
    this.height,
    required this.originalImage,
    required this.cropShape,
    required this.cropPercentage,
    required this.resetText,
    required this.zoomText,
    required this.rotateText,
    required this.saveText,
    required this.cancelText,
    required this.onCancel,
    required this.onCrop,
  }) : super(key: key);

  final double? width;
  final double? height;
  final FFUploadedFile originalImage;
  final String cropShape;
  final double cropPercentage;
  final String resetText;
  final String zoomText;
  final String rotateText;
  final String saveText;
  final String cancelText;
  final Future<dynamic> Function() onCancel;
  final Future<dynamic> Function() onCrop;

  @override
  _CropImageViewWidgetState createState() => _CropImageViewWidgetState();
}

class _CropImageViewWidgetState extends State<CropImageViewWidget> {
  late GlobalKey _croperKey;
  late CustomImageCropController _croppController;
  late CropImageWidgetShareState _shareState;
  late CustomCropShape _customCropShape;

  @override
  void initState() {
    super.initState();
    _croperKey = GlobalKey(debugLabel: 'myCropImageWidget');
    _croppController = CustomImageCropController();
    _shareState = CropImageWidgetShareState();
    _customCropShape = widget.cropShape.toLowerCase() == 'circle'
        ? CustomCropShape.Circle
        : CustomCropShape.Square;
  }

  // Local state to hold the cropped image
  // Image? outputImage;

  @override
  void dispose() {
    _croppController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomImageCrop(
                  key: _croperKey,
                  cropController: _croppController,
                  image: MemoryImage(widget.originalImage.bytes!),
                  shape: _customCropShape,
                  cropPercentage: _getCropPercentage(),
                  backgroundColor: Colors.black,
                  // drawPath: SolidCropPathPainter.drawPath,
                  // initialAreaBuilder: (rect) => Rect.fromLTRB(rect.left + 80,
                  //     rect.top + 80, rect.right - 80, rect.bottom - 80),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    _croppController.reset();
                  },
                  text: isWeb ? this.widget.resetText : '', //Reset
                  icon: Icon(
                    Icons.replay_outlined,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    height: 50,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 40,
                          icon: Icon(
                            Icons.zoom_out_outlined,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 20,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _croppController
                                .addTransition(CropImageData(scale: 0.95));
                          },
                        ),
                        Container(
                          width: 1,
                          height: 35,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                            child: Text(
                              this.widget.zoomText, //'Zoom',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                  ),
                            ),
                          ),
                        Container(
                          width: 1,
                          height: 35,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 40,
                          icon: Icon(
                            Icons.zoom_in_rounded,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 20,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _croppController
                                .addTransition(CropImageData(scale: 1.12));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 40,
                          icon: Icon(
                            Icons.rotate_left_rounded,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 20,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _croppController
                                .addTransition(CropImageData(angle: -pi / 4));
                          },
                        ),
                        Container(
                          width: 1,
                          height: 35,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                            child: Text(
                              this.widget.rotateText, //'Rotate'
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                            ),
                          ),
                        Container(
                          width: 1,
                          height: 35,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 40,
                          icon: Icon(
                            Icons.rotate_right_rounded,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 20,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _croppController
                                .addTransition(CropImageData(angle: pi / 4));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    this.widget.onCancel.call();
                  },
                  text: this.widget.cancelText, //Cancel,
                  options: FFButtonOptions(
                    height: 50,
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await _cropImage();
                  },
                  text: this.widget.saveText, //Save
                  options: FFButtonOptions(
                    height: 50,
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _getCropPercentage() {
    if (widget.cropPercentage < 0) {
      return 0.1;
    } else if (widget.cropPercentage > 1) {
      return 1.0;
    }

    return widget.cropPercentage;
  }

  Future<void> _cropImage() async {
    try {
      MemoryImage? croppedImage = await _croppController.onCropImage();

      if (croppedImage != null) {
        FFUploadedFile newUploadedFile = FFUploadedFile(
          name: widget.originalImage.name,
          bytes: croppedImage.bytes,
          height: widget.originalImage.height,
          width: widget.originalImage.width,
        );
        // Encode the image bytes to base64
        String base64Image = base64Encode(croppedImage.bytes);

        // Assuming FFAppState() is a singleton, you might want to create an instance and store it.
        FFAppState appState = FFAppState();

        // Set the uploadCroppedImage property in the FFAppState
        appState.uploadCroppedImage = base64Image!;

        //  to update the app state using the update method or similar.
        appState.update(() async {
          // 3. Call the onCrop callback function provided in the widget.
          await widget.onCrop.call();
        });
        // Print the correct property from the app state.
        print("checking ${appState.uploadCroppedImage}");
      } else {
        // Handle the case where croppedImage is null (optional)
        // You may want to log an error or take appropriate action
        print("Error: croppedImage is null");
      }
    } catch (e) {
      // Handle exceptions that may occur during the cropping process.
      print("Error cropping image: $e");
    }
  }
}

class CropImageWidgetShareState {
  // Assuming CroppedImageData is a class with 'bytes' and 'name' properties
  CroppedImageData? _croppedImageData;

  set croppedImageData(CroppedImageData? value) {
    _croppedImageData = value;
  }

  CroppedImageData? get croppedImageData => _croppedImageData;

  void clear() {
    // Add any necessary cleanup logic here
    _croppedImageData = null;
  }
}

class CroppedImageData {
  String? name;
  List<int>? bytes;

  CroppedImageData({
    this.name,
    this.bytes,
  });

  factory CroppedImageData.fromFFUploadedFile(FFUploadedFile file) {
    return CroppedImageData(
      name: file.name ?? '',
      bytes: file.bytes ?? [],
    );
  }
}
