import '/backend/api_requests/api_calls.dart';
import '/components/group_edit_widget.dart';
import '/components/withdrawrequest_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'group_detailpage_widget.dart' show GroupDetailpageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class GroupDetailpageModel extends FlutterFlowModel<GroupDetailpageWidget> {
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
  // Stores action output result for [Backend Call - API ( joinGroups)] action in Container widget.
  ApiCallResponse? joinGroupRes;
  Completer<ApiCallResponse>? apiRequestCompleter;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
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
