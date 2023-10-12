import '/backend/api_requests/api_calls.dart';
import '/components/emptycomments_widget.dart';
import '/components/more_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'feed_detail_widget.dart' show FeedDetailWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedDetailModel extends FlutterFlowModel<FeedDetailWidget> {
  ///  Local state fields for this page.

  bool showMoreComment = false;

  bool submittedCommentForm = false;

  int? taggedId;

  String? taggedCompanyName;

  List<int> mentions = [];
  void addToMentions(int item) => mentions.add(item);
  void removeFromMentions(int item) => mentions.remove(item);
  void removeAtIndexFromMentions(int index) => mentions.removeAt(index);
  void insertAtIndexInMentions(int index, int item) =>
      mentions.insert(index, item);
  void updateMentionsAtIndex(int index, Function(int) updateFn) =>
      mentions[index] = updateFn(mentions[index]);

  List<String> mentionsCompanyNames = [];
  void addToMentionsCompanyNames(String item) => mentionsCompanyNames.add(item);
  void removeFromMentionsCompanyNames(String item) =>
      mentionsCompanyNames.remove(item);
  void removeAtIndexFromMentionsCompanyNames(int index) =>
      mentionsCompanyNames.removeAt(index);
  void insertAtIndexInMentionsCompanyNames(int index, String item) =>
      mentionsCompanyNames.insert(index, item);
  void updateMentionsCompanyNamesAtIndex(
          int index, Function(String) updateFn) =>
      mentionsCompanyNames[index] = updateFn(mentionsCompanyNames[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for commentText widget.
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  String? _commentTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Comment cannot be empty';
    }

    if (val.length > 350) {
      return 'Maximum 350 characters allowed';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (getTaggableUsers)] action in commentText widget.
  ApiCallResponse? gettingTagableAPIres;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Stores action output result for [Backend Call - API (submitFeedComment)] action in sendComment widget.
  ApiCallResponse? apiResult6c1;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Models for MoreDetails dynamic component.
  late FlutterFlowDynamicModels<MoreDetailsModel> moreDetailsModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    commentTextControllerValidator = _commentTextControllerValidator;
    moreDetailsModels = FlutterFlowDynamicModels(() => MoreDetailsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    commentTextController?.dispose();
    moreDetailsModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
