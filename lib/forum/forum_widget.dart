import '/backend/api_requests/api_calls.dart';
import '/components/forum_answer_widget.dart';
import '/components/forum_answer_with_in_reply_widget.dart';
import '/components/more_details_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'forum_model.dart';
export 'forum_model.dart';

class ForumWidget extends StatefulWidget {
  const ForumWidget({
    Key? key,
    this.questionId,
  }) : super(key: key);

  final String? questionId;

  @override
  _ForumWidgetState createState() => _ForumWidgetState();
}

class _ForumWidgetState extends State<ForumWidget> {
  late ForumModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForumModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkAuth(context);
      setState(() {
        FFAppState().showForumQuestionActions = false;
        FFAppState().showForumAnswerActions = false;
      });
    });

    _model.questionTextController ??= TextEditingController();
    _model.questionTextFocusNode ??= FocusNode();
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

    return FutureBuilder<ApiCallResponse>(
      future: SmeGroup.getProfileDetailsCall.call(
        accessToken: FFAppState().accessToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final forumGetProfileDetailsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  context.pushNamed('AIBussinessAdviser');

                  setState(() {
                    _model.showAnswerActions = false;
                    _model.showQuestionActions = false;
                  });
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                child: Image.asset(
                  'assets/images/Chat-Boat.png',
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.contain,
                ),
              ),
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: FaIcon(
                    FontAwesomeIcons.search,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                title: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('Search');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(40.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).borderColor,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-0.75, 0.0),
                      child: Text(
                        'Search',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: Color(0xFF57636C),
                              fontSize: 12.0,
                            ),
                      ),
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: SmeGroup.getProfileDetailsCall.call(
                        accessToken: FFAppState().accessToken,
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
                        final rowGetProfileDetailsResponse = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (getJsonField(
                                  rowGetProfileDetailsResponse.jsonBody,
                                  r'''$.image''',
                                ) !=
                                null)
                              Container(
                                width: 45.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Profile');
                                  },
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        getJsonField(
                                          functions.image(getJsonField(
                                            rowGetProfileDetailsResponse
                                                .jsonBody,
                                            r'''$.image''',
                                          ).toString()),
                                          r'''$.image''',
                                        ).toString(),
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            if (getJsonField(
                                  rowGetProfileDetailsResponse.jsonBody,
                                  r'''$.image''',
                                ) ==
                                null)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('Profile');
                                },
                                child: Container(
                                  width: 45.0,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        functions.profilePicName(getJsonField(
                                          rowGetProfileDetailsResponse.jsonBody,
                                          r'''$.firstName''',
                                        ).toString()),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: SmeGroup.getTopActiveCall.call(
                      accessToken: FFAppState().accessToken,
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
                      final columnGetTopActiveResponse = snapshot.data!;
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().showForumQuestionActions = false;
                          FFAppState().showForumAnswerActions = false;
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                'Need help? Ask a question  to the community.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('All'),
                                  ChipData('Top Active')
                                ],
                                onChanged: (val) => setState(
                                    () => _model.choiceChipsValue = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                  iconColor: Colors.white,
                                  iconSize: 0.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  elevation: 4.0,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 12.0,
                                      ),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 18.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  elevation: 1.0,
                                ),
                                chipSpacing: 20.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  ['All'],
                                ),
                                wrapped: true,
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (_model.choiceChipsValue == 'All')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future:
                                              SmeGroup.getOrgDetailsCall.call(
                                            accessToken:
                                                FFAppState().accessToken,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowGetOrgDetailsResponse =
                                                snapshot.data!;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (getJsonField(
                                                      rowGetOrgDetailsResponse
                                                          .jsonBody,
                                                      r'''$.logo''',
                                                    ) !=
                                                    null)
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            functions.image(
                                                                getJsonField(
                                                              rowGetOrgDetailsResponse
                                                                  .jsonBody,
                                                              r'''$.logo''',
                                                            ).toString()),
                                                            r'''$.image''',
                                                          ).toString(),
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                if (getJsonField(
                                                      rowGetOrgDetailsResponse
                                                          .jsonBody,
                                                      r'''$.logo''',
                                                    ) ==
                                                    null)
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFA6400),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .profilePicName(
                                                                  getJsonField(
                                                            rowGetOrgDetailsResponse
                                                                .jsonBody,
                                                            r'''$.companyName''',
                                                          ).toString()),
                                                          textAlign:
                                                              TextAlign.center,
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 0.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        child: Form(
                                                          key: _model.formKey,
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .disabled,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .questionTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .questionTextFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.questionTextController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              100),
                                                                      () async {
                                                                        if ((_model.submittedForumQuestionForm ==
                                                                                true) &&
                                                                            ((_model.questionTextController.text != null && _model.questionTextController.text != '') ||
                                                                                (_model.questionTextController.text == null || _model.questionTextController.text == ''))) {
                                                                          if (_model.formKey.currentState == null ||
                                                                              !_model.formKey.currentState!.validate()) {
                                                                            return;
                                                                          }
                                                                        }
                                                                      },
                                                                    ),
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .sentences,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLarge,
                                                                      hintText:
                                                                          'Ask a question',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).borderColor,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(40.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(40.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(40.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(40.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge,
                                                                    validator: _model
                                                                        .questionTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .send_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 20.0,
                                                                  ),
                                                                  showLoadingIndicator:
                                                                      true,
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.submittedForumQuestionForm =
                                                                          true;
                                                                    });
                                                                    if (_model.formKey.currentState ==
                                                                            null ||
                                                                        !_model
                                                                            .formKey
                                                                            .currentState!
                                                                            .validate()) {
                                                                      return;
                                                                    }
                                                                    _model.apiResult9fnCopyCopy =
                                                                        await SmeGroup
                                                                            .submitQuestionCall
                                                                            .call(
                                                                      accessToken:
                                                                          FFAppState()
                                                                              .accessToken,
                                                                      question: _model
                                                                          .questionTextController
                                                                          .text,
                                                                    );
                                                                    if ((_model
                                                                            .apiResult9fnCopyCopy
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                              child: AlertDialog(
                                                                            title:
                                                                                Text('Great'),
                                                                            content:
                                                                                Text('We’ve received your question.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          ));
                                                                        },
                                                                      );
                                                                      setState(
                                                                          () {});
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .questionTextController
                                                                            ?.clear();
                                                                      });

                                                                      context.pushNamed(
                                                                          'Forum');
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                              child: AlertDialog(
                                                                            title:
                                                                                Text('Error'),
                                                                            content:
                                                                                Text('This Question seems irrelevant or inappropriate and can\'t be posted'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Close'),
                                                                              ),
                                                                            ],
                                                                          ));
                                                                        },
                                                                      );
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    if (_model.choiceChipsValue == 'All')
                                      FutureBuilder<ApiCallResponse>(
                                        future: SmeGroup.getQuestionsCall.call(
                                          pageNumber: 0,
                                          pageSize: 100,
                                          accessToken: FFAppState().accessToken,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitFadingCircle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewGetQuestionsResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final content =
                                                  SmeGroup.getQuestionsCall
                                                          .content(
                                                            listViewGetQuestionsResponse
                                                                .jsonBody,
                                                          )
                                                          ?.map((e) => e)
                                                          .toList()
                                                          ?.toList() ??
                                                      [];
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: content.length,
                                                itemBuilder:
                                                    (context, contentIndex) {
                                                  final contentItem =
                                                      content[contentIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (getJsonField(
                                                                              contentItem,
                                                                              r'''$.companyLogo''',
                                                                            ) !=
                                                                            null)
                                                                          Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'CompanyDetailsPage',
                                                                                  queryParameters: {
                                                                                    'userId': serializeParam(
                                                                                      getJsonField(
                                                                                        contentItem,
                                                                                        r'''$.userId''',
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40.0,
                                                                                height: 40.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      functions.image(getJsonField(
                                                                                        contentItem,
                                                                                        r'''$.companyLogo''',
                                                                                      ).toString()),
                                                                                      r'''$.image''',
                                                                                    ).toString(),
                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                                                                  ),
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                              contentItem,
                                                                              r'''$.companyLogo''',
                                                                            ) ==
                                                                            null)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'CompanyDetailsPage',
                                                                                  queryParameters: {
                                                                                    'userId': serializeParam(
                                                                                      getJsonField(
                                                                                        contentItem,
                                                                                        r'''$.userId''',
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40.0,
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFFA6400),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      functions.profilePicName(getJsonField(
                                                                                        contentItem,
                                                                                        r'''$.companyName''',
                                                                                      ).toString()),
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    FFAppState().showForumQuestionActions = false;
                                                                                    FFAppState().showForumAnswerActions = false;
                                                                                  },
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(0.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Stack(
                                                                                      alignment: AlignmentDirectional(0.6499999999999999, -0.6),
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsets.all(8.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                contentItem,
                                                                                                                r'''$.userName''',
                                                                                                              ).toString().maybeHandleOverflow(
                                                                                                                    maxChars: 14,
                                                                                                                    replacement: '…',
                                                                                                                  ),
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                            ),
                                                                                                          ),
                                                                                                          if (getJsonField(
                                                                                                                contentItem,
                                                                                                                r'''$.verifiedProfile''',
                                                                                                              ) ==
                                                                                                              true)
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                              child: Icon(
                                                                                                                Icons.verified,
                                                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                                                size: 18.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          functions.submitedDate(getJsonField(
                                                                                                            contentItem,
                                                                                                            r'''$.capturedDate''',
                                                                                                          )),
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                        ),
                                                                                                        if ((getJsonField(
                                                                                                                  contentItem,
                                                                                                                  r'''$.editable''',
                                                                                                                ) ==
                                                                                                                true) &&
                                                                                                            (getJsonField(
                                                                                                                  contentItem,
                                                                                                                  r'''$.removable''',
                                                                                                                ) ==
                                                                                                                true))
                                                                                                          FlutterFlowIconButton(
                                                                                                            borderColor: Colors.transparent,
                                                                                                            borderRadius: 30.0,
                                                                                                            borderWidth: 1.0,
                                                                                                            buttonSize: 40.0,
                                                                                                            icon: Icon(
                                                                                                              Icons.more_vert,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              size: 20.0,
                                                                                                            ),
                                                                                                            onPressed: () async {
                                                                                                              setState(() {
                                                                                                                FFAppState().showForumAnswerActions = false;
                                                                                                              });
                                                                                                              setState(() {
                                                                                                                FFAppState().showMoreQstn = getJsonField(
                                                                                                                  contentItem,
                                                                                                                  r'''$.questionId''',
                                                                                                                );
                                                                                                              });
                                                                                                              if (FFAppState().showForumQuestionActions == false) {
                                                                                                                FFAppState().showForumQuestionActions = true;
                                                                                                              } else {
                                                                                                                FFAppState().showForumQuestionActions = false;
                                                                                                              }
                                                                                                            },
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          getJsonField(
                                                                                                            contentItem,
                                                                                                            r'''$.question''',
                                                                                                          ).toString(),
                                                                                                          'ask a question',
                                                                                                        ),
                                                                                                        textAlign: TextAlign.start,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Visibility(
                                                                                                    visible: getJsonField(
                                                                                                          contentItem,
                                                                                                          r'''$.groupsData[:]''',
                                                                                                        ) !=
                                                                                                        null,
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                                                      child: Builder(
                                                                                                        builder: (context) {
                                                                                                          final groupsData = getJsonField(
                                                                                                            contentItem,
                                                                                                            r'''$.groupsData[:]''',
                                                                                                          ).toList();
                                                                                                          return SingleChildScrollView(
                                                                                                            scrollDirection: Axis.horizontal,
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                              children: List.generate(groupsData.length, (groupsDataIndex) {
                                                                                                                final groupsDataItem = groupsData[groupsDataIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                                  child: AlignedTooltip(
                                                                                                                    content: Padding(
                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                        child: Text(
                                                                                                                          getJsonField(
                                                                                                                            groupsDataItem,
                                                                                                                            r'''$.groupName''',
                                                                                                                          ).toString(),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                        )),
                                                                                                                    offset: 4.0,
                                                                                                                    preferredDirection: AxisDirection.up,
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                    elevation: 4.0,
                                                                                                                    tailBaseWidth: 24.0,
                                                                                                                    tailLength: 12.0,
                                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                                    showDuration: Duration(milliseconds: 1500),
                                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                                    child: Container(
                                                                                                                      width: 30.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        shape: BoxShape.circle,
                                                                                                                        border: Border.all(
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          width: 1.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      child: Container(
                                                                                                                        width: 11.0,
                                                                                                                        height: 11.0,
                                                                                                                        clipBehavior: Clip.antiAlias,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          shape: BoxShape.circle,
                                                                                                                        ),
                                                                                                                        child: Image.network(
                                                                                                                          getJsonField(
                                                                                                                            functions.image(getJsonField(
                                                                                                                              groupsDataItem,
                                                                                                                              r'''$.groupImg''',
                                                                                                                            ).toString()),
                                                                                                                            r'''$.image''',
                                                                                                                          ).toString(),
                                                                                                                          fit: BoxFit.cover,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              }),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Divider(
                                                                                                thickness: 1.0,
                                                                                              ),
                                                                                              wrapWithModel(
                                                                                                model: _model.forumAnswerModels.getModel(
                                                                                                  getJsonField(
                                                                                                    contentItem,
                                                                                                    r'''$.questionId''',
                                                                                                  ).toString(),
                                                                                                  contentIndex,
                                                                                                ),
                                                                                                updateCallback: () => setState(() {}),
                                                                                                updateOnChange: true,
                                                                                                child: ForumAnswerWidget(
                                                                                                  key: Key(
                                                                                                    'Keyv6d_${getJsonField(
                                                                                                      contentItem,
                                                                                                      r'''$.questionId''',
                                                                                                    ).toString()}',
                                                                                                  ),
                                                                                                  forumAnswer: widget.questionId,
                                                                                                  questionId: contentItem,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        if ((getJsonField(
                                                                                                  contentItem,
                                                                                                  r'''$.questionId''',
                                                                                                ) ==
                                                                                                FFAppState().showMoreQstn) &&
                                                                                            (FFAppState().showForumQuestionActions == true))
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.6, -1.12),
                                                                                            child: wrapWithModel(
                                                                                              model: _model.moreDetailsModels1.getModel(
                                                                                                getJsonField(
                                                                                                  contentItem,
                                                                                                  r'''$.questionId''',
                                                                                                ).toString(),
                                                                                                contentIndex,
                                                                                              ),
                                                                                              updateCallback: () => setState(() {}),
                                                                                              updateOnChange: true,
                                                                                              child: MoreDetailsWidget(
                                                                                                key: Key(
                                                                                                  'Key5y2_${getJsonField(
                                                                                                    contentItem,
                                                                                                    r'''$.questionId''',
                                                                                                  ).toString()}',
                                                                                                ),
                                                                                                question: contentItem,
                                                                                                productItem: null,
                                                                                                serviceItem: null,
                                                                                                answerItem: null,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: FutureBuilder<ApiCallResponse>(
                                                                                    future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                                                                                          ..complete(SmeGroup.getQuestionsCall.call(
                                                                                            pageNumber: 0,
                                                                                            pageSize: 100,
                                                                                            accessToken: FFAppState().accessToken,
                                                                                          )))
                                                                                        .future,
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
                                                                                      final columnGetQuestionsResponse = snapshot.data!;
                                                                                      return Builder(
                                                                                        builder: (context) {
                                                                                          final answersContent = getJsonField(
                                                                                            contentItem,
                                                                                            r'''$.answerList.content''',
                                                                                          ).toList().take(1).toList();
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(answersContent.length, (answersContentIndex) {
                                                                                              final answersContentItem = answersContent[answersContentIndex];
                                                                                              return Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 12.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    FFAppState().showForumQuestionActions = false;
                                                                                                    FFAppState().showForumAnswerActions = false;
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: double.infinity,
                                                                                                    decoration: BoxDecoration(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                                                    child: Stack(
                                                                                                      alignment: AlignmentDirectional(0.7, -0.6),
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 35.0,
                                                                                                                      height: 35.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        shape: BoxShape.circle,
                                                                                                                        border: Border.all(
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      child: Visibility(
                                                                                                                        visible: getJsonField(
                                                                                                                              answersContentItem,
                                                                                                                              r'''$.companyLogo''',
                                                                                                                            ) !=
                                                                                                                            null,
                                                                                                                        child: InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            context.pushNamed(
                                                                                                                              'CompanyDetailsPage',
                                                                                                                              queryParameters: {
                                                                                                                                'userId': serializeParam(
                                                                                                                                  getJsonField(
                                                                                                                                    answersContentItem,
                                                                                                                                    r'''$.userId''',
                                                                                                                                  ),
                                                                                                                                  ParamType.int,
                                                                                                                                ),
                                                                                                                              }.withoutNulls,
                                                                                                                            );
                                                                                                                          },
                                                                                                                          child: Container(
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
                                                                                                                                    answersContentItem,
                                                                                                                                    r'''$.companyLogo''',
                                                                                                                                  ).toString()),
                                                                                                                                  r'''$.image''',
                                                                                                                                ).toString(),
                                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                                                                                                              ),
                                                                                                                              fit: BoxFit.contain,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    if (getJsonField(
                                                                                                                          answersContentItem,
                                                                                                                          r'''$.companyLogo''',
                                                                                                                        ) ==
                                                                                                                        null)
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                        child: InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            context.pushNamed(
                                                                                                                              'CompanyDetailsPage',
                                                                                                                              queryParameters: {
                                                                                                                                'userId': serializeParam(
                                                                                                                                  getJsonField(
                                                                                                                                    answersContentItem,
                                                                                                                                    r'''$.userId''',
                                                                                                                                  ),
                                                                                                                                  ParamType.int,
                                                                                                                                ),
                                                                                                                              }.withoutNulls,
                                                                                                                            );
                                                                                                                          },
                                                                                                                          child: Container(
                                                                                                                            width: 35.0,
                                                                                                                            height: 35.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: Color(0xFFFA6400),
                                                                                                                              shape: BoxShape.circle,
                                                                                                                            ),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  functions.profilePicName(getJsonField(
                                                                                                                                    answersContentItem,
                                                                                                                                    r'''$.companyName''',
                                                                                                                                  ).toString()),
                                                                                                                                  textAlign: TextAlign.center,
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Roboto',
                                                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                    child: Container(
                                                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        borderRadius: BorderRadius.only(
                                                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                                                          bottomRight: Radius.circular(0.0),
                                                                                                                          topLeft: Radius.circular(0.0),
                                                                                                                          topRight: Radius.circular(8.0),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            if (getJsonField(
                                                                                                                                  columnGetQuestionsResponse.jsonBody,
                                                                                                                                  r'''$.content[:].answerCount''',
                                                                                                                                ) !=
                                                                                                                                getJsonField(
                                                                                                                                  columnGetQuestionsResponse.jsonBody,
                                                                                                                                  r'''$.content[:].answerCount''',
                                                                                                                                ))
                                                                                                                              InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  setState(() {
                                                                                                                                    _model.showAnswerActions = false;
                                                                                                                                  });
                                                                                                                                },
                                                                                                                                child: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                  children: [
                                                                                                                                    Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                      children: [
                                                                                                                                        Expanded(
                                                                                                                                          child: Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              Text(
                                                                                                                                                getJsonField(
                                                                                                                                                  answersContentItem,
                                                                                                                                                  r'''$.userName''',
                                                                                                                                                ).toString().maybeHandleOverflow(
                                                                                                                                                      maxChars: 12,
                                                                                                                                                      replacement: '…',
                                                                                                                                                    ),
                                                                                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                                              ),
                                                                                                                                              if (getJsonField(
                                                                                                                                                    answersContentItem,
                                                                                                                                                    r'''$.verifiedProfile''',
                                                                                                                                                  ) ==
                                                                                                                                                  true)
                                                                                                                                                Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: Icon(
                                                                                                                                                    Icons.verified,
                                                                                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                                                                                    size: 18.0,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Row(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                          children: [
                                                                                                                                            Text(
                                                                                                                                              functions.submitedDate(getJsonField(
                                                                                                                                                answersContentItem,
                                                                                                                                                r'''$.capturedDate''',
                                                                                                                                              )),
                                                                                                                                              style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                                            ),
                                                                                                                                            if ((getJsonField(
                                                                                                                                                      answersContentItem,
                                                                                                                                                      r'''$.editable''',
                                                                                                                                                    ) ==
                                                                                                                                                    true) &&
                                                                                                                                                (getJsonField(
                                                                                                                                                      answersContentItem,
                                                                                                                                                      r'''$.removable''',
                                                                                                                                                    ) ==
                                                                                                                                                    true))
                                                                                                                                              FlutterFlowIconButton(
                                                                                                                                                borderColor: Colors.transparent,
                                                                                                                                                borderRadius: 30.0,
                                                                                                                                                borderWidth: 1.0,
                                                                                                                                                buttonSize: 40.0,
                                                                                                                                                icon: Icon(
                                                                                                                                                  Icons.more_vert,
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                  size: 20.0,
                                                                                                                                                ),
                                                                                                                                                onPressed: () async {
                                                                                                                                                  setState(() {
                                                                                                                                                    FFAppState().showForumQuestionActions = false;
                                                                                                                                                  });
                                                                                                                                                  setState(() {
                                                                                                                                                    FFAppState().editAnswerId = getJsonField(
                                                                                                                                                      answersContentItem,
                                                                                                                                                      r'''$.answerId''',
                                                                                                                                                    );
                                                                                                                                                  });
                                                                                                                                                  if (FFAppState().showForumAnswerActions == false) {
                                                                                                                                                    FFAppState().showForumAnswerActions = true;
                                                                                                                                                  } else {
                                                                                                                                                    FFAppState().showForumAnswerActions = false;
                                                                                                                                                  }
                                                                                                                                                },
                                                                                                                                              ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          Expanded(
                                                                                                                                            child: Padding(
                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                                                                                              child: Text(
                                                                                                                                                (String myAnswer) {
                                                                                                                                                  return myAnswer.contains('@');
                                                                                                                                                }(getJsonField(
                                                                                                                                                  answersContentItem,
                                                                                                                                                  r'''$.answer''',
                                                                                                                                                ).toString())
                                                                                                                                                    ? functions.commentTextConvertToString(getJsonField(
                                                                                                                                                        answersContentItem,
                                                                                                                                                        r'''$.answer''',
                                                                                                                                                      ).toString())
                                                                                                                                                    : getJsonField(
                                                                                                                                                        answersContentItem,
                                                                                                                                                        r'''$.answer''',
                                                                                                                                                      ).toString(),
                                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Divider(
                                                                                                                                      thickness: 1.0,
                                                                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              Column(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  if (getJsonField(
                                                                                                                                                        answersContentItem,
                                                                                                                                                        r'''$.helpful''',
                                                                                                                                                      ) ==
                                                                                                                                                      false)
                                                                                                                                                    InkWell(
                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                      onTap: () async {
                                                                                                                                                        _model.apiResult2mn = await SmeGroup.setForumHelpfulnessCall.call(
                                                                                                                                                          forumHelpful: true,
                                                                                                                                                          forumId: getJsonField(
                                                                                                                                                            answersContentItem,
                                                                                                                                                            r'''$.answerId''',
                                                                                                                                                          ),
                                                                                                                                                          accessToken: FFAppState().accessToken,
                                                                                                                                                        );
                                                                                                                                                        if ((_model.apiResult2mn?.succeeded ?? true)) {
                                                                                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                                            SnackBar(
                                                                                                                                                              content: Text(
                                                                                                                                                                'you liked the answer',
                                                                                                                                                                style: TextStyle(
                                                                                                                                                                  color: Color(0xFF67CB45),
                                                                                                                                                                ),
                                                                                                                                                              ),
                                                                                                                                                              duration: Duration(milliseconds: 4000),
                                                                                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                            ),
                                                                                                                                                          );
                                                                                                                                                          setState(() => _model.apiRequestCompleter = null);
                                                                                                                                                          await _model.waitForApiRequestCompleted();
                                                                                                                                                        }

                                                                                                                                                        setState(() {});
                                                                                                                                                      },
                                                                                                                                                      child: Icon(
                                                                                                                                                        Icons.thumb_up_outlined,
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                        size: 26.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  if (getJsonField(
                                                                                                                                                        answersContentItem,
                                                                                                                                                        r'''$.helpful''',
                                                                                                                                                      ) ==
                                                                                                                                                      true)
                                                                                                                                                    InkWell(
                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                      onTap: () async {
                                                                                                                                                        _model.apiResult2mnCopy = await SmeGroup.setForumHelpfulnessCall.call(
                                                                                                                                                          forumHelpful: false,
                                                                                                                                                          forumId: getJsonField(
                                                                                                                                                            answersContentItem,
                                                                                                                                                            r'''$.answerId''',
                                                                                                                                                          ),
                                                                                                                                                          accessToken: FFAppState().accessToken,
                                                                                                                                                        );
                                                                                                                                                        if ((_model.apiResult2mn?.succeeded ?? true)) {
                                                                                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                                            SnackBar(
                                                                                                                                                              content: Text(
                                                                                                                                                                'you liked the answer',
                                                                                                                                                                style: TextStyle(
                                                                                                                                                                  color: Color(0xFF67CB45),
                                                                                                                                                                ),
                                                                                                                                                              ),
                                                                                                                                                              duration: Duration(milliseconds: 4000),
                                                                                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                            ),
                                                                                                                                                          );
                                                                                                                                                          setState(() => _model.apiRequestCompleter = null);
                                                                                                                                                          await _model.waitForApiRequestCompleted();
                                                                                                                                                        }

                                                                                                                                                        setState(() {});
                                                                                                                                                      },
                                                                                                                                                      child: Icon(
                                                                                                                                                        Icons.thumb_up,
                                                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                        size: 26.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  getJsonField(
                                                                                                                                                    answersContentItem,
                                                                                                                                                    r'''$.totalHelpful''',
                                                                                                                                                  ).toString(),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                                                        fontFamily: 'Roboto',
                                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              Column(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  if (getJsonField(
                                                                                                                                                        answersContentItem,
                                                                                                                                                        r'''$.unHelpful''',
                                                                                                                                                      ) ==
                                                                                                                                                      false)
                                                                                                                                                    InkWell(
                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                      onTap: () async {
                                                                                                                                                        _model.apiResult1i6 = await SmeGroup.setForumUnHelpfulnessCall.call(
                                                                                                                                                          forumId: getJsonField(
                                                                                                                                                            answersContentItem,
                                                                                                                                                            r'''$.answerId''',
                                                                                                                                                          ),
                                                                                                                                                          forumUnHelpful: true,
                                                                                                                                                          accessToken: FFAppState().accessToken,
                                                                                                                                                        );
                                                                                                                                                        if ((_model.apiResult1i6?.succeeded ?? true)) {
                                                                                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                                            SnackBar(
                                                                                                                                                              content: Text(
                                                                                                                                                                'you disliked the answer',
                                                                                                                                                                style: TextStyle(
                                                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                ),
                                                                                                                                                              ),
                                                                                                                                                              duration: Duration(milliseconds: 4000),
                                                                                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                            ),
                                                                                                                                                          );
                                                                                                                                                          setState(() => _model.apiRequestCompleter = null);
                                                                                                                                                          await _model.waitForApiRequestCompleted();
                                                                                                                                                        }

                                                                                                                                                        setState(() {});
                                                                                                                                                      },
                                                                                                                                                      child: Icon(
                                                                                                                                                        Icons.thumb_down_outlined,
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                        size: 26.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  if (getJsonField(
                                                                                                                                                        answersContentItem,
                                                                                                                                                        r'''$.unHelpful''',
                                                                                                                                                      ) ==
                                                                                                                                                      true)
                                                                                                                                                    InkWell(
                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                      onTap: () async {
                                                                                                                                                        _model.apiResult1i6Copy = await SmeGroup.setForumUnHelpfulnessCall.call(
                                                                                                                                                          forumId: getJsonField(
                                                                                                                                                            answersContentItem,
                                                                                                                                                            r'''$.answerId''',
                                                                                                                                                          ),
                                                                                                                                                          forumUnHelpful: false,
                                                                                                                                                          accessToken: FFAppState().accessToken,
                                                                                                                                                        );
                                                                                                                                                        if ((_model.apiResult1i6?.succeeded ?? true)) {
                                                                                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                                            SnackBar(
                                                                                                                                                              content: Text(
                                                                                                                                                                'you disliked the answer',
                                                                                                                                                                style: TextStyle(
                                                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                ),
                                                                                                                                                              ),
                                                                                                                                                              duration: Duration(milliseconds: 4000),
                                                                                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                            ),
                                                                                                                                                          );
                                                                                                                                                          setState(() => _model.apiRequestCompleter = null);
                                                                                                                                                          await _model.waitForApiRequestCompleted();
                                                                                                                                                        }

                                                                                                                                                        setState(() {});
                                                                                                                                                      },
                                                                                                                                                      child: Icon(
                                                                                                                                                        Icons.thumb_down,
                                                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                        size: 26.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  getJsonField(
                                                                                                                                                    answersContentItem,
                                                                                                                                                    r'''$.totalUnHelpful''',
                                                                                                                                                  ).toString(),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                                                        fontFamily: 'Roboto',
                                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              InkWell(
                                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                                onTap: () async {
                                                                                                                                                  await showModalBottomSheet(
                                                                                                                                                    isScrollControlled: true,
                                                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                                                    enableDrag: false,
                                                                                                                                                    context: context,
                                                                                                                                                    builder: (context) {
                                                                                                                                                      return WebViewAware(
                                                                                                                                                          child: GestureDetector(
                                                                                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                                        child: Padding(
                                                                                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                          child: Container(
                                                                                                                                                            height: MediaQuery.sizeOf(context).height * 0.2,
                                                                                                                                                            child: ForumAnswerWithInReplyWidget(
                                                                                                                                                              subAnswerQuestionItem: contentItem,
                                                                                                                                                              subAnswersList: answersContentItem,
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ));
                                                                                                                                                    },
                                                                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                                                                },
                                                                                                                                                child: Text(
                                                                                                                                                  'Reply',
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'Roboto',
                                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
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
                                                                                                                              ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            if ((getJsonField(
                                                                                                                      contentItem,
                                                                                                                      r'''$.answerList..numberOfElements''',
                                                                                                                    ) !=
                                                                                                                    random_data.randomInteger(0, 0)) &&
                                                                                                                (getJsonField(
                                                                                                                      contentItem,
                                                                                                                      r'''$.answerList..numberOfElements''',
                                                                                                                    ) !=
                                                                                                                    random_data.randomInteger(1, 1)))
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(36.0, 6.0, 0.0, 0.0),
                                                                                                                child: InkWell(
                                                                                                                  splashColor: Colors.transparent,
                                                                                                                  focusColor: Colors.transparent,
                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                  onTap: () async {
                                                                                                                    context.pushNamed(
                                                                                                                      'ForumViewAllAnswers',
                                                                                                                      queryParameters: {
                                                                                                                        'questionItemContent': serializeParam(
                                                                                                                          contentItem,
                                                                                                                          ParamType.JSON,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                    );
                                                                                                                  },
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        'see more answers',
                                                                                                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                                              fontFamily: 'Roboto',
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        if ((getJsonField(
                                                                                                                  answersContentItem,
                                                                                                                  r'''$.answerId''',
                                                                                                                ) ==
                                                                                                                FFAppState().editAnswerId) &&
                                                                                                            (FFAppState().showForumAnswerActions == true))
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.68, -1.26),
                                                                                                            child: wrapWithModel(
                                                                                                              model: _model.moreDetailsModels2.getModel(
                                                                                                                getJsonField(
                                                                                                                  answersContentItem,
                                                                                                                  r'''$.answerId''',
                                                                                                                ).toString(),
                                                                                                                answersContentIndex,
                                                                                                              ),
                                                                                                              updateCallback: () => setState(() {}),
                                                                                                              child: MoreDetailsWidget(
                                                                                                                key: Key(
                                                                                                                  'Key5pz_${getJsonField(
                                                                                                                    answersContentItem,
                                                                                                                    r'''$.answerId''',
                                                                                                                  ).toString()}',
                                                                                                                ),
                                                                                                                question: null,
                                                                                                                productItem: null,
                                                                                                                serviceItem: null,
                                                                                                                answerItem: answersContentItem,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
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
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    if (_model.choiceChipsValue == 'Top Active')
                                      Builder(
                                        builder: (context) {
                                          final contentTopActive =
                                              SmeGroup.getTopActiveCall
                                                      .topActiveContent(
                                                        columnGetTopActiveResponse
                                                            .jsonBody,
                                                      )
                                                      ?.map((e) => e)
                                                      .toList()
                                                      ?.toList() ??
                                                  [];
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: contentTopActive.length,
                                            itemBuilder: (context,
                                                contentTopActiveIndex) {
                                              final contentTopActiveItem =
                                                  contentTopActive[
                                                      contentTopActiveIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                14.0,
                                                                10.0,
                                                                14.0,
                                                                14.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.6499999999999999,
                                                                        -0.55),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            10.0,
                                                                            12.0,
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: 40.0,
                                                                                height: 40.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      functions.image(getJsonField(
                                                                                        contentTopActiveItem,
                                                                                        r'''$.companyLogo''',
                                                                                      ).toString()),
                                                                                      r'''$.image''',
                                                                                    ).toString(),
                                                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw-bEkdCP8SGyEaKUiE-SXLonzfXIp8mgi546odmsBpwOkDRE5maYDfkPxtSORlCwA9znDkOmbi94&usqp=CAU&ec=48600113',
                                                                                  ),
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                functions.submitedDate(getJsonField(
                                                                                  contentTopActiveItem,
                                                                                  r'''$.capturedDate''',
                                                                                )),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              getJsonField(
                                                                                contentTopActiveItem,
                                                                                r'''$.question''',
                                                                              ).toString(),
                                                                              'ask a question',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
