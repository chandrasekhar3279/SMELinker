import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'growth_plan_detail_apply_widget.dart' show GrowthPlanDetailApplyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GrowthPlanDetailApplyModel
    extends FlutterFlowModel<GrowthPlanDetailApplyWidget> {
  ///  Local state fields for this page.

  List<String> checkedcriteria = [];
  void addToCheckedcriteria(String item) => checkedcriteria.add(item);
  void removeFromCheckedcriteria(String item) => checkedcriteria.remove(item);
  void removeAtIndexFromCheckedcriteria(int index) =>
      checkedcriteria.removeAt(index);
  void insertAtIndexInCheckedcriteria(int index, String item) =>
      checkedcriteria.insert(index, item);
  void updateCheckedcriteriaAtIndex(int index, Function(String) updateFn) =>
      checkedcriteria[index] = updateFn(checkedcriteria[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.

  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Backend Call - API (brnNumberCheck)] action in Button widget.
  ApiCallResponse? apiResult47p;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
