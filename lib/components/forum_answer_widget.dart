import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'forum_answer_model.dart';
export 'forum_answer_model.dart';

class ForumAnswerWidget extends StatefulWidget {
  const ForumAnswerWidget({
    Key? key,
    this.forumAnswer,
    this.questionId,
  }) : super(key: key);

  final String? forumAnswer;
  final dynamic questionId;

  @override
  _ForumAnswerWidgetState createState() => _ForumAnswerWidgetState();
}

class _ForumAnswerWidgetState extends State<ForumAnswerWidget> {
  late ForumAnswerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForumAnswerModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
          child: FutureBuilder<ApiCallResponse>(
            future: SmeGroup.getOrgDetailsCall.call(
              accessToken: FFAppState().accessToken,
              userId: 0,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitFadingCircle(
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              final rowGetOrgDetailsResponse = snapshot.data!;
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (getJsonField(
                        rowGetOrgDetailsResponse.jsonBody,
                        r'''$.logo''',
                      ) !=
                      null)
                    Container(
                      width: 30.0,
                      height: 30.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        valueOrDefault<String>(
                          getJsonField(
                            functions.image(getJsonField(
                              rowGetOrgDetailsResponse.jsonBody,
                              r'''$.logo''',
                            ).toString()),
                            r'''$.image''',
                          ),
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  if (getJsonField(
                        rowGetOrgDetailsResponse.jsonBody,
                        r'''$.logo''',
                      ) ==
                      null)
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFA6400),
                        shape: BoxShape.circle,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            functions.profilePicName(getJsonField(
                              rowGetOrgDetailsResponse.jsonBody,
                              r'''$.companyName''',
                            ).toString()),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 100),
                          () async {
                            setState(() {
                              FFAppState().tagListPopup = false;
                              FFAppState().taggableUsersList = [];
                            });
                            _model.gettingTagableAPIres =
                                await SmeGroup.getTaggableUsersCall.call(
                              accessToken: FFAppState().accessToken,
                              companyNameWithChars: functions
                                  .findMyText(_model.textController.text),
                            );
                            setState(() {
                              FFAppState().tagListPopup = true;
                              FFAppState().taggableUsersList = getJsonField(
                                (_model.gettingTagableAPIres?.jsonBody ?? ''),
                                r'''$[:]''',
                                true,
                              )!
                                  .toList()
                                  .cast<dynamic>();
                            });

                            setState(() {});
                          },
                        ),
                        onFieldSubmitted: (_) async {
                          if ((FFAppState().forumAnswerInputQuestionId ==
                                  getJsonField(
                                    widget.questionId,
                                    r'''$.questionId''',
                                  )) &&
                              true) {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                          }
                        },
                        textCapitalization: TextCapitalization.sentences,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter your answer',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).borderColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      setState(() {
                        FFAppState().forumAnswerInputQuestionId = getJsonField(
                          widget.questionId,
                          r'''$.questionId''',
                        );
                      });
                      if (FFAppState().forumAnswerInputQuestionId ==
                          getJsonField(
                            widget.questionId,
                            r'''$.questionId''',
                          )) {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        _model.apiResultw3eCopyCopy =
                            await SmeGroup.submitAnswersCall.call(
                          questionId: getJsonField(
                            widget.questionId,
                            r'''$.questionId''',
                          ),
                          answer: _model.textController.text,
                          mentionsJson: 0,
                          accessToken: FFAppState().accessToken,
                        );
                        if ((_model.apiResultw3eCopyCopy?.succeeded ?? true)) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                title: Text('Great!'),
                                content: Text('We\'ve received your answer.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ));
                            },
                          );

                          context.goNamed('Forum');

                          setState(() {
                            _model.textController?.clear();
                          });
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                title: Text('Error'),
                                content: Text(
                                    'This comment seems irrelevant or inappropriate and can\'t be posted'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Close'),
                                  ),
                                ],
                              ));
                            },
                          );
                        }
                      }

                      setState(() {});
                    },
                    child: Icon(
                      Icons.send_sharp,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 22.0,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
