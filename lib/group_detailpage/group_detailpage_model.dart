import '/backend/api_requests/api_calls.dart';
import '/components/withdrawrequest_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'group_detailpage_widget.dart' show GroupDetailpageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
