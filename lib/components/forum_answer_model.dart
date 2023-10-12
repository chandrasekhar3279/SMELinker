import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'forum_answer_widget.dart' show ForumAnswerWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForumAnswerModel extends FlutterFlowModel<ForumAnswerWidget> {
  ///  Local state fields for this component.

  bool submittedForumAnswerForm = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Answer cannot be empty';
    }

    if (val.length > 350) {
      return 'Maximum 350 characters allowed';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (getTaggableUsers)] action in TextField widget.
  ApiCallResponse? gettingTagableAPIres;
  // Stores action output result for [Backend Call - API (submitAnswers)] action in Icon widget.
  ApiCallResponse? apiResultw3eCopyCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  void dispose() {
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
