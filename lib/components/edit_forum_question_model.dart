import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_forum_question_widget.dart' show EditForumQuestionWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditForumQuestionModel extends FlutterFlowModel<EditForumQuestionWidget> {
  ///  Local state fields for this component.

  bool? submittedEditQuestionForm;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionController;
  String? Function(BuildContext, String?)? questionControllerValidator;
  String? _questionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Question cannot be empty';
    }

    if (val.length > 300) {
      return 'Maximum 300 characters allowed';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (updateQuestion)] action in Button widget.
  ApiCallResponse? apiResult53z;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    questionControllerValidator = _questionControllerValidator;
  }

  void dispose() {
    questionFocusNode?.dispose();
    questionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
