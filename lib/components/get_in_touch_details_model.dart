import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'get_in_touch_details_widget.dart' show GetInTouchDetailsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GetInTouchDetailsModel extends FlutterFlowModel<GetInTouchDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for address widget.
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  String? _addressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Address cannot be empty';
    }

    return null;
  }

  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email cannot be empty';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please provide a valid email';
    }
    return null;
  }

  // State field(s) for linkedIn widget.
  TextEditingController? linkedInController;
  String? Function(BuildContext, String?)? linkedInControllerValidator;
  // State field(s) for webSite widget.
  TextEditingController? webSiteController;
  String? Function(BuildContext, String?)? webSiteControllerValidator;
  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone Number cannot be empty';
    }

    if (!RegExp('^\\+971[- ]?\\d{4}[- ]?\\d{4}\$').hasMatch(val)) {
      return 'Invalid format eg: +971 XXXX XXXX or +971-XXXX-XXXX';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (editContactDetail)] action in Button widget.
  ApiCallResponse? apiResultkcpCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addressControllerValidator = _addressControllerValidator;
    emailControllerValidator = _emailControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
  }

  void dispose() {
    addressController?.dispose();
    emailController?.dispose();
    linkedInController?.dispose();
    webSiteController?.dispose();
    phoneNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
