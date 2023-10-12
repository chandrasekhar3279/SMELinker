import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'e_k_y_b_verification_page_widget.dart' show EKYBVerificationPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EKYBVerificationPageModel
    extends FlutterFlowModel<EKYBVerificationPageWidget> {
  ///  Local state fields for this page.

  String compnayStatus = 'ACTIVE';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for companyName widget.
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  // State field(s) for LicenseNo widget.
  TextEditingController? licenseNoController;
  String? Function(BuildContext, String?)? licenseNoControllerValidator;
  // State field(s) for countryRegion widget.
  String? countryRegionValue;
  FormFieldController<String>? countryRegionValueController;
  // Stores action output result for [Backend Call - API (updateOrgDetails)] action in Button widget.
  ApiCallResponse? apiResultshn;
  // Stores action output result for [Backend Call - API (ekybverifycompany)] action in Button widget.
  ApiCallResponse? eKYBverificationResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    companyNameController?.dispose();
    licenseNoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
