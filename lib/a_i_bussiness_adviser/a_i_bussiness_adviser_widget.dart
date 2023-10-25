import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_i_bussiness_adviser_model.dart';
export 'a_i_bussiness_adviser_model.dart';

class AIBussinessAdviserWidget extends StatefulWidget {
  const AIBussinessAdviserWidget({Key? key}) : super(key: key);

  @override
  _AIBussinessAdviserWidgetState createState() =>
      _AIBussinessAdviserWidgetState();
}

class _AIBussinessAdviserWidgetState extends State<AIBussinessAdviserWidget> {
  late AIBussinessAdviserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AIBussinessAdviserModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 22.0,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'AI Business Advisor',
            style: FlutterFlowTheme.of(context).headlineLarge,
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (_model.chatMode == false)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      controller: _model.columnController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                130.0, 50.0, 130.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 126.0,
                              decoration: BoxDecoration(),
                              child: Image.asset(
                                'assets/images/Subtract.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 50.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Hi! I’m your AI Business Advisor. I’m here to help you level up your business.',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 40.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Type something like',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 30.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.chatMode = true;
                                setState(() {
                                  _model.chatHistory = functions
                                      .saveChatHistory(
                                          _model.chatHistory.toList(),
                                          'Find out what the successful businesses are doing to grow their revenue.',
                                          _model.initialChatScript)
                                      .toList()
                                      .cast<String>();
                                });
                                _model.cTAQ1Response =
                                    await SmeGroup.generateAiResponseCall.call(
                                  question:
                                      'Find out what the successful businesses are doing to grow their revenue.',
                                  accessToken: FFAppState().accessToken,
                                );
                                setState(() {
                                  _model.loadingState = true;
                                  _model.submittedBizAIForm = false;
                                });
                                if ((_model.aIBusinessAdviserAPIResponse
                                        ?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.loadingState = false;
                                  });
                                  setState(() {
                                    _model.chatHistory = functions
                                        .saveChatHistory(
                                            _model.chatHistory.toList(),
                                            getJsonField(
                                              (_model.aIBusinessAdviserAPIResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$['message']''',
                                            ).toString(),
                                            _model.initialChatScript)
                                        .toList()
                                        .cast<String>();
                                  });
                                  setState(() {
                                    _model.textController?.clear();
                                  });
                                }
                                await Future.delayed(
                                    const Duration(milliseconds: 200));
                                await _model.listViewController?.animateTo(
                                  _model.listViewController!.position
                                      .maxScrollExtent,
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );

                                setState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '“Find out what the successful businesses are doing to grow their revenue.” ',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 30.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.chatMode = true;
                                setState(() {
                                  _model.chatHistory = functions
                                      .saveChatHistory(
                                          _model.chatHistory.toList(),
                                          'Strategies to build & maintain a reliable IT system.',
                                          _model.initialChatScript)
                                      .toList()
                                      .cast<String>();
                                });
                                _model.cTAQ2Response =
                                    await SmeGroup.generateAiResponseCall.call(
                                  question:
                                      'Strategies to build & maintain a reliable IT system.',
                                  accessToken: FFAppState().accessToken,
                                );
                                setState(() {
                                  _model.loadingState = true;
                                  _model.submittedBizAIForm = false;
                                });
                                if ((_model.aIBusinessAdviserAPIResponse
                                        ?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.loadingState = false;
                                  });
                                  setState(() {
                                    _model.chatHistory = functions
                                        .saveChatHistory(
                                            _model.chatHistory.toList(),
                                            getJsonField(
                                              (_model.aIBusinessAdviserAPIResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$['message']''',
                                            ).toString(),
                                            _model.initialChatScript)
                                        .toList()
                                        .cast<String>();
                                  });
                                  setState(() {
                                    _model.textController?.clear();
                                  });
                                }
                                await Future.delayed(
                                    const Duration(milliseconds: 200));
                                await _model.listViewController?.animateTo(
                                  _model.listViewController!.position
                                      .maxScrollExtent,
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );

                                setState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '“Strategies to build & maintain a reliable IT system.“',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (_model.chatMode == true)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final chat = _model.chatHistory.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: chat.length,
                                itemBuilder: (context, chatIndex) {
                                  final chatItem = chat[chatIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (chatIndex % 2 == 0)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 10.0, 16.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width >=
                                                          1170.0) {
                                                        return 700.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <=
                                                          470.0) {
                                                        return 330.0;
                                                      } else {
                                                        return 530.0;
                                                      }
                                                    }(),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(16.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(16.0),
                                                      topRight:
                                                          Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                12.0,
                                                                12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .removeFromString(
                                                                  chatItem,
                                                                  _model
                                                                      .initialChatScript),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (_model.loadingState ?? true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 10.0, 16.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEAEAEA),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    child: Image.asset(
                                                      'assets/images/typing_indicator.gif',
                                                      width: 60.0,
                                                      height: 30.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (!valueOrDefault<bool>(
                                              _model.loadingState,
                                              false,
                                            ) &&
                                            (chatIndex % 2 != 0))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 10.0, 16.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width >=
                                                              1170.0) {
                                                            return 700.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <=
                                                              470.0) {
                                                            return 330.0;
                                                          } else {
                                                            return 530.0;
                                                          }
                                                        }(),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  16.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  16.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  16.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                    12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              chatItem,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await Clipboard.setData(
                                                              ClipboardData(
                                                                  text:
                                                                      chatItem));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Response copied to clipboard.',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .content_copy,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 10.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Copy response',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                },
                                controller: _model.listViewController,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Material(
                    color: Colors.transparent,
                    elevation: 1.0,
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 100),
                                  () async {
                                    if ((_model.submittedBizAIForm == true) &&
                                        ((_model.textController.text != null &&
                                                _model.textController.text !=
                                                    '') ||
                                            (_model.textController.text ==
                                                    null ||
                                                _model.textController.text ==
                                                    ''))) {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                    }
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Ask me anything...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .borderColor,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: FaIcon(
                              FontAwesomeIcons.paperPlane,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              setState(() {
                                _model.submittedBizAIForm = true;
                              });
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              _model.chatMode = true;
                              setState(() {
                                _model.chatHistory = functions
                                    .saveChatHistory(
                                        _model.chatHistory.toList(),
                                        _model.textController.text,
                                        _model.initialChatScript)
                                    .toList()
                                    .cast<String>();
                              });
                              _model.aIBusinessAdviserAPIResponse =
                                  await SmeGroup.generateAiResponseCall.call(
                                question: _model.textController.text,
                                accessToken: FFAppState().accessToken,
                              );
                              setState(() {
                                _model.loadingState = true;
                                _model.submittedBizAIForm = false;
                              });
                              if ((_model.aIBusinessAdviserAPIResponse
                                      ?.succeeded ??
                                  true)) {
                                setState(() {
                                  _model.loadingState = false;
                                });
                                setState(() {
                                  _model.chatHistory = functions
                                      .saveChatHistory(
                                          _model.chatHistory.toList(),
                                          getJsonField(
                                            (_model.aIBusinessAdviserAPIResponse
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$['message']''',
                                          ).toString(),
                                          _model.initialChatScript)
                                      .toList()
                                      .cast<String>();
                                });
                                setState(() {
                                  _model.textController?.clear();
                                });
                              }
                              await Future.delayed(
                                  const Duration(milliseconds: 200));
                              await _model.listViewController?.animateTo(
                                _model.listViewController!.position
                                    .maxScrollExtent,
                                duration: Duration(milliseconds: 100),
                                curve: Curves.ease,
                              );

                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
