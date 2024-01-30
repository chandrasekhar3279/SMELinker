import '/backend/api_requests/api_calls.dart';
import '/components/feed_list_shimmer_loading_widget.dart';
import '/components/feed_page_shimmer_loading_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({
    super.key,
    this.userId,
  });

  final int? userId;

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> with TickerProviderStateMixin {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkAuth(context);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onDoubleTap: () async {
                context.pushNamed('AIBussinessAdviser');
              },
              child: FloatingActionButton.extended(
                onPressed: () {
                  print('FloatingActionButton pressed ...');
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('AIBussinessAdviser');
                        },
                        child: Image.asset(
                          'assets/images/Chat-Boat.png',
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        indent: 2.0,
                        endIndent: 2.0,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).primary,
                      borderRadius: 30.0,
                      icon: FaIcon(
                        FontAwesomeIcons.commentDots,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        _model.usersListRes =
                            await SmeGroup.getMessagingUsersCall.call(
                          accessToken: FFAppState().accessToken,
                        );
                        if ((_model.usersListRes?.succeeded ?? true)) {
                          context.pushNamed(
                            'ChatUserSelect',
                            queryParameters: {
                              'users': serializeParam(
                                getJsonField(
                                  (_model.usersListRes?.jsonBody ?? ''),
                                  r'''$''',
                                ),
                                ParamType.JSON,
                              ),
                            }.withoutNulls,
                          );
                        }

                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.search,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
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
                              child: Padding(
                                padding: EdgeInsets.all(1.0),
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
                                        )?.toString(),
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
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
            body: FutureBuilder<ApiCallResponse>(
              future: SmeGroup.getMyContentCall.call(
                pageNumber: 0,
                pageSize: 100,
                accessToken: FFAppState().accessToken,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: FeedPageShimmerLoadingWidget(),
                  );
                }
                final columnGetMyContentResponse = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FutureBuilder<ApiCallResponse>(
                        future: SmeGroup.getFeedCall.call(
                          accessToken: FFAppState().accessToken,
                          pageNumber: 0,
                          pageSize: 100,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: FeedPageShimmerLoadingWidget(),
                            );
                          }
                          final tabBarGetFeedResponse = snapshot.data!;
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor:
                                      FlutterFlowTheme.of(context).primary,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context).accent2,
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  unselectedLabelStyle: TextStyle(),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  tabs: [
                                    Tab(
                                      text: 'Feed (${getJsonField(
                                        tabBarGetFeedResponse.jsonBody,
                                        r'''$.totalRecords''',
                                      ).toString()})',
                                    ),
                                    Tab(
                                      text: 'My Content (${getJsonField(
                                        columnGetMyContentResponse.jsonBody,
                                        r'''$.totalRecords''',
                                      ).toString()})',
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [() async {}, () async {}][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 18.0, 16.0, 28.0),
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData('All'),
                                                ChipData('Top Active')
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  _model.choiceChipsValue =
                                                      val?.first),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: Colors.white,
                                                        ),
                                                iconColor: Colors.white,
                                                iconSize: 0.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 0.0,
                                                            16.0, 0.0),
                                                elevation: 4.0,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor: Colors.white,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 18.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 0.0,
                                                            16.0, 0.0),
                                                elevation: 1.0,
                                              ),
                                              chipSpacing: 20.0,
                                              rowSpacing: 12.0,
                                              multiselect: false,
                                              initialized:
                                                  _model.choiceChipsValue !=
                                                      null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipsValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                ['All'],
                                              ),
                                              wrapped: true,
                                            ),
                                          ),
                                          if (_model.choiceChipsValue == 'All')
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 60.0, 0.0, 0.0),
                                                child: RefreshIndicator(
                                                  onRefresh: () async {
                                                    setState(() => _model
                                                        .listViewAllPagingController
                                                        ?.refresh());
                                                    await _model
                                                        .waitForOnePageForListViewAll();
                                                  },
                                                  child: PagedListView<
                                                      ApiPagingParams, dynamic>(
                                                    pagingController: _model
                                                        .setListViewAllController(
                                                      (nextPageMarker) =>
                                                          SmeGroup.getFeedCall
                                                              .call(
                                                        pageNumber:
                                                            nextPageMarker
                                                                .nextPageNumber,
                                                        pageSize: 10,
                                                        accessToken:
                                                            FFAppState()
                                                                .accessToken,
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.zero,
                                                    reverse: false,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    builderDelegate:
                                                        PagedChildBuilderDelegate<
                                                            dynamic>(
                                                      // Customize what your widget looks like when it's loading the first page.
                                                      firstPageProgressIndicatorBuilder:
                                                          (_) => Center(
                                                        child:
                                                            FeedListShimmerLoadingWidget(),
                                                      ),
                                                      // Customize what your widget looks like when it's loading another page.
                                                      newPageProgressIndicatorBuilder:
                                                          (_) => Center(
                                                        child:
                                                            FeedListShimmerLoadingWidget(),
                                                      ),

                                                      itemBuilder: (context, _,
                                                          feedIndex) {
                                                        final feedItem = _model
                                                            .listViewAllPagingController!
                                                            .itemList![feedIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      15.0),
                                                          child: Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          12.0,
                                                                          15.0,
                                                                          10.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                  context
                                                                      .pushNamed(
                                                                    'FeedDetail',
                                                                    queryParameters:
                                                                        {
                                                                      'feedDetail':
                                                                          serializeParam(
                                                                        feedItem,
                                                                        ParamType
                                                                            .JSON,
                                                                      ),
                                                                      'feedId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          feedItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'userId':
                                                                          serializeParam(
                                                                        0,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
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
                                                                              context.pushNamed(
                                                                                'CompanyDetailsPage',
                                                                                queryParameters: {
                                                                                  'userId': serializeParam(
                                                                                    getJsonField(
                                                                                      feedItem,
                                                                                      r'''$.companyId''',
                                                                                    ),
                                                                                    ParamType.int,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 40.0,
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Visibility(
                                                                                    visible: (getJsonField(
                                                                                              feedItem,
                                                                                              r'''$.companyLogo''',
                                                                                            ) !=
                                                                                            null) &&
                                                                                        (getJsonField(
                                                                                              feedItem,
                                                                                              r'''$.companyLogo''',
                                                                                            ) !=
                                                                                            ''),
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
                                                                                              feedItem,
                                                                                              r'''$.companyLogo''',
                                                                                            ).toString()),
                                                                                            r'''$.image''',
                                                                                          )?.toString(),
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                                                                        ),
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if ((getJsonField(
                                                                                          feedItem,
                                                                                          r'''$.companyLogo''',
                                                                                        ) ==
                                                                                        null) ||
                                                                                    (getJsonField(
                                                                                          feedItem,
                                                                                          r'''$.companyLogo''',
                                                                                        ) ==
                                                                                        ''))
                                                                                  Container(
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
                                                                                            feedItem,
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
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    feedItem,
                                                                                                    r'''$.companyName''',
                                                                                                  )?.toString(),
                                                                                                  'companyName',
                                                                                                ).maybeHandleOverflow(
                                                                                                  maxChars: 35,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).titleMedium,
                                                                                              ),
                                                                                            ),
                                                                                            if (getJsonField(
                                                                                                  feedItem,
                                                                                                  r'''$.verifiedCompany''',
                                                                                                ) ==
                                                                                                true)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.verified,
                                                                                                  color: Color(0xFF5191FF),
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            functions.smeroleName(getJsonField(
                                                                                              feedItem,
                                                                                              r'''$.roleName''',
                                                                                            ).toString()),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
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
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      feedItem,
                                                                                      r'''$.title''',
                                                                                    )?.toString(),
                                                                                    'title',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  maxLines: 2,
                                                                                  style: FlutterFlowTheme.of(context).labelLarge,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              functions.submitedDate(getJsonField(
                                                                                feedItem,
                                                                                r'''$.updatedTime''',
                                                                              )),
                                                                              'Date',
                                                                            )} ago',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodySmall,
                                                                          ),
                                                                        ),
                                                                        if (getJsonField(
                                                                              feedItem,
                                                                              r'''$.featuredImage''',
                                                                            ) ==
                                                                            null)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: FlutterFlowYoutubePlayer(
                                                                                    url: valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        feedItem,
                                                                                        r'''$.feedUrl''',
                                                                                      )?.toString(),
                                                                                      'no link',
                                                                                    ),
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 180.0,
                                                                                    autoPlay: false,
                                                                                    looping: true,
                                                                                    mute: false,
                                                                                    showControls: true,
                                                                                    showFullScreen: true,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                              feedItem,
                                                                              r'''$.featuredImage''',
                                                                            ) !=
                                                                            null)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 180.0,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          getJsonField(
                                                                                            functions.image(getJsonField(
                                                                                              feedItem,
                                                                                              r'''$.featuredImage''',
                                                                                            ).toString()),
                                                                                            r'''$.image''',
                                                                                          )?.toString(),
                                                                                          'no image',
                                                                                        ),
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              2.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              getJsonField(
                                                                                feedItem,
                                                                                r'''$.description''',
                                                                              )?.toString(),
                                                                              'No Description',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                4,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: Color(0xFF252525),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Visibility(
                                                                            visible: getJsonField(
                                                                                  feedItem,
                                                                                  r'''$.groupsData[:]''',
                                                                                ) !=
                                                                                null,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final groupsData = getJsonField(
                                                                                    feedItem,
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
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                context.pushNamed(
                                                                                                  'GroupDetailpage',
                                                                                                  queryParameters: {
                                                                                                    'groupId': serializeParam(
                                                                                                      getJsonField(
                                                                                                        groupsDataItem,
                                                                                                        r'''$.groupId''',
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
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (getJsonField(
                                                                                          feedItem,
                                                                                          r'''$.helpful''',
                                                                                        ) ==
                                                                                        false)
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          _model.apiResultSetLike = await SmeGroup.setHelpfulnessCall.call(
                                                                                            feedId: getJsonField(
                                                                                              feedItem,
                                                                                              r'''$.id''',
                                                                                            ),
                                                                                            helpful: true,
                                                                                            accessToken: FFAppState().accessToken,
                                                                                          );
                                                                                          if ((_model.apiResultSetLike?.succeeded ?? true)) {
                                                                                            setState(() => _model.listViewAllPagingController?.refresh());
                                                                                            await _model.waitForOnePageForListViewAll();
                                                                                          } else {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    title: Text('ERROR!'),
                                                                                                    content: Text('Something went wrong.'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                        child: Text('Ok'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }

                                                                                          setState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.thumb_up_outlined,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ),
                                                                                    if (getJsonField(
                                                                                          feedItem,
                                                                                          r'''$.helpful''',
                                                                                        ) ==
                                                                                        true)
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          _model.apiResultRemoveLike = await SmeGroup.setHelpfulnessCall.call(
                                                                                            feedId: getJsonField(
                                                                                              feedItem,
                                                                                              r'''$.id''',
                                                                                            ),
                                                                                            helpful: false,
                                                                                            accessToken: FFAppState().accessToken,
                                                                                          );
                                                                                          if ((_model.apiResultRemoveLike?.succeeded ?? true)) {
                                                                                            setState(() => _model.listViewAllPagingController?.refresh());
                                                                                            await _model.waitForOnePageForListViewAll();
                                                                                          } else {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    title: Text('ERROR!'),
                                                                                                    content: Text('Something went wrong.'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                        child: Text('Ok'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }

                                                                                          setState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.thumb_up,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      feedItem,
                                                                                      r'''$.totalHelpful''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: FlutterFlowTheme.of(context).accent1,
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
                                                                                          feedItem,
                                                                                          r'''$.unHelpful''',
                                                                                        ) ==
                                                                                        false)
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          _model.apiResultSetUnlike = await SmeGroup.setUnHelpfulnessCall.call(
                                                                                            feedId: getJsonField(
                                                                                              feedItem,
                                                                                              r'''$.id''',
                                                                                            ),
                                                                                            unHelpful: true,
                                                                                            accessToken: FFAppState().accessToken,
                                                                                          );
                                                                                          if ((_model.apiResultSetUnlike?.succeeded ?? true)) {
                                                                                            setState(() => _model.listViewAllPagingController?.refresh());
                                                                                            await _model.waitForOnePageForListViewAll();
                                                                                          } else {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    title: Text('ERROR!'),
                                                                                                    content: Text('Something went wrong.'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                        child: Text('Ok'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }

                                                                                          setState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.thumb_down_outlined,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ),
                                                                                    if (getJsonField(
                                                                                          feedItem,
                                                                                          r'''$.unHelpful''',
                                                                                        ) ==
                                                                                        true)
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          _model.apiResultRemoveUnlike = await SmeGroup.setUnHelpfulnessCall.call(
                                                                                            feedId: getJsonField(
                                                                                              feedItem,
                                                                                              r'''$.id''',
                                                                                            ),
                                                                                            unHelpful: false,
                                                                                            accessToken: FFAppState().accessToken,
                                                                                          );
                                                                                          if ((_model.apiResultRemoveUnlike?.succeeded ?? true)) {
                                                                                            setState(() => _model.listViewAllPagingController?.refresh());
                                                                                            await _model.waitForOnePageForListViewAll();
                                                                                          } else {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    title: Text('ERROR!'),
                                                                                                    content: Text('Something went wrong.'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                        child: Text('Ok'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }

                                                                                          setState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.thumb_down,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      feedItem,
                                                                                      r'''$.totalUnHelpful''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.commentDots,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 20.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      feedItem,
                                                                                      r'''$.totalComments''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            if (false)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.retweet,
                                                                                      color: Color(0xFF57636C),
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
                                                                                      child: Text(
                                                                                        '9',
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
                                                                            if (false)
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Icon(
                                                                                          Icons.more_vert,
                                                                                          color: Color(0xFF57636C),
                                                                                          size: 24.0,
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
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (_model.choiceChipsValue ==
                                              'Top Active')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 60.0, 0.0, 0.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: (_model
                                                            .apiRequestCompleter2 ??=
                                                        Completer<
                                                            ApiCallResponse>()
                                                          ..complete(SmeGroup
                                                              .getTopArticlesCall
                                                              .call(
                                                            accessToken:
                                                                FFAppState()
                                                                    .accessToken,
                                                            pageNumber: 0,
                                                            pageSize: 10,
                                                          )))
                                                    .future,
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            SpinKitFadingCircle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final listViewTopActiveGetTopArticlesResponse =
                                                      snapshot.data!;
                                                  return Builder(
                                                    builder: (context) {
                                                      final feedTopActive = SmeGroup
                                                              .getTopArticlesCall
                                                              .feedTopActive(
                                                                listViewTopActiveGetTopArticlesResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.map((e) => e)
                                                              .toList()
                                                              ?.toList() ??
                                                          [];
                                                      return RefreshIndicator(
                                                        onRefresh: () async {
                                                          setState(() => _model
                                                                  .apiRequestCompleter2 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted2();
                                                        },
                                                        child: ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              feedTopActive
                                                                  .length,
                                                          itemBuilder: (context,
                                                              feedTopActiveIndex) {
                                                            final feedTopActiveItem =
                                                                feedTopActive[
                                                                    feedTopActiveIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                  context
                                                                      .pushNamed(
                                                                    'FeedDetail',
                                                                    queryParameters:
                                                                        {
                                                                      'feedDetail':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          feedTopActiveItem,
                                                                          r'''$''',
                                                                        ),
                                                                        ParamType
                                                                            .JSON,
                                                                      ),
                                                                      'feedId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          feedTopActiveItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'userId':
                                                                          serializeParam(
                                                                        widget
                                                                            .userId,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 100.0,
                                                                                  height: 90.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      getJsonField(
                                                                                        functions.image(getJsonField(
                                                                                          feedTopActiveItem,
                                                                                          r'''$.featuredImage''',
                                                                                        ).toString()),
                                                                                        r'''$.image''',
                                                                                      ).toString(),
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                      fit: BoxFit.fill,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              feedTopActiveItem,
                                                                                              r'''$.title''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).labelLarge,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '${functions.submitedDate(getJsonField(
                                                                                            feedTopActiveItem,
                                                                                            r'''$.updatedTime''',
                                                                                          ))} ago',
                                                                                          style: FlutterFlowTheme.of(context).bodySmall,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    if (false)
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          getJsonField(
                                                                                            feedTopActiveItem,
                                                                                            r'''$.description''',
                                                                                          )?.toString(),
                                                                                          'N/A',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: SmeGroup.getMyContentCall
                                                  .call(
                                                pageNumber: 0,
                                                pageSize: 100,
                                                accessToken:
                                                    FFAppState().accessToken,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          SpinKitFadingCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewGetMyContentResponse =
                                                    snapshot.data!;
                                                return Builder(
                                                  builder: (context) {
                                                    final myContent = SmeGroup
                                                            .getMyContentCall
                                                            .myContent(
                                                              listViewGetMyContentResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.map((e) => e)
                                                            .toList()
                                                            ?.toList() ??
                                                        [];
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          myContent.length,
                                                      itemBuilder: (context,
                                                          myContentIndex) {
                                                        final myContentItem =
                                                            myContent[
                                                                myContentIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      15.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'MyContentDetail',
                                                                queryParameters:
                                                                    {
                                                                  'myContent':
                                                                      serializeParam(
                                                                    myContentItem,
                                                                    ParamType
                                                                        .JSON,
                                                                  ),
                                                                  'pendingStatus':
                                                                      serializeParam(
                                                                    _model
                                                                        .pendingStatus,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'rejectedStatus':
                                                                      serializeParam(
                                                                    _model
                                                                        .rejectedStatus,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'approvedStatus':
                                                                      serializeParam(
                                                                    _model
                                                                        .approvedStatus,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
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
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        12.0,
                                                                        15.0,
                                                                        10.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              90.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                getJsonField(
                                                                                  functions.image(getJsonField(
                                                                                    myContentItem,
                                                                                    r'''$.featuredImage''',
                                                                                  ).toString()),
                                                                                  r'''$.image''',
                                                                                )?.toString(),
                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                                                              ),
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        if (getJsonField(
                                                                                              myContentItem,
                                                                                              r'''$.reviewStatus''',
                                                                                            ) ==
                                                                                            _model.pendingStatus)
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              FaIcon(
                                                                                                FontAwesomeIcons.exclamationCircle,
                                                                                                color: Color(0xFFFFBA57),
                                                                                                size: 16.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Review in Progress',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        if (getJsonField(
                                                                                              myContentItem,
                                                                                              r'''$.reviewStatus''',
                                                                                            ) ==
                                                                                            _model.approvedStatus)
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              FaIcon(
                                                                                                FontAwesomeIcons.solidCheckCircle,
                                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                                size: 16.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Approved',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        if (getJsonField(
                                                                                              myContentItem,
                                                                                              r'''$.reviewStatus''',
                                                                                            ) ==
                                                                                            _model.rejectedStatus)
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.not_interested_sharp,
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                size: 16.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Rejected',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        getJsonField(
                                                                                          myContentItem,
                                                                                          r'''$.updatedTime''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 4.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              myContentItem,
                                                                                              r'''$.title''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).labelLarge,
                                                                                          ),
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
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (getJsonField(
                                                                              myContentItem,
                                                                              r'''$.description''',
                                                                            ) !=
                                                                            null)
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 12.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  getJsonField(
                                                                                    myContentItem,
                                                                                    r'''$.description''',
                                                                                  )?.toString(),
                                                                                  'No description',
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
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
                                          ),
                                          if (getJsonField(
                                                columnGetMyContentResponse
                                                    .jsonBody,
                                                r'''$.totalRecords''',
                                              ) ==
                                              random_data.randomInteger(0, 0))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'No content submitted yet',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 16.0,
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
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
