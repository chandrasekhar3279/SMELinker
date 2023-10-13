import '/backend/api_requests/api_calls.dart';
import '/components/emptycomments_widget.dart';
import '/components/more_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feed_detail_model.dart';
export 'feed_detail_model.dart';

class FeedDetailWidget extends StatefulWidget {
  const FeedDetailWidget({
    Key? key,
    this.feedDetail,
    this.feedId,
    this.userId,
  }) : super(key: key);

  final dynamic feedDetail;
  final int? feedId;
  final int? userId;

  @override
  _FeedDetailWidgetState createState() => _FeedDetailWidgetState();
}

class _FeedDetailWidgetState extends State<FeedDetailWidget> {
  late FeedDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedDetailModel());

    _model.commentTextController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final feedDetailGetProfileDetailsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                    alignment: AlignmentDirectional(-0.75, 0.00),
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
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    getJsonField(
                                      functions.image(getJsonField(
                                        rowGetProfileDetailsResponse.jsonBody,
                                        r'''$.image''',
                                      ).toString()),
                                      r'''$.image''',
                                    ),
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                  ),
                                  fit: BoxFit.contain,
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
                                            color: FlutterFlowTheme.of(context)
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
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().showFeedCommentActions = true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                setState(() {
                                  _model.submittedCommentForm = false;
                                });
                                FFAppState().showFeedCommentActions = false;
                                context.safePop();
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(),
                          child: Text(
                            valueOrDefault<String>(
                              getJsonField(
                                widget.feedDetail,
                                r'''$.title''',
                              ).toString(),
                              'N/A',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 0.0, 8.0),
                            child: Text(
                              '${valueOrDefault<String>(
                                functions.submitedDate(getJsonField(
                                          widget.feedDetail,
                                          r'''$.updatedTime''',
                                        ) !=
                                        null
                                    ? getJsonField(
                                        widget.feedDetail,
                                        r'''$.updatedTime''',
                                      )
                                    : getJsonField(
                                        widget.feedDetail,
                                        r'''$.updated_time''',
                                      )),
                                'N/A',
                              )} ago',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        ],
                      ),
                      if ((getJsonField(
                                widget.feedDetail,
                                r'''$.featuredImage''',
                              ) ==
                              null) &&
                          (getJsonField(
                                widget.feedDetail,
                                r'''$.featured_image''',
                              ) ==
                              null))
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FlutterFlowYoutubePlayer(
                              url: getJsonField(
                                        widget.feedDetail,
                                        r'''$.feedUrl''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      widget.feedDetail,
                                      r'''$.feedUrl''',
                                    )
                                  : getJsonField(
                                      widget.feedDetail,
                                      r'''$.feed_url''',
                                    ),
                              autoPlay: false,
                              looping: false,
                              mute: false,
                              showControls: true,
                              showFullScreen: false,
                            ),
                          ],
                        ),
                      if ((getJsonField(
                                widget.feedDetail,
                                r'''$.featuredImage''',
                              ) !=
                              null) ||
                          (getJsonField(
                                widget.feedDetail,
                                r'''$.featured_image''',
                              ) !=
                              null))
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              valueOrDefault<String>(
                                getJsonField(
                                  functions.image(valueOrDefault<String>(
                                    getJsonField(
                                              widget.feedDetail,
                                              r'''$.featuredImage''',
                                            ) !=
                                            null
                                        ? valueOrDefault<String>(
                                            getJsonField(
                                              widget.feedDetail,
                                              r'''$.featuredImage''',
                                            ).toString(),
                                            'http://smeconnectdev.cloudseed.io/assets/images/news/newsfeed-square.jpg',
                                          )
                                        : getJsonField(
                                            widget.feedDetail,
                                            r'''$.featured_image''',
                                          ).toString(),
                                    'http://smeconnectdev.cloudseed.io/assets/images/news/newsfeed-square.jpg',
                                  )),
                                  r'''$.image''',
                                ),
                                'http://smeconnectdev.cloudseed.io/assets/images/news/newsfeed-square.jpg',
                              ),
                              width: double.infinity,
                              height: 200.0,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL(getJsonField(
                                            widget.feedDetail,
                                            r'''$.feedUrl''',
                                          ) !=
                                          null
                                      ? getJsonField(
                                          widget.feedDetail,
                                          r'''$.feedUrl''',
                                        ).toString()
                                      : getJsonField(
                                          widget.feedDetail,
                                          r'''$.feed_url''',
                                        ).toString());
                                },
                                child: Text(
                                  'Visit link',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: SmeGroup.getFollowersCall.call(
                            pageNumber: 0,
                            pageSize: 100,
                            accessToken: FFAppState().accessToken,
                            sortBy: getJsonField(
                              widget.feedDetail,
                              r'''$.companyName''',
                            ).toString(),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitFadingCircle(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            final rowGetFollowersResponse = snapshot.data!;
                            return InkWell(
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
                                        widget.feedDetail,
                                        r'''$.companyId''',
                                      ),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if ((getJsonField(
                                            widget.feedDetail,
                                            r'''$.companyLogo''',
                                          ) !=
                                          null) &&
                                      (getJsonField(
                                            widget.feedDetail,
                                            r'''$.companyLogo''',
                                          ) !=
                                          ''))
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            functions.image(getJsonField(
                                              widget.feedDetail,
                                              r'''$.companyLogo''',
                                            ).toString()),
                                            r'''$.image''',
                                          ),
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  if ((getJsonField(
                                            widget.feedDetail,
                                            r'''$.companyLogo''',
                                          ) ==
                                          null) ||
                                      (getJsonField(
                                            widget.feedDetail,
                                            r'''$.companyLogo''',
                                          ) ==
                                          ''))
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFA6400),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            functions
                                                .profilePicName(getJsonField(
                                              widget.feedDetail,
                                              r'''$.companyName''',
                                            ).toString()),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Roboto',
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter1 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(SmeGroup
                                                      .getFollowersCall
                                                      .call(
                                                    pageNumber: 0,
                                                    pageSize: 100,
                                                    accessToken: FFAppState()
                                                        .accessToken,
                                                    sortBy: getJsonField(
                                                      widget.feedDetail,
                                                      r'''$.companyName''',
                                                    ).toString(),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final columnGetFollowersResponse =
                                              snapshot.data!;
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        getJsonField(
                                                          widget.feedDetail,
                                                          r'''$.companyName''',
                                                        ).toString(),
                                                        'N/A',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                  ),
                                                  if (getJsonField(
                                                        widget.feedDetail,
                                                        r'''$.verifiedCompany''',
                                                      ) ==
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.verified,
                                                        color:
                                                            Color(0xFF5191FF),
                                                        size: 22.0,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 8.0),
                                                child: Text(
                                                  getJsonField(
                                                            widget.feedDetail,
                                                            r'''$.roleName''',
                                                          ) !=
                                                          null
                                                      ? valueOrDefault<String>(
                                                          functions.smeroleName(
                                                              getJsonField(
                                                            widget.feedDetail,
                                                            r'''$.roleName''',
                                                          ).toString()),
                                                          'N/A',
                                                        )
                                                      : valueOrDefault<String>(
                                                          functions.smeroleName(
                                                              getJsonField(
                                                            widget.feedDetail,
                                                            r'''$.name''',
                                                          ).toString()),
                                                          'N/A',
                                                        ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall,
                                                ),
                                              ),
                                              if (false)
                                                Text(
                                                  '${valueOrDefault<String>(
                                                    getJsonField(
                                                      columnGetFollowersResponse
                                                          .jsonBody,
                                                      r'''$.total''',
                                                    ).toString(),
                                                    'zero',
                                                  )} Followers',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 2.0, 10.0, 2.0),
                            child: Text(
                              valueOrDefault<String>(
                                getJsonField(
                                  widget.feedDetail,
                                  r'''$.description''',
                                ).toString(),
                                'N/A',
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    lineHeight: 1.4,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      if (false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 36.0, 0.0, 24.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Last Updated',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions.submitedDate(getJsonField(
                                                  widget.feedDetail,
                                                  r'''$.updatedTime''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                widget.feedDetail,
                                                r'''$.updatedTime''',
                                              )
                                            : getJsonField(
                                                widget.feedDetail,
                                                r'''$.updated_time''',
                                              )),
                                        'N/A',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    36.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.solidCheckCircle,
                                            color: Color(0xFF069422),
                                            size: 16.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Approved',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            final rowGetOrgDetailsResponse = snapshot.data!;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (getJsonField(
                                      rowGetOrgDetailsResponse.jsonBody,
                                      r'''$.logo''',
                                    ) !=
                                    null)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              functions.image(getJsonField(
                                                rowGetOrgDetailsResponse
                                                    .jsonBody,
                                                r'''$.logo''',
                                              ).toString()),
                                              r'''$.image''',
                                            ),
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw-bEkdCP8SGyEaKUiE-SXLonzfXIp8mgi546odmsBpwOkDRE5maYDfkPxtSORlCwA9znDkOmbi94&usqp=CAU&ec=48600113',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (getJsonField(
                                      rowGetOrgDetailsResponse.jsonBody,
                                      r'''$.logo''',
                                    ) ==
                                    null)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFA6400),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            functions
                                                .profilePicName(getJsonField(
                                              rowGetOrgDetailsResponse.jsonBody,
                                              r'''$.companyName''',
                                            ).toString()),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        child: Stack(
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Form(
                                                  key: _model.formKey,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      20.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .commentTextController,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.commentTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                              () async {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .tagListPopup =
                                                                      false;
                                                                });
                                                                if ((String
                                                                    commentedText) {
                                                                  return commentedText
                                                                      .contains(
                                                                          '@');
                                                                }(_model
                                                                    .commentTextController
                                                                    .text)) {
                                                                  _model.gettingTagableAPIres =
                                                                      await SmeGroup
                                                                          .getTaggableUsersCall
                                                                          .call(
                                                                    accessToken:
                                                                        FFAppState()
                                                                            .accessToken,
                                                                    companyNameWithChars:
                                                                        functions.findMyText(_model
                                                                            .commentTextController
                                                                            .text),
                                                                  );
                                                                  setState(() =>
                                                                      _model.apiRequestCompleter1 =
                                                                          null);
                                                                  await _model
                                                                      .waitForApiRequestCompleted1();
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .tagListPopup =
                                                                        true;
                                                                    FFAppState()
                                                                        .taggableUsersList = getJsonField(
                                                                      (_model.gettingTagableAPIres
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$[:]''',
                                                                      true,
                                                                    )!
                                                                        .toList()
                                                                        .cast<dynamic>();
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .tagListPopup =
                                                                        false;
                                                                    FFAppState()
                                                                        .taggableUsersList = [];
                                                                  });
                                                                }

                                                                setState(() {});
                                                              },
                                                            ),
                                                            textCapitalization:
                                                                TextCapitalization
                                                                    .sentences,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Write a comment...',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .borderColor,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge,
                                                            validator: _model
                                                                .commentTextControllerValidator
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
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.send_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 22.0,
                                                          ),
                                                          onPressed: () async {
                                                            setState(() {
                                                              _model.submittedCommentForm =
                                                                  true;
                                                            });
                                                            if (_model.formKey
                                                                        .currentState ==
                                                                    null ||
                                                                !_model.formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                              return;
                                                            }
                                                            _model.apiResult6c1 =
                                                                await SmeGroup
                                                                    .submitFeedCommentCall
                                                                    .call(
                                                              accessToken:
                                                                  FFAppState()
                                                                      .accessToken,
                                                              feedId:
                                                                  getJsonField(
                                                                widget
                                                                    .feedDetail,
                                                                r'''$.id''',
                                                              ),
                                                              comment: (String
                                                                      myComment) {
                                                                return myComment
                                                                    .contains(
                                                                        '@');
                                                              }(_model.commentTextController
                                                                      .text)
                                                                  ? functions.commentTaggableFeed(
                                                                      _model
                                                                          .mentions
                                                                          .toList(),
                                                                      _model
                                                                          .mentionsCompanyNames
                                                                          .toList(),
                                                                      _model
                                                                          .commentTextController
                                                                          .text)
                                                                  : _model
                                                                      .commentTextController
                                                                      .text,
                                                              mentionsList:
                                                                  _model
                                                                      .mentions,
                                                            );
                                                            if ((_model
                                                                    .apiResult6c1
                                                                    ?.succeeded ??
                                                                true)) {
                                                              setState(() =>
                                                                  _model.apiRequestCompleter2 =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted2();
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .dummyBoolean =
                                                                    true;
                                                                FFAppState()
                                                                        .tagListPopup =
                                                                    false;
                                                              });
                                                              setState(() {
                                                                _model.submittedCommentForm =
                                                                    false;
                                                              });
                                                              setState(() {
                                                                _model
                                                                    .commentTextController
                                                                    ?.clear();
                                                              });
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Something went wrong please try again.',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                ),
                                                              );
                                                            }

                                                            setState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (FFAppState().tagListPopup ==
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 45.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 180.0,
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final tagListItem =
                                                            FFAppState()
                                                                .taggableUsersList
                                                                .map((e) => e)
                                                                .toList();
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                tagListItem
                                                                    .length,
                                                                (tagListItemIndex) {
                                                              final tagListItemItem =
                                                                  tagListItem[
                                                                      tagListItemIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .tagListPopup =
                                                                          false;
                                                                      FFAppState()
                                                                          .addToTaggedCompanyList(
                                                                              getJsonField(
                                                                        tagListItemItem,
                                                                        r'''$.companyName''',
                                                                      ));
                                                                      FFAppState()
                                                                              .taggedEnterprenurName =
                                                                          getJsonField(
                                                                        tagListItemItem,
                                                                        r'''$.companyName''',
                                                                      ).toString();
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      _model.taggedId =
                                                                          getJsonField(
                                                                        tagListItemItem,
                                                                        r'''$.userId''',
                                                                      );
                                                                      _model.taggedCompanyName =
                                                                          getJsonField(
                                                                        tagListItemItem,
                                                                        r'''$.companyName''',
                                                                      ).toString();
                                                                      _model.addToMentions(
                                                                          getJsonField(
                                                                        tagListItemItem,
                                                                        r'''$.userId''',
                                                                      ));
                                                                      _model.addToMentionsCompanyNames(
                                                                          getJsonField(
                                                                        tagListItemItem,
                                                                        r'''$.companyName''',
                                                                      ).toString());
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      _model.commentTextController?.text = functions.fInalCommentInputText(
                                                                          _model
                                                                              .commentTextController
                                                                              .text,
                                                                          FFAppState()
                                                                              .taggedEnterprenurName)!;
                                                                    });
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          getJsonField(
                                                                            functions.image(getJsonField(
                                                                              tagListItemItem,
                                                                              r'''$.companyLogo''',
                                                                            ).toString()),
                                                                            r'''$.image''',
                                                                          ),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              tagListItemItem,
                                                                              r'''$..companyName''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelLarge,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              6.0,
                                                                              8.0,
                                                                              6.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Enterprenur',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
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
                                          ],
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
                      FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter2 ??=
                                Completer<ApiCallResponse>()
                                  ..complete(SmeGroup.getCommentsCall.call(
                                    accessToken: FFAppState().accessToken,
                                    feedId: getJsonField(
                                      widget.feedDetail,
                                      r'''$.id''',
                                    ),
                                    size: 100,
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
                          final listViewGetCommentsResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final comments = SmeGroup.getCommentsCall
                                      .comments(
                                        listViewGetCommentsResponse.jsonBody,
                                      )
                                      ?.map((e) => e)
                                      .toList()
                                      ?.toList() ??
                                  [];
                              if (comments.isEmpty) {
                                return Center(
                                  child: EmptycommentsWidget(),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: comments.length,
                                itemBuilder: (context, commentsIndex) {
                                  final commentsItem = comments[commentsIndex];
                                  return Visibility(
                                    visible: getJsonField(
                                          widget.feedDetail,
                                          r'''$.id''',
                                        ) ==
                                        getJsonField(
                                          commentsItem,
                                          r'''$.feedId''',
                                        ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Stack(
                                          alignment: AlignmentDirectional(
                                              0.7, -0.30000000000000004),
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 2.0, 2.0, 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (getJsonField(
                                                        commentsItem,
                                                        r'''$.userCompanyLogo''',
                                                      ) !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                              functions.image(
                                                                  getJsonField(
                                                                commentsItem,
                                                                r'''$.userCompanyLogo''',
                                                              ).toString()),
                                                              r'''$.image''',
                                                            ),
                                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw-bEkdCP8SGyEaKUiE-SXLonzfXIp8mgi546odmsBpwOkDRE5maYDfkPxtSORlCwA9znDkOmbi94&usqp=CAU&ec=48600113',
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  if (getJsonField(
                                                        commentsItem,
                                                        r'''$.userCompanyLogo''',
                                                      ) ==
                                                      null)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFA6400),
                                                          shape:
                                                              BoxShape.circle,
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
                                                                commentsItem,
                                                                r'''$.userCompanyName''',
                                                              ).toString()),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                  getJsonField(
                                                                    commentsItem,
                                                                    r'''$.userCompanyName''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge,
                                                                ),
                                                              ),
                                                              if (getJsonField(
                                                                    commentsItem,
                                                                    r'''$.verifiedCompany''',
                                                                  ) ==
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .verified,
                                                                    color: Color(
                                                                        0xFF5191FF),
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              (String
                                                                      myComment) {
                                                                return myComment
                                                                    .contains(
                                                                        '@');
                                                              }(getJsonField(
                                                                commentsItem,
                                                                r'''$.commentText''',
                                                              ).toString())
                                                                  ? functions
                                                                      .commentTextConvertToString(
                                                                          getJsonField(
                                                                      commentsItem,
                                                                      r'''$.commentText''',
                                                                    ).toString())
                                                                  : getJsonField(
                                                                      commentsItem,
                                                                      r'''$.commentText''',
                                                                    ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          if (false)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ToggleIcon(
                                                                        onPressed:
                                                                            () async {
                                                                          setState(() =>
                                                                              FFAppState().feedLike = !FFAppState().feedLike);
                                                                        },
                                                                        value: FFAppState()
                                                                            .feedLike,
                                                                        onIcon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidThumbsUp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                        offIcon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .thumbsUp,
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '4',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF57636C),
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() =>
                                                                                FFAppState().feedUnlike = !FFAppState().feedUnlike);
                                                                          },
                                                                          value:
                                                                              FFAppState().feedUnlike,
                                                                          onIcon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidThumbsDown,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                          offIcon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.thumbsDown,
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '0',
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: Color(0xFF57636C),
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FaIcon(
                                                                        FontAwesomeIcons
                                                                            .reply,
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Reply',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF57636C),
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      '2d',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .more_vert,
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                functions
                                                                    .submittedDateString(
                                                                        getJsonField(
                                                                  commentsItem,
                                                                  r'''$.submittedOn''',
                                                                ).toString()),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                    ),
                                                              ),
                                                              Text(
                                                                'Reply',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if ((getJsonField(
                                                            commentsItem,
                                                            r'''$.editable''',
                                                          ) ==
                                                          true) &&
                                                      (getJsonField(
                                                            commentsItem,
                                                            r'''$.editableOwner''',
                                                          ) ==
                                                          true))
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.more_vert,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        setState(() {
                                                          FFAppState()
                                                                  .editCommentID =
                                                              getJsonField(
                                                            commentsItem,
                                                            r'''$.id''',
                                                          );
                                                        });
                                                        if (FFAppState()
                                                                .showFeedCommentActions ==
                                                            false) {
                                                          FFAppState()
                                                                  .showFeedCommentActions =
                                                              true;
                                                        } else {
                                                          FFAppState()
                                                                  .showFeedCommentActions =
                                                              false;
                                                        }
                                                      },
                                                    ),
                                                ],
                                              ),
                                            ),
                                            if ((getJsonField(
                                                      commentsItem,
                                                      r'''$.id''',
                                                    ) ==
                                                    FFAppState()
                                                        .editCommentID) &&
                                                (FFAppState()
                                                        .showFeedCommentActions ==
                                                    true))
                                              wrapWithModel(
                                                model: _model.moreDetailsModels
                                                    .getModel(
                                                  getJsonField(
                                                    commentsItem,
                                                    r'''$.feedId''',
                                                  ).toString(),
                                                  commentsIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: MoreDetailsWidget(
                                                  key: Key(
                                                    'Keydca_${getJsonField(
                                                      commentsItem,
                                                      r'''$.feedId''',
                                                    ).toString()}',
                                                  ),
                                                  question: null,
                                                  productItem: null,
                                                  serviceItem: null,
                                                  answerItem: null,
                                                  feedCommentInfo: commentsItem,
                                                  feedID: widget.feedDetail,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
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
