import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_service_widget.dart' show EditServiceWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditServiceModel extends FlutterFlowModel<EditServiceWidget> {
  ///  Local state fields for this component.

  bool? isImageUploaded = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for editserviceName widget.
  FocusNode? editserviceNameFocusNode;
  TextEditingController? editserviceNameController;
  String? Function(BuildContext, String?)? editserviceNameControllerValidator;
  String? _editserviceNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Title cannot be empty';
    }

    if (val.length < 3) {
      return 'Minimum 3 characters required';
    }

    return null;
  }

  // State field(s) for editServiceDesc widget.
  FocusNode? editServiceDescFocusNode;
  TextEditingController? editServiceDescController;
  String? Function(BuildContext, String?)? editServiceDescControllerValidator;
  String? _editServiceDescControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Descripption cannot be empty';
    }

    return null;
  }

  // State field(s) for editServicecategoryList widget.
  String? editServicecategoryListValue;
  FormFieldController<String>? editServicecategoryListValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for minTimeTextField widget.
  FocusNode? minTimeTextFieldFocusNode;
  TextEditingController? minTimeTextFieldController;
  String? Function(BuildContext, String?)? minTimeTextFieldControllerValidator;
  String? _minTimeTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*required';
    }

    if (!RegExp('^(?:[0-5])\$').hasMatch(val)) {
      return '*0 - 5 allowed';
    }
    return null;
  }

  // State field(s) for maxTimeTextField widget.
  FocusNode? maxTimeTextFieldFocusNode;
  TextEditingController? maxTimeTextFieldController;
  String? Function(BuildContext, String?)? maxTimeTextFieldControllerValidator;
  String? _maxTimeTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*required';
    }

    if (!RegExp('^(?:[0-5])\$').hasMatch(val)) {
      return '*0 - 5 allowed';
    }
    return null;
  }

  // State field(s) for minCostTextField widget.
  FocusNode? minCostTextFieldFocusNode;
  TextEditingController? minCostTextFieldController;
  String? Function(BuildContext, String?)? minCostTextFieldControllerValidator;
  String? _minCostTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*required';
    }

    if (!RegExp('^(?:[0-9]|[1-9][0-9]{0,5}|1000000)\$').hasMatch(val)) {
      return '*0 - 1000000 allowed';
    }
    return null;
  }

  // State field(s) for maxCostTextField widget.
  FocusNode? maxCostTextFieldFocusNode;
  TextEditingController? maxCostTextFieldController;
  String? Function(BuildContext, String?)? maxCostTextFieldControllerValidator;
  String? _maxCostTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*required';
    }

    if (!RegExp('^(?:[0-9]|[1-9][0-9]{0,5}|1000000)\$').hasMatch(val)) {
      return '*0 - 1000000 allowed';
    }
    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (updateServiceCard)] action in Button widget.
  ApiCallResponse? apiResultzo6;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    editserviceNameControllerValidator = _editserviceNameControllerValidator;
    editServiceDescControllerValidator = _editServiceDescControllerValidator;
    minTimeTextFieldControllerValidator = _minTimeTextFieldControllerValidator;
    maxTimeTextFieldControllerValidator = _maxTimeTextFieldControllerValidator;
    minCostTextFieldControllerValidator = _minCostTextFieldControllerValidator;
    maxCostTextFieldControllerValidator = _maxCostTextFieldControllerValidator;
  }

  void dispose() {
    editserviceNameFocusNode?.dispose();
    editserviceNameController?.dispose();

    editServiceDescFocusNode?.dispose();
    editServiceDescController?.dispose();

    minTimeTextFieldFocusNode?.dispose();
    minTimeTextFieldController?.dispose();

    maxTimeTextFieldFocusNode?.dispose();
    maxTimeTextFieldController?.dispose();

    minCostTextFieldFocusNode?.dispose();
    minCostTextFieldController?.dispose();

    maxCostTextFieldFocusNode?.dispose();
    maxCostTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
