import '/backend/api_requests/api_calls.dart';
import '/components/add_product_widget.dart';
import '/components/add_service_widget.dart';
import '/components/add_team_member_widget.dart';
import '/components/banner_change_widget.dart';
import '/components/delete_team_member_widget.dart';
import '/components/edit_my_story_widget.dart';
import '/components/empty_list_view_component_widget.dart';
import '/components/follow_list_widget.dart';
import '/components/get_in_touch_details_widget.dart';
import '/components/more_details_widget.dart';
import '/components/update_org_details_page_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'company_detail_widget.dart' show CompanyDetailWidget;
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CompanyDetailModel extends FlutterFlowModel<CompanyDetailWidget> {
  ///  Local state fields for this page.

  bool? showProductActions;

  bool? showServiceActions;

  bool showMoreContent = false;

  bool showContent = false;

  String businessHealthCheckBadge = 'Business Resilience Health Check';

  String lokaleHealthBadge = 'Lokal Is Beautiful';

  String investHealthCheckBadge = 'Investment Readiness Health Check';

  List<String> healthCheckArray = [];
  void addToHealthCheckArray(String item) => healthCheckArray.add(item);
  void removeFromHealthCheckArray(String item) => healthCheckArray.remove(item);
  void removeAtIndexFromHealthCheckArray(int index) =>
      healthCheckArray.removeAt(index);
  void insertAtIndexInHealthCheckArray(int index, String item) =>
      healthCheckArray.insert(index, item);
  void updateHealthCheckArrayAtIndex(int index, Function(String) updateFn) =>
      healthCheckArray[index] = updateFn(healthCheckArray[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getHeaderBannerInfo)] action in CompanyDetail widget.
  ApiCallResponse? headerBannerAPIResponse;
  // Stores action output result for [Backend Call - API (addFollower)] action in Text widget.
  ApiCallResponse? apiResultixj;
  // Stores action output result for [Backend Call - API (unFollow)] action in Text widget.
  ApiCallResponse? apiResultlb3;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // Stores action output result for [Backend Call - API (bookProduct)] action in Container widget.
  ApiCallResponse? apiResultvn5;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Models for MoreDetails dynamic component.
  late FlutterFlowDynamicModels<MoreDetailsModel> moreDetailsModels1;
  // Stores action output result for [Backend Call - API (bookService)] action in Container widget.
  ApiCallResponse? apiResultService;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Models for MoreDetails dynamic component.
  late FlutterFlowDynamicModels<MoreDetailsModel> moreDetailsModels2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    moreDetailsModels1 = FlutterFlowDynamicModels(() => MoreDetailsModel());
    moreDetailsModels2 = FlutterFlowDynamicModels(() => MoreDetailsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    moreDetailsModels1.dispose();
    moreDetailsModels2.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    expandableController4.dispose();
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
