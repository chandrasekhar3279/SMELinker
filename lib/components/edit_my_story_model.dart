import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_my_story_widget.dart' show EditMyStoryWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditMyStoryModel extends FlutterFlowModel<EditMyStoryWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for pastTitle widget.
  TextEditingController? pastTitleController;
  String? Function(BuildContext, String?)? pastTitleControllerValidator;
  String? _pastTitleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This is a required field';
    }

    return null;
  }

  // State field(s) for pastDesc widget.
  TextEditingController? pastDescController;
  String? Function(BuildContext, String?)? pastDescControllerValidator;
  String? _pastDescControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This is a required field';
    }

    return null;
  }

  // State field(s) for nowTitle widget.
  TextEditingController? nowTitleController;
  String? Function(BuildContext, String?)? nowTitleControllerValidator;
  String? _nowTitleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This is a required field';
    }

    return null;
  }

  // State field(s) for nowDesc widget.
  TextEditingController? nowDescController;
  String? Function(BuildContext, String?)? nowDescControllerValidator;
  String? _nowDescControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This is a required field';
    }

    return null;
  }

  // State field(s) for futureTitle widget.
  TextEditingController? futureTitleController;
  String? Function(BuildContext, String?)? futureTitleControllerValidator;
  String? _futureTitleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This is a required field';
    }

    return null;
  }

  // State field(s) for futureDesc widget.
  TextEditingController? futureDescController;
  String? Function(BuildContext, String?)? futureDescControllerValidator;
  String? _futureDescControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This is a required field';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (addStory)] action in Button widget.
  ApiCallResponse? apiResult9kkCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pastTitleControllerValidator = _pastTitleControllerValidator;
    pastDescControllerValidator = _pastDescControllerValidator;
    nowTitleControllerValidator = _nowTitleControllerValidator;
    nowDescControllerValidator = _nowDescControllerValidator;
    futureTitleControllerValidator = _futureTitleControllerValidator;
    futureDescControllerValidator = _futureDescControllerValidator;
  }

  void dispose() {
    pastTitleController?.dispose();
    pastDescController?.dispose();
    nowTitleController?.dispose();
    nowDescController?.dispose();
    futureTitleController?.dispose();
    futureDescController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
