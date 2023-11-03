import '/backend/api_requests/api_calls.dart';
import '/components/interest_selection_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  bool accepttedTermsAndConditions = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  String? _firstNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your first name';
    }

    if (val.length < 3) {
      return 'First Name should contain at least 3 characters';
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  String? _lastNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your last name';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please insert a valid email address';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Your email address should contain \'@\' and a valid domain';
    }
    return null;
  }

  // State field(s) for position widget.
  FocusNode? positionFocusNode;
  TextEditingController? positionController;
  String? Function(BuildContext, String?)? positionControllerValidator;
  String? _positionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter position';
    }

    if (val.length < 3) {
      return 'Position/Title should contain at least 3 characters';
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter password';
    }

    if (val.length < 8) {
      return 'Your password must contain at least 8 characters';
    }

    return null;
  }

  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  String? _confirmPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter confirm password';
    }

    return null;
  }

  // State field(s) for companyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  String? _companyNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter company name';
    }

    if (val.length < 3) {
      return 'Company Name should contain at least 3 characters';
    }

    return null;
  }

  // State field(s) for industry widget.
  String? industryValue;
  FormFieldController<String>? industryValueController;
  // State field(s) for regNumber widget.
  FocusNode? regNumberFocusNode;
  TextEditingController? regNumberController;
  String? Function(BuildContext, String?)? regNumberControllerValidator;
  String? _regNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter CRN';
    }

    if (val.length < 9) {
      return 'Please insert a valid CRN';
    }
    if (val.length > 9) {
      return 'The format is YYYY/XXXXXX/ZZ where YYYY is the Year and ZZ is the CompanyType';
    }

    return null;
  }

  // State field(s) for tradeLicenseNumber widget.
  FocusNode? tradeLicenseNumberFocusNode;
  TextEditingController? tradeLicenseNumberController;
  String? Function(BuildContext, String?)?
      tradeLicenseNumberControllerValidator;
  // State field(s) for countryOfRegion widget.
  String? countryOfRegionValue;
  FormFieldController<String>? countryOfRegionValueController;
  // State field(s) for businessBanking widget.
  FocusNode? businessBankingFocusNode;
  TextEditingController? businessBankingController;
  String? Function(BuildContext, String?)? businessBankingControllerValidator;
  String? _businessBankingControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for refered widget.
  String? referedValue;
  FormFieldController<String>? referedValueController;
  // State field(s) for CheckboxTermsAndConditions widget.
  bool? checkboxTermsAndConditionsValue;
  // Stores action output result for [Backend Call - API (RegisterUser)] action in ButtonRegister widget.
  ApiCallResponse? signUpResponseCopy2;
  // Stores action output result for [Backend Call - API (RegisterUser)] action in ButtonRegister widget.
  ApiCallResponse? signUpResponseCopyCopyCopy;
  // Stores action output result for [Backend Call - API ( registerUqudoSME)] action in ButtonRegister widget.
  ApiCallResponse? registerUqudoSMEAPIResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    firstNameControllerValidator = _firstNameControllerValidator;
    lastNameControllerValidator = _lastNameControllerValidator;
    emailControllerValidator = _emailControllerValidator;
    positionControllerValidator = _positionControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordControllerValidator = _confirmPasswordControllerValidator;
    companyNameControllerValidator = _companyNameControllerValidator;
    regNumberControllerValidator = _regNumberControllerValidator;
    businessBankingControllerValidator = _businessBankingControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    positionFocusNode?.dispose();
    positionController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    regNumberFocusNode?.dispose();
    regNumberController?.dispose();

    tradeLicenseNumberFocusNode?.dispose();
    tradeLicenseNumberController?.dispose();

    businessBankingFocusNode?.dispose();
    businessBankingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
