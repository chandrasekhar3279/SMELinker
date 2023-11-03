import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_comment_widget.dart' show EditCommentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditCommentModel extends FlutterFlowModel<EditCommentWidget> {
  ///  Local state fields for this component.

  bool? submittedEditFeedComment = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for commentField widget.
  FocusNode? commentFieldFocusNode;
  TextEditingController? commentFieldController;
  String? Function(BuildContext, String?)? commentFieldControllerValidator;
  // Stores action output result for [Backend Call - API (updateFeedComment)] action in Button widget.
  ApiCallResponse? apiResult734;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    commentFieldFocusNode?.dispose();
    commentFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
