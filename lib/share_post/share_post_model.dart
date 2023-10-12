import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'share_post_widget.dart' show SharePostWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SharePostModel extends FlutterFlowModel<SharePostWidget> {
  ///  Local state fields for this page.

  String resourceType = 'article';

  bool isImageUploaded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldPostTitle widget.
  TextEditingController? textFieldPostTitleController;
  String? Function(BuildContext, String?)?
      textFieldPostTitleControllerValidator;
  String? _textFieldPostTitleControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Title cannot be empty';
    }

    if (val.length < 3) {
      return 'equiredMinimum 3 characters r';
    }

    return null;
  }

  // State field(s) for TextFieldvideoPostTitle widget.
  TextEditingController? textFieldvideoPostTitleController;
  String? Function(BuildContext, String?)?
      textFieldvideoPostTitleControllerValidator;
  String? _textFieldvideoPostTitleControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'requiredMinimum 4 characters ';
    }

    return null;
  }

  // State field(s) for TextFieldDocumentPostTitle widget.
  TextEditingController? textFieldDocumentPostTitleController;
  String? Function(BuildContext, String?)?
      textFieldDocumentPostTitleControllerValidator;
  String? _textFieldDocumentPostTitleControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Minimum 5 characters required';
    }

    return null;
  }

  // State field(s) for FeedUrl widget.
  TextEditingController? feedUrlController;
  String? Function(BuildContext, String?)? feedUrlControllerValidator;
  String? _feedUrlControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'URL cannot be empty';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Please provide a valid URL';
    }
    return null;
  }

  // State field(s) for provideDocUrl widget.
  TextEditingController? provideDocUrlController;
  String? Function(BuildContext, String?)? provideDocUrlControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // Stores action output result for [Backend Call - API (shareFeed)] action in ButtonLogin widget.
  ApiCallResponse? apiResultjklCopyCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldPostTitleControllerValidator =
        _textFieldPostTitleControllerValidator;
    textFieldvideoPostTitleControllerValidator =
        _textFieldvideoPostTitleControllerValidator;
    textFieldDocumentPostTitleControllerValidator =
        _textFieldDocumentPostTitleControllerValidator;
    feedUrlControllerValidator = _feedUrlControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldPostTitleController?.dispose();
    textFieldvideoPostTitleController?.dispose();
    textFieldDocumentPostTitleController?.dispose();
    feedUrlController?.dispose();
    provideDocUrlController?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
