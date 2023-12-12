import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.croppedFileRes = await actions.convertBase64ToFile(
        FFAppState().croppedImage,
      );
      setState(() {
        _model.croppedData = _model.base64Res;
      });
    });
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
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 400.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.CropYourImage(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    oldImage: widget.selectedImage,
                    onCrop: () async {
                      _model.base64Res = await actions.convertBase64ToFile(
                        FFAppState().croppedImage,
                      );
                      setState(() {
                        _model.croppedData = _model.base64Res;
                      });

                      setState(() {});
                    },
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
