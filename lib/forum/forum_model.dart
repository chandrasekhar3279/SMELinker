import '/backend/api_requests/api_calls.dart';
import '/components/forum_answer_widget.dart';
import '/components/forum_answer_with_in_reply_widget.dart';
import '/components/more_details_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:async';
import 'forum_widget.dart' show ForumWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForumModel extends FlutterFlowModel<ForumWidget> {
  ///  Local state fields for this page.

  bool showQuestionActions = false;

  int? answerFieldQuestionId;

  bool showAnswerActions = false;

  bool submittedForumQuestionForm = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for questionText widget.
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;
  String? _questionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Question cannot be empty';
    }

    if (val.length > 300) {
      return 'Maximum 300 characters allowed';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (submitQuestion)] action in IconButton widget.
  ApiCallResponse? apiResult9fnCopyCopy;
  // Models for ForumAnswer dynamic component.
  late FlutterFlowDynamicModels<ForumAnswerModel> forumAnswerModels;
  // Models for MoreDetails dynamic component.
  late FlutterFlowDynamicModels<MoreDetailsModel> moreDetailsModels1;
  // Stores action output result for [Backend Call - API (setForumHelpfulness)] action in IconThumbsUpOutline widget.
  ApiCallResponse? apiResult2mn;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (setForumHelpfulness)] action in IconThumbsUpFill widget.
  ApiCallResponse? apiResult2mnCopy;
  // Stores action output result for [Backend Call - API (setForumUnHelpfulness)] action in IconThumbsDownOutline widget.
  ApiCallResponse? apiResult1i6;
  // Stores action output result for [Backend Call - API (setForumUnHelpfulness)] action in IconThumbsDownFill widget.
  ApiCallResponse? apiResult1i6Copy;
  // Models for MoreDetails dynamic component.
  late FlutterFlowDynamicModels<MoreDetailsModel> moreDetailsModels2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    questionTextControllerValidator = _questionTextControllerValidator;
    forumAnswerModels = FlutterFlowDynamicModels(() => ForumAnswerModel());
    moreDetailsModels1 = FlutterFlowDynamicModels(() => MoreDetailsModel());
    moreDetailsModels2 = FlutterFlowDynamicModels(() => MoreDetailsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    questionTextController?.dispose();
    forumAnswerModels.dispose();
    moreDetailsModels1.dispose();
    moreDetailsModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
