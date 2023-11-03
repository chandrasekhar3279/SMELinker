import '/backend/api_requests/api_calls.dart';
import '/components/health_check_options_component_widget.dart';
import '/components/health_check_report_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'health_check_quiz_widget.dart' show HealthCheckQuizWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HealthCheckQuizModel extends FlutterFlowModel<HealthCheckQuizWidget> {
  ///  Local state fields for this page.

  int? selectedId;

  bool loading = false;

  dynamic healthCheckResponse;

  dynamic savedUserResponses;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getHealthCheckContent)] action in HealthCheckQuiz widget.
  ApiCallResponse? getHealthCheckContentResponse;
  // Stores action output result for [Backend Call - API (getSavedUserResponses)] action in HealthCheckQuiz widget.
  ApiCallResponse? aPIgetSavedUserResponse;
  // Models for HealthCheckOptionsComponent dynamic component.
  late FlutterFlowDynamicModels<HealthCheckOptionsComponentModel>
      healthCheckOptionsComponentModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // Stores action output result for [Backend Call - API (getSavedUserResponses)] action in Button widget.
  ApiCallResponse? savedAnswers;
  // Stores action output result for [Backend Call - API (submitAnswerss)] action in Button widget.
  ApiCallResponse? submitAnswerssAPIResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    healthCheckOptionsComponentModels =
        FlutterFlowDynamicModels(() => HealthCheckOptionsComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    healthCheckOptionsComponentModels.dispose();
    expandableController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
