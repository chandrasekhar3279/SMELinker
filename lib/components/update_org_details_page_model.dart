import '/backend/api_requests/api_calls.dart';
import '/components/change_interest_selection_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_org_details_page_widget.dart' show UpdateOrgDetailsPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateOrgDetailsPageModel
    extends FlutterFlowModel<UpdateOrgDetailsPageWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for companyName widget.
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  String? _companyNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Company name cannot be empty';
    }

    return null;
  }

  // State field(s) for brnNumber widget.
  TextEditingController? brnNumberController;
  String? Function(BuildContext, String?)? brnNumberControllerValidator;
  String? _brnNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'BRN Number cannot be empty';
    }

    if (val.length < 9) {
      return 'Please insert a valid BRN';
    }
    if (val.length > 9) {
      return 'Please insert a valid BRN';
    }

    return null;
  }

  // State field(s) for TradeLicenseNumber widget.
  TextEditingController? tradeLicenseNumberController;
  String? Function(BuildContext, String?)?
      tradeLicenseNumberControllerValidator;
  // State field(s) for countryOfRegion widget.
  String? countryOfRegionValue;
  FormFieldController<String>? countryOfRegionValueController;
  // State field(s) for industries widget.
  String? industriesValue;
  FormFieldController<String>? industriesValueController;
  // State field(s) for yearofLaunch widget.
  String? yearofLaunchValue;
  FormFieldController<String>? yearofLaunchValueController;
  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  String? _descriptionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'About cannot be empty';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (updateOrgDetails)] action in Button widget.
  ApiCallResponse? apiResult3zcCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    companyNameControllerValidator = _companyNameControllerValidator;
    brnNumberControllerValidator = _brnNumberControllerValidator;
    descriptionControllerValidator = _descriptionControllerValidator;
  }

  void dispose() {
    companyNameController?.dispose();
    brnNumberController?.dispose();
    tradeLicenseNumberController?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
