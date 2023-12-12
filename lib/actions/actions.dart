import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future checkAuth(BuildContext context) async {
  ApiCallResponse? apiResponse;

  apiResponse = await SmeGroup.getProfileDetailsCall.call(
    accessToken: FFAppState().accessToken,
  );
  if (!(apiResponse?.succeeded ?? true)) {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
            child: AlertDialog(
          title: Text('Session expired.'),
          content: Text('Please login again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        ));
      },
    );
    FFAppState().update(() {
      FFAppState().deleteAccessToken();
      FFAppState().accessToken = '';
    });

    context.goNamed('Login');
  }
}
