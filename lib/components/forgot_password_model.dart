import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for resetpasswordemail widget.
  TextEditingController? resetpasswordemailController;
  String? Function(BuildContext, String?)?
      resetpasswordemailControllerValidator;
  String? _resetpasswordemailControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please provide a valid email';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (resetPassword)] action in Button widget.
  ApiCallResponse? apiResulte45;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    resetpasswordemailControllerValidator =
        _resetpasswordemailControllerValidator;
  }

  void dispose() {
    resetpasswordemailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
