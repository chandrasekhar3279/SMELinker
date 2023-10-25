import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_team_member_widget.dart' show AddTeamMemberWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTeamMemberModel extends FlutterFlowModel<AddTeamMemberWidget> {
  ///  Local state fields for this component.

  bool? isImageUploaded = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name cannot be empty';
    }

    if (val.length > 50) {
      return 'Maximum 50 characters allowed';
    }
    if (!RegExp('^[A-Za-z]+(?: [A-Za-z]+)*\$').hasMatch(val)) {
      return 'Name should only contain alphabets';
    }
    return null;
  }

  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  String? _titleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Provide role of the member';
    }

    return null;
  }

  // State field(s) for LinkedInProfile widget.
  FocusNode? linkedInProfileFocusNode;
  TextEditingController? linkedInProfileController;
  String? Function(BuildContext, String?)? linkedInProfileControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (createTeamMember)] action in Button widget.
  ApiCallResponse? apiResultrukCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    titleControllerValidator = _titleControllerValidator;
  }

  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();

    titleFocusNode?.dispose();
    titleController?.dispose();

    linkedInProfileFocusNode?.dispose();
    linkedInProfileController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
