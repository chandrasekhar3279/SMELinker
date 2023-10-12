import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for oldPassword widget.
  TextEditingController? oldPasswordController;
  late bool oldPasswordVisibility;
  String? Function(BuildContext, String?)? oldPasswordControllerValidator;
  String? _oldPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your rold password';
    }

    return null;
  }

  // State field(s) for NewPassword widget.
  TextEditingController? newPasswordController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordControllerValidator;
  String? _newPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter new password';
    }

    if (val.length < 8) {
      return 'Minimum 8 characters required';
    }

    return null;
  }

  // State field(s) for ConfirmPassword widget.
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  String? _confirmPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please re-enter our new password';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (changeUserPassword)] action in Button widget.
  ApiCallResponse? apiResulthl1Copy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    oldPasswordVisibility = false;
    oldPasswordControllerValidator = _oldPasswordControllerValidator;
    newPasswordVisibility = false;
    newPasswordControllerValidator = _newPasswordControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordControllerValidator = _confirmPasswordControllerValidator;
  }

  void dispose() {
    oldPasswordController?.dispose();
    newPasswordController?.dispose();
    confirmPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
