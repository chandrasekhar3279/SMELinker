import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_placeholder_model.dart';
export 'chat_placeholder_model.dart';

class ChatPlaceholderWidget extends StatefulWidget {
  const ChatPlaceholderWidget({Key? key}) : super(key: key);

  @override
  _ChatPlaceholderWidgetState createState() => _ChatPlaceholderWidgetState();
}

class _ChatPlaceholderWidgetState extends State<ChatPlaceholderWidget> {
  late ChatPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPlaceholderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(130.0, 50.0, 130.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 126.0,
              decoration: BoxDecoration(),
              child: Image.asset(
                'assets/images/Subtract.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Hi! I’m your AI Business Advisor. I’m here to help you level up your business.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Type something like',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    '“Find out what the successful businesses are doing to grow their revenue.” ',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    '“Strategies to build & maintain a reliable IT system.“',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
