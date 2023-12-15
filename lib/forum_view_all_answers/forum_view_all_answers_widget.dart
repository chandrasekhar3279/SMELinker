import '/backend/api_requests/api_calls.dart';
import '/components/forum_answer_widget.dart';
import '/components/forum_answer_with_in_reply_widget.dart';
import '/components/more_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'forum_view_all_answers_model.dart';
export 'forum_view_all_answers_model.dart';

class ForumViewAllAnswersWidget extends StatefulWidget {
  const ForumViewAllAnswersWidget({
    Key? key,
    this.questionItemContent,
    this.orgDetails,
  }) : super(key: key);

  final dynamic questionItemContent;
  final dynamic orgDetails;

  @override
  _ForumViewAllAnswersWidgetState createState() =>
      _ForumViewAllAnswersWidgetState();
}

class _ForumViewAllAnswersWidgetState extends State<ForumViewAllAnswersWidget> {
  late ForumViewAllAnswersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForumViewAllAnswersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().showRepliedPageQuestionActions = false;
      FFAppState().showRepliedPageAnswerActions = false;
    });
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
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderWidth: 1.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 22.0,
            ),
            onPressed: () async {
              FFAppState().showRepliedPageQuestionActions = false;
              FFAppState().showRepliedPageAnswerActions = false;
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Replied answers',
            style: FlutterFlowTheme.of(context).headlineLarge,
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              setState(() {
                FFAppState().showRepliedPageQuestionActions = false;
                FFAppState().showRepliedPageAnswerActions = false;
              });
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, -0.65),
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (getJsonField(
                                              widget.questionItemContent,
                                              r'''$.companyLogo''',
                                            ) !=
                                            null)
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                getJsonField(
                                                  functions.image(getJsonField(
                                                    widget.questionItemContent,
                                                    r'''$.companyLogo''',
                                                  ).toString()),
                                                  r'''$.image''',
                                                ).toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        if (getJsonField(
                                              widget.questionItemContent,
                                              r'''$.companyLogo''',
                                            ) ==
                                            null)
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  functions.profilePicName(
                                                      getJsonField(
                                                    widget.questionItemContent,
                                                    r'''$.companyName''',
                                                  ).toString()),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              widget
                                                                  .questionItemContent,
                                                              r'''$.userName''',
                                                            )
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                                  maxChars: 12,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                          if (getJsonField(
                                                                widget
                                                                    .questionItemContent,
                                                                r'''$.verifiedProfile''',
                                                              ) ==
                                                              true)
                                                            Icon(
                                                              Icons.verified,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                              size: 22.0,
                                                            ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            functions
                                                                .submitedDate(
                                                                    getJsonField(
                                                              widget
                                                                  .questionItemContent,
                                                              r'''$.capturedDate''',
                                                            )),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                          if ((getJsonField(
                                                                    widget
                                                                        .questionItemContent,
                                                                    r'''$.editable''',
                                                                  ) ==
                                                                  true) &&
                                                              (getJsonField(
                                                                    widget
                                                                        .questionItemContent,
                                                                    r'''$.removable''',
                                                                  ) ==
                                                                  true))
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  30.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons.more_vert,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .showRepliedPageQuestionActions =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                        .showMoreQstn =
                                                                    getJsonField(
                                                                  widget
                                                                      .questionItemContent,
                                                                  r'''$.questionId''',
                                                                );
                                                                if (FFAppState()
                                                                        .showRepliedPageQuestionActions ==
                                                                    false) {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .showRepliedPageQuestionActions =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .showRepliedPageQuestionActions =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      getJsonField(
                                                        widget
                                                            .questionItemContent,
                                                        r'''$.question''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Visibility(
                                                      visible: getJsonField(
                                                            widget
                                                                .questionItemContent,
                                                            r'''$.groupsData[:]''',
                                                          ) !=
                                                          null,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    6.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final groupsData =
                                                                getJsonField(
                                                              widget
                                                                  .questionItemContent,
                                                              r'''$.groupsData[:]''',
                                                            ).toList();
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: List.generate(
                                                                    groupsData
                                                                        .length,
                                                                    (groupsDataIndex) {
                                                                  final groupsDataItem =
                                                                      groupsData[
                                                                          groupsDataIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child:
                                                                        AlignedTooltip(
                                                                      content: Padding(
                                                                          padding: EdgeInsets.all(8.0),
                                                                          child: Text(
                                                                            getJsonField(
                                                                              groupsDataItem,
                                                                              r'''$.groupName''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          )),
                                                                      offset:
                                                                          4.0,
                                                                      preferredDirection:
                                                                          AxisDirection
                                                                              .up,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      elevation:
                                                                          4.0,
                                                                      tailBaseWidth:
                                                                          24.0,
                                                                      tailLength:
                                                                          12.0,
                                                                      waitDuration:
                                                                          Duration(
                                                                              milliseconds: 100),
                                                                      showDuration:
                                                                          Duration(
                                                                              milliseconds: 1500),
                                                                      triggerMode:
                                                                          TooltipTriggerMode
                                                                              .tap,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(1.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                11.0,
                                                                            height:
                                                                                11.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
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
                                                  Divider(
                                                    thickness: 1.0,
                                                    indent: 10.0,
                                                    endIndent: 10.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                  ),
                                                  wrapWithModel(
                                                    model:
                                                        _model.forumAnswerModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    updateOnChange: true,
                                                    child: ForumAnswerWidget(
                                                      forumAnswer: widget
                                                          .questionItemContent
                                                          ?.toString(),
                                                      questionId: widget
                                                          .questionItemContent,
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
                            ],
                          ),
                          if ((getJsonField(
                                    widget.questionItemContent,
                                    r'''$.questionId''',
                                  ) ==
                                  FFAppState().showMoreQstn) &&
                              (FFAppState().showRepliedPageQuestionActions ==
                                  true))
                            Align(
                              alignment: AlignmentDirectional(0.7, 0.1),
                              child: wrapWithModel(
                                model: _model.moreDetailsModel1,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: MoreDetailsWidget(
                                  productItem: null,
                                  serviceItem: null,
                                  answerItem: null,
                                  feedCommentInfo: null,
                                  feedID: null,
                                  question: widget.questionItemContent,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: PagedListView<ApiPagingParams, dynamic>(
                      pagingController: _model.setListViewController(
                        (nextPageMarker) => SmeGroup.getAnswersCall.call(
                          accessToken: FFAppState().accessToken,
                          pageNumber: nextPageMarker.nextPageNumber,
                          pageSize: 5,
                          questionId: getJsonField(
                            widget.questionItemContent,
                            r'''$.questionId''',
                          ),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<dynamic>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitFadingCircle(
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 50.0,
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitFadingCircle(
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 50.0,
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, answersIndex) {
                          final answersItem = _model.listViewPagingController!
                              .itemList![answersIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                45.0, 4.0, 0.0, 2.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, -0.65),
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 35.0,
                                                  height: 35.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Visibility(
                                                    visible: getJsonField(
                                                          answersItem,
                                                          r'''$.companyLogo''',
                                                        ) !=
                                                        null,
                                                    child: Container(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        getJsonField(
                                                          functions.image(
                                                              getJsonField(
                                                            answersItem,
                                                            r'''$.companyLogo''',
                                                          ).toString()),
                                                          r'''$.image''',
                                                        ).toString(),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (getJsonField(
                                                      answersItem,
                                                      r'''$.companyLogo''',
                                                    ) ==
                                                    null)
                                                  Container(
                                                    width: 35.0,
                                                    height: 35.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                                            answersItem,
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
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                8.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      answersItem,
                                                                      r'''$.userName''',
                                                                    )
                                                                        .toString()
                                                                        .maybeHandleOverflow(
                                                                          maxChars:
                                                                              12,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                  ),
                                                                  if (getJsonField(
                                                                        answersItem,
                                                                        r'''$.verifiedProfile''',
                                                                      ) ==
                                                                      true)
                                                                    Icon(
                                                                      Icons
                                                                          .verified,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    functions
                                                                        .submitedDate(
                                                                            getJsonField(
                                                                      answersItem,
                                                                      r'''$.capturedDate''',
                                                                    )),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                  ),
                                                                  if ((getJsonField(
                                                                            answersItem,
                                                                            r'''$.editable''',
                                                                          ) ==
                                                                          true) &&
                                                                      (getJsonField(
                                                                            answersItem,
                                                                            r'''$.removable''',
                                                                          ) ==
                                                                          true))
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
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .more_vert,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().showRepliedPageAnswerActions =
                                                                              false;
                                                                        });
                                                                        FFAppState().editAnswerId =
                                                                            getJsonField(
                                                                          answersItem,
                                                                          r'''$.answerId''',
                                                                        );
                                                                        if (_model.showAnswersAction ==
                                                                            false) {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().showRepliedPageAnswerActions =
                                                                                true;
                                                                          });
                                                                        } else {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().showRepliedPageAnswerActions =
                                                                                false;
                                                                          });
                                                                        }
                                                                      },
                                                                    ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              (String
                                                                      myAnswer) {
                                                                return myAnswer
                                                                    .contains(
                                                                        '@');
                                                              }(getJsonField(
                                                                answersItem,
                                                                r'''$.answer''',
                                                              ).toString())
                                                                  ? functions
                                                                      .commentTextConvertToString(
                                                                          getJsonField(
                                                                      answersItem,
                                                                      r'''$.answer''',
                                                                    ).toString())
                                                                  : getJsonField(
                                                                      answersItem,
                                                                      r'''$.answer''',
                                                                    ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (getJsonField(
                                                                              answersItem,
                                                                              r'''$.helpful''',
                                                                            ) ==
                                                                            false)
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.likeApiRes = await SmeGroup.setForumHelpfulnessCall.call(
                                                                                forumHelpful: true,
                                                                                forumId: getJsonField(
                                                                                  answersItem,
                                                                                  r'''$.answerId''',
                                                                                ),
                                                                                accessToken: FFAppState().accessToken,
                                                                              );
                                                                              if ((_model.likeApiRes?.succeeded ?? true)) {
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
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.thumb_up_outlined,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 26.0,
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                              answersItem,
                                                                              r'''$.helpful''',
                                                                            ) ==
                                                                            true)
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.likeAPiRes2 = await SmeGroup.setForumHelpfulnessCall.call(
                                                                                forumHelpful: false,
                                                                                forumId: getJsonField(
                                                                                  answersItem,
                                                                                  r'''$.answerId''',
                                                                                ),
                                                                                accessToken: FFAppState().accessToken,
                                                                              );
                                                                              if ((_model.likeAPiRes2?.succeeded ?? true)) {
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
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.thumb_up,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 26.0,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          answersItem,
                                                                          r'''$.totalHelpful''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (getJsonField(
                                                                              answersItem,
                                                                              r'''$.unHelpful''',
                                                                            ) ==
                                                                            false)
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.disLikeApiRes = await SmeGroup.setForumUnHelpfulnessCall.call(
                                                                                forumId: getJsonField(
                                                                                  answersItem,
                                                                                  r'''$.answerId''',
                                                                                ),
                                                                                forumUnHelpful: true,
                                                                                accessToken: FFAppState().accessToken,
                                                                              );
                                                                              if ((_model.disLikeApiRes?.succeeded ?? true)) {
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
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.thumb_down_outlined,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 26.0,
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                              answersItem,
                                                                              r'''$.unHelpful''',
                                                                            ) ==
                                                                            true)
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.disLikeApiRes2 = await SmeGroup.setForumUnHelpfulnessCall.call(
                                                                                forumId: getJsonField(
                                                                                  answersItem,
                                                                                  r'''$.answerId''',
                                                                                ),
                                                                                forumUnHelpful: false,
                                                                                accessToken: FFAppState().accessToken,
                                                                              );
                                                                              if ((_model.disLikeApiRes2?.succeeded ?? true)) {
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
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.thumb_down,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 26.0,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          answersItem,
                                                                          r'''$.totalUnHelpful''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                                child: GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: Container(
                                                                                  height: MediaQuery.sizeOf(context).height * 0.2,
                                                                                  child: ForumAnswerWithInReplyWidget(
                                                                                    subAnswerQuestionItem: widget.questionItemContent,
                                                                                    subAnswersList: answersItem,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ));
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Reply',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  if ((getJsonField(
                                            answersItem,
                                            r'''$.answerId''',
                                          ) ==
                                          FFAppState().editAnswerId) &&
                                      (FFAppState()
                                              .showRepliedPageAnswerActions ==
                                          true))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.63, 0.0),
                                      child: wrapWithModel(
                                        model:
                                            _model.moreDetailsModels2.getModel(
                                          getJsonField(
                                            answersItem,
                                            r'''$.answerId''',
                                          ).toString(),
                                          answersIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: MoreDetailsWidget(
                                          key: Key(
                                            'Keyop6_${getJsonField(
                                              answersItem,
                                              r'''$.answerId''',
                                            ).toString()}',
                                          ),
                                          answerItem: answersItem,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
