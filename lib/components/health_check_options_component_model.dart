import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'health_check_options_component_widget.dart'
    show HealthCheckOptionsComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HealthCheckOptionsComponentModel
    extends FlutterFlowModel<HealthCheckOptionsComponentWidget> {
  ///  Local state fields for this component.

  List<dynamic> allOptions = [];
  void addToAllOptions(dynamic item) => allOptions.add(item);
  void removeFromAllOptions(dynamic item) => allOptions.remove(item);
  void removeAtIndexFromAllOptions(int index) => allOptions.removeAt(index);
  void insertAtIndexInAllOptions(int index, dynamic item) =>
      allOptions.insert(index, item);
  void updateAllOptionsAtIndex(int index, Function(dynamic) updateFn) =>
      allOptions[index] = updateFn(allOptions[index]);

  int? userSelectedOptionId;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (saveUserResponses)] action in Row widget.
  ApiCallResponse? saveAnswerAPIResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
