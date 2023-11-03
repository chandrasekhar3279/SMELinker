import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_product_widget.dart' show EditProductWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditProductModel extends FlutterFlowModel<EditProductWidget> {
  ///  Local state fields for this component.

  bool isImageUploaded = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for editProductName widget.
  FocusNode? editProductNameFocusNode;
  TextEditingController? editProductNameController;
  String? Function(BuildContext, String?)? editProductNameControllerValidator;
  String? _editProductNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name cannot be empty.';
    }

    return null;
  }

  // State field(s) for editproductDesc widget.
  FocusNode? editproductDescFocusNode;
  TextEditingController? editproductDescController;
  String? Function(BuildContext, String?)? editproductDescControllerValidator;
  String? _editproductDescControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Description cannot be empty.';
    }

    if (val.length > 300) {
      return 'Maximum 300 characters allowed.';
    }

    return null;
  }

  // State field(s) for editProductPrice widget.
  FocusNode? editProductPriceFocusNode;
  TextEditingController? editProductPriceController;
  String? Function(BuildContext, String?)? editProductPriceControllerValidator;
  String? _editProductPriceControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Price cannot be empty';
    }

    return null;
  }

  // State field(s) for editProductDropDown widget.
  String? editProductDropDownValue;
  FormFieldController<String>? editProductDropDownValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (updateProduct)] action in Button widget.
  ApiCallResponse? apiResultob6;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    editProductNameControllerValidator = _editProductNameControllerValidator;
    editproductDescControllerValidator = _editproductDescControllerValidator;
    editProductPriceControllerValidator = _editProductPriceControllerValidator;
  }

  void dispose() {
    editProductNameFocusNode?.dispose();
    editProductNameController?.dispose();

    editproductDescFocusNode?.dispose();
    editproductDescController?.dispose();

    editProductPriceFocusNode?.dispose();
    editProductPriceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
