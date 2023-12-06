import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_image_model.dart';
export 'select_image_model.dart';

class SelectImageWidget extends StatefulWidget {
  const SelectImageWidget({
    Key? key,
    this.selectedImage,
    this.cropShape,
    this.cropPercentage,
  }) : super(key: key);

  final FFUploadedFile? selectedImage;
  final String? cropShape;
  final double? cropPercentage;

  @override
  _SelectImageWidgetState createState() => _SelectImageWidgetState();
}

class _SelectImageWidgetState extends State<SelectImageWidget> {
  late SelectImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.00, 0.00),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.CropImageViewWidget(
                        width: double.infinity,
                        height: double.infinity,
                        cropShape: widget.cropShape!,
                        cropPercentage: widget.cropPercentage!,
                        resetText: 'Reset',
                        zoomText: 'Zoom',
                        rotateText: 'Rotate',
                        saveText: 'Save',
                        cancelText: 'Cancel',
                        originalImage: widget.selectedImage!,
                        onCancel: () async {
                          await actions.clearCroppImageShareCache();
                          Navigator.pop(context);
                        },
                        onCrop: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
