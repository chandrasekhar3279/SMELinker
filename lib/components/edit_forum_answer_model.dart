import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_forum_answer_widget.dart' show EditForumAnswerWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditForumAnswerModel extends FlutterFlowModel<EditForumAnswerWidget> {
  ///  Local state fields for this component.

  bool? submittedEditAnswerForm = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for answerField widget.
  TextEditingController? answerFieldController;
  String? Function(BuildContext, String?)? answerFieldControllerValidator;
  String? _answerFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Answer cannot be empty';
    }

    if (val.length > 350) {
      return 'Maximum 350 characters allowed';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (updateAnswer)] action in Button widget.
  ApiCallResponse? apiResultggj;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    answerFieldControllerValidator = _answerFieldControllerValidator;
  }

  void dispose() {
    answerFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
