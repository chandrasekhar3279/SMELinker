import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_product_widget.dart' show AddProductWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddProductModel extends FlutterFlowModel<AddProductWidget> {
  ///  Local state fields for this component.

  bool isImageUploaded = false;

  bool imageSizeError = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for serviceName widget.
  FocusNode? serviceNameFocusNode;
  TextEditingController? serviceNameController;
  String? Function(BuildContext, String?)? serviceNameControllerValidator;
  String? _serviceNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Product name cannot be empty';
    }

    return null;
  }

  // State field(s) for productDesc widget.
  FocusNode? productDescFocusNode;
  TextEditingController? productDescController;
  String? Function(BuildContext, String?)? productDescControllerValidator;
  String? _productDescControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Product description cannot be empty';
    }

    return null;
  }

  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceController;
  String? Function(BuildContext, String?)? priceControllerValidator;
  String? _priceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Product price cannot be empty';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (createProduct)] action in Button widget.
  ApiCallResponse? apiResulth0gCopyCopyCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    serviceNameControllerValidator = _serviceNameControllerValidator;
    productDescControllerValidator = _productDescControllerValidator;
    priceControllerValidator = _priceControllerValidator;
  }

  void dispose() {
    serviceNameFocusNode?.dispose();
    serviceNameController?.dispose();

    productDescFocusNode?.dispose();
    productDescController?.dispose();

    priceFocusNode?.dispose();
    priceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
