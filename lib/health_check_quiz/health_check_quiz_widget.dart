import '/backend/api_requests/api_calls.dart';
import '/components/health_check_options_component_widget.dart';
import '/components/health_check_report_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'health_check_quiz_model.dart';
export 'health_check_quiz_model.dart';

class HealthCheckQuizWidget extends StatefulWidget {
  const HealthCheckQuizWidget({
    super.key,
    required this.healthCheckContent,
  });

  final dynamic healthCheckContent;

  @override
  State<HealthCheckQuizWidget> createState() => _HealthCheckQuizWidgetState();
}

class _HealthCheckQuizWidgetState extends State<HealthCheckQuizWidget> {
  late HealthCheckQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthCheckQuizModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkAuth(context);
      setState(() {
        _model.loading = true;
      });
      _model.getHealthCheckContentResponse =
          await SmeGroup.getHealthCheckContentCall.call(
        accessToken: FFAppState().accessToken,
        healthCheckId: getJsonField(
          widget.healthCheckContent,
          r'''$.id''',
        ),
      );
      if ((_model.getHealthCheckContentResponse?.succeeded ?? true)) {
        setState(() {
          _model.healthCheckResponse =
              (_model.getHealthCheckContentResponse?.jsonBody ?? '');
        });
        _model.aPIgetSavedUserResponse =
            await SmeGroup.getSavedUserResponsesCall.call(
          accessToken: FFAppState().accessToken,
          healthCheckId: getJsonField(
            widget.healthCheckContent,
            r'''$.id''',
          ),
        );
        if ((_model.aPIgetSavedUserResponse?.succeeded ?? true)) {
          setState(() {
            _model.savedUserResponses =
                (_model.aPIgetSavedUserResponse?.jsonBody ?? '');
          });
          setState(() {
            _model.loading = false;
          });
        }
      }
    });

    _model.expandableController2 = ExpandableController(initialExpanded: false);
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).secondaryText),
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (_model.loading == true)
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/loading-indicator.gif',
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Text(
                            'Please wait while we load your test...',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (_model.loading == false)
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  getJsonField(
                                    widget.healthCheckContent,
                                    r'''$.name''',
                                  ).toString(),
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  getJsonField(
                                    widget.healthCheckContent,
                                    r'''$.description''',
                                  ).toString(),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final category = getJsonField(
                                  functions.healthCheckQuizData(
                                      _model.healthCheckResponse!,
                                      _model.savedUserResponses!),
                                  r'''$''',
                                ).toList();
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(category.length,
                                        (categoryIndex) {
                                      final categoryItem =
                                          category[categoryIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    getJsonField(
                                                      categoryItem,
                                                      r'''$.topic''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge,
                                                  ),
                                                ),
                                                Text(
                                                  '${getJsonField(
                                                    categoryItem,
                                                    r'''$.currTopAnsCount''',
                                                  ).toString()} / ${functions.lengthOfMyArray(getJsonField(
                                                        categoryItem,
                                                        r'''$.questions''',
                                                        true,
                                                      )!).toString()} questions',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    final questions =
                                                        getJsonField(
                                                      categoryItem,
                                                      r'''$.questions''',
                                                    ).toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          questions.length,
                                                          (questionsIndex) {
                                                        final questionsItem =
                                                            questions[
                                                                questionsIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent3,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          8.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        color: Color(
                                                                            0x00000000),
                                                                        child:
                                                                            ExpandableNotifier(
                                                                          initialExpanded:
                                                                              false,
                                                                          child:
                                                                              ExpandablePanel(
                                                                            header:
                                                                                Text(
                                                                              getJsonField(
                                                                                questionsItem,
                                                                                r'''$.question''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge,
                                                                            ),
                                                                            collapsed:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                            expanded:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                wrapWithModel(
                                                                                  model: _model.healthCheckOptionsComponentModels.getModel(
                                                                                    getJsonField(
                                                                                      questionsItem,
                                                                                      r'''$.id''',
                                                                                    ).toString(),
                                                                                    questionsIndex,
                                                                                  ),
                                                                                  updateCallback: () => setState(() {}),
                                                                                  updateOnChange: true,
                                                                                  child: HealthCheckOptionsComponentWidget(
                                                                                    key: Key(
                                                                                      'Keybpu_${getJsonField(
                                                                                        questionsItem,
                                                                                        r'''$.id''',
                                                                                      ).toString()}',
                                                                                    ),
                                                                                    healthCheckId: getJsonField(
                                                                                      _model.healthCheckResponse,
                                                                                      r'''$.healthCheckId''',
                                                                                    ),
                                                                                    topic: getJsonField(
                                                                                      categoryItem,
                                                                                      r'''$.topic''',
                                                                                    ).toString(),
                                                                                    questionId: getJsonField(
                                                                                      questionsItem,
                                                                                      r'''$.id''',
                                                                                    ),
                                                                                    options: getJsonField(
                                                                                      questionsItem,
                                                                                      r'''$.answers''',
                                                                                      true,
                                                                                    )!,
                                                                                    healthCheckContentParameter: _model.healthCheckResponse!,
                                                                                    healthCheckAnswersParameter: _model.savedUserResponses!,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            theme:
                                                                                ExpandableThemeData(
                                                                              tapHeaderToExpand: true,
                                                                              tapBodyToExpand: false,
                                                                              tapBodyToCollapse: false,
                                                                              headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                              hasIcon: true,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (getJsonField(
                                                                    questionsItem,
                                                                    r'''$.done''',
                                                                  ) ==
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 4.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 24.0, 16.0, 24.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Submit',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller: _model.expandableController2,
                                      child: ExpandablePanel(
                                        header: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 0.0, 16.0),
                                          child: Text(
                                            'Your benchmarking',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge,
                                          ),
                                        ),
                                        collapsed: Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        expanded: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Text(
                                                  'We’ll use your response to calculate your score with recommendations to improve your business.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Text(
                                                  'Please review your response carefully before submitting as you will not be allowed to take the ${getJsonField(
                                                    widget.healthCheckContent,
                                                    r'''$.name''',
                                                  ).toString()} for the next 3 months.',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge,
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: !functions
                                                        .allQuizQuestionsAnswered(
                                                            getJsonField(
                                                  functions.healthCheckQuizData(
                                                      _model
                                                          .healthCheckResponse!,
                                                      _model
                                                          .savedUserResponses!),
                                                  r'''$''',
                                                ))
                                                    ? null
                                                    : () async {
                                                        _model.savedAnswers =
                                                            await SmeGroup
                                                                .getSavedUserResponsesCall
                                                                .call(
                                                          accessToken:
                                                              FFAppState()
                                                                  .accessToken,
                                                          healthCheckId:
                                                              getJsonField(
                                                            widget
                                                                .healthCheckContent,
                                                            r'''$.id''',
                                                          ),
                                                        );
                                                        if ((_model.savedAnswers
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.submitAnswerssAPIResponse =
                                                              await SmeGroup
                                                                  .submitAnswerssCall
                                                                  .call(
                                                            accessToken:
                                                                FFAppState()
                                                                    .accessToken,
                                                            healthCheckAnswersJson:
                                                                (_model.savedAnswers
                                                                        ?.jsonBody ??
                                                                    ''),
                                                          );
                                                          if ((_model
                                                                  .submitAnswerssAPIResponse
                                                                  ?.succeeded ??
                                                              true)) {
                                                            FFAppState()
                                                                .update(() {});
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0x00FFFFFF),
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        child:
                                                                            HealthCheckReportWidget(
                                                                          healthcheckReport:
                                                                              widget.healthCheckContent,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                text: 'Calculate My Score',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 24.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  disabledColor:
                                                      Color(0x5F003DA6),
                                                  disabledTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
