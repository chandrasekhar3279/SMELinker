import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_view_forum_answer_component_model.dart';
export 'empty_list_view_forum_answer_component_model.dart';

class EmptyListViewForumAnswerComponentWidget extends StatefulWidget {
  const EmptyListViewForumAnswerComponentWidget({
    super.key,
    this.listIsFor,
  });

  final String? listIsFor;

  @override
  State<EmptyListViewForumAnswerComponentWidget> createState() =>
      _EmptyListViewForumAnswerComponentWidgetState();
}

class _EmptyListViewForumAnswerComponentWidgetState
    extends State<EmptyListViewForumAnswerComponentWidget> {
  late EmptyListViewForumAnswerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => EmptyListViewForumAnswerComponentModel());
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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: Text(
              'No ${widget.listIsFor}s found',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
