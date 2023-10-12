import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'a_i_bussiness_adviser_widget.dart' show AIBussinessAdviserWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AIBussinessAdviserModel
    extends FlutterFlowModel<AIBussinessAdviserWidget> {
  ///  Local state fields for this page.

  String? inputContent;

  List<String> chatHistory = [];
  void addToChatHistory(String item) => chatHistory.add(item);
  void removeFromChatHistory(String item) => chatHistory.remove(item);
  void removeAtIndexFromChatHistory(int index) => chatHistory.removeAt(index);
  void insertAtIndexInChatHistory(int index, String item) =>
      chatHistory.insert(index, item);
  void updateChatHistoryAtIndex(int index, Function(String) updateFn) =>
      chatHistory[index] = updateFn(chatHistory[index]);

  String initialChatScript =
      'I want you to act as an IT Expert. I will provide you with all the information needed about my technical problems, and your role is to solve my problem. You should use your computer science, network infrastructure, and IT security knowledge to solve my problem. Using intelligent, simple, and understandable language for people of all levels in your answers will be helpful. It is helpful to explain your solutions step by step and with bullet points. Try to avoid too many technical details, but use them when necessary. I want you to reply with the solution, not write any explanations.';

  bool chatMode = false;

  bool? loadingState;

  bool? submittedBizAIForm;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Backend Call - API (generateAiResponse)] action in Row widget.
  ApiCallResponse? cTAQ1Response;
  // Stores action output result for [Backend Call - API (generateAiResponse)] action in Row widget.
  ApiCallResponse? cTAQ2Response;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your query.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (generateAiResponse)] action in IconButton widget.
  ApiCallResponse? aIBusinessAdviserAPIResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
    textControllerValidator = _textControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    listViewController?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
