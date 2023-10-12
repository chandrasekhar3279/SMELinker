import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'emptycomments_model.dart';
export 'emptycomments_model.dart';

class EmptycommentsWidget extends StatefulWidget {
  const EmptycommentsWidget({Key? key}) : super(key: key);

  @override
  _EmptycommentsWidgetState createState() => _EmptycommentsWidgetState();
}

class _EmptycommentsWidgetState extends State<EmptycommentsWidget> {
  late EmptycommentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptycommentsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Text(
            'Be the first to comment',
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
        ),
      ],
    );
  }
}
