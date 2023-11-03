import '/backend/api_requests/api_calls.dart';
import '/components/add_product_widget.dart';
import '/components/add_service_widget.dart';
import '/components/add_team_member_widget.dart';
import '/components/banner_change_widget.dart';
import '/components/delete_team_member_widget.dart';
import '/components/edit_my_story_widget.dart';
import '/components/empty_list_view_component_widget.dart';
import '/components/follow_list_widget.dart';
import '/components/get_in_touch_details_widget.dart';
import '/components/more_details_widget.dart';
import '/components/update_org_details_page_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'company_detail_model.dart';
export 'company_detail_model.dart';

class CompanyDetailWidget extends StatefulWidget {
  const CompanyDetailWidget({
    Key? key,
    int? userId,
  })  : this.userId = userId ?? 0,
        super(key: key);

  final int userId;

  @override
  _CompanyDetailWidgetState createState() => _CompanyDetailWidgetState();
}

class _CompanyDetailWidgetState extends State<CompanyDetailWidget> {
  late CompanyDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompanyDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkAuth(context);
      _model.headerBannerAPIResponse =
          await SmeGroup.getHeaderBannerInfoCall.call(
        userId: valueOrDefault<int>(
          widget.userId,
          0,
        ),
        accessToken: FFAppState().accessToken,
      );
      if ((_model.headerBannerAPIResponse?.succeeded ?? true)) {
        setState(() {
          _model.healthCheckArray = (getJsonField(
            (_model.headerBannerAPIResponse?.jsonBody ?? ''),
            r'''$.healthChecks[:].name''',
            true,
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .toList()
              .cast<String>();
        });
      }
    });

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
    _model.expandableController4 = ExpandableController(initialExpanded: false);
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
      future: SmeGroup.getOrgDetailsCall.call(
        accessToken: FFAppState().accessToken,
        userId: valueOrDefault<int>(
          widget.userId,
          0,
        ),
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
        final companyDetailGetOrgDetailsResponse = snapshot.data!;
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
              body: SafeArea(
                top: true,
                child: FutureBuilder<ApiCallResponse>(
                  future: SmeGroup.getBannerUserIdCall.call(
                    accessToken: FFAppState().accessToken,
                    userId: valueOrDefault<String>(
                      widget.userId.toString(),
                      '0',
                    ),
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
                    final stackGetBannerUserIdResponse = snapshot.data!;
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        alignment: AlignmentDirectional(0.95, -1.0),
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, -1.00),
                              child: Image.network(
                                getJsonField(
                                  functions.image(getJsonField(
                                    stackGetBannerUserIdResponse.jsonBody,
                                    r'''$.success''',
                                  ).toString()),
                                  r'''$.image''',
                                ),
                                width: double.infinity,
                                height: 300.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, -0.87),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x520E151B),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.arrow_back_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 100.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 100.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x320E151B),
                                              offset: Offset(0.0, -2.0),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 10.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if (getJsonField(
                                                                    companyDetailGetOrgDetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.logo''',
                                                                  ) !=
                                                                  null)
                                                                Container(
                                                                  width: 90.0,
                                                                  height: 90.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFF8B97A2),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 70.0,
                                                                    height:
                                                                        70.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          functions
                                                                              .image(getJsonField(
                                                                            companyDetailGetOrgDetailsResponse.jsonBody,
                                                                            r'''$.logo''',
                                                                          ).toString()),
                                                                          r'''$.image''',
                                                                        ),
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (getJsonField(
                                                                    companyDetailGetOrgDetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.logo''',
                                                                  ) ==
                                                                  null)
                                                                Container(
                                                                  width: 90.0,
                                                                  height: 90.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFFA6400),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFF8B97A2),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        functions
                                                                            .profilePicName(getJsonField(
                                                                          companyDetailGetOrgDetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.companyName''',
                                                                        ).toString()),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                r'''$.companyName''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    fontSize: 18.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (getJsonField(
                                                                                stackGetBannerUserIdResponse.jsonBody,
                                                                                r'''$.verifiedCompany''',
                                                                              ) ==
                                                                              true)
                                                                            Icon(
                                                                              Icons.verified,
                                                                              color: Color(0xFF5191FF),
                                                                              size: 24.0,
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            26.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            FutureBuilder<ApiCallResponse>(
                                                                              future: SmeGroup.isFollowingCall.call(
                                                                                accessToken: FFAppState().accessToken,
                                                                                userId: valueOrDefault<int>(
                                                                                  widget.userId,
                                                                                  0,
                                                                                ),
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
                                                                                final rowIsFollowingResponse = snapshot.data!;
                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (widget.userId == 0)
                                                                                      FutureBuilder<ApiCallResponse>(
                                                                                        future: SmeGroup.getFollowersCall.call(
                                                                                          pageNumber: 0,
                                                                                          pageSize: 100,
                                                                                          sortBy: getJsonField(
                                                                                            companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                            r'''$.companyName''',
                                                                                          ).toString(),
                                                                                          accessToken: FFAppState().accessToken,
                                                                                          userId: valueOrDefault<int>(
                                                                                            widget.userId,
                                                                                            0,
                                                                                          ),
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
                                                                                          final textGetFollowersResponse = snapshot.data!;
                                                                                          return InkWell(
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
                                                                                                        height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                        child: FollowListWidget(
                                                                                                          followersList: getJsonField(
                                                                                                            textGetFollowersResponse.jsonBody,
                                                                                                            r'''$''',
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ));
                                                                                                },
                                                                                              ).then((value) => safeSetState(() {}));
                                                                                            },
                                                                                            child: Text(
                                                                                              '${getJsonField(
                                                                                                textGetFollowersResponse.jsonBody,
                                                                                                r'''$.total''',
                                                                                              ).toString()}  Followers',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    if ((widget.userId != 0) &&
                                                                                        (getJsonField(
                                                                                              rowIsFollowingResponse.jsonBody,
                                                                                              r'''$.count''',
                                                                                            ) ==
                                                                                            random_data.randomInteger(0, 0)))
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          _model.apiResultixj = await SmeGroup.addFollowerCall.call(
                                                                                            accessToken: FFAppState().accessToken,
                                                                                            userId: widget.userId.toString(),
                                                                                          );
                                                                                          if ((_model.apiResultixj?.succeeded ?? true)) {
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  'You are following now',
                                                                                                  style: TextStyle(
                                                                                                    color: Color(0xFF67CB45),
                                                                                                  ),
                                                                                                ),
                                                                                                duration: Duration(milliseconds: 4000),
                                                                                                backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                              ),
                                                                                            );
                                                                                            setState(() {});
                                                                                          }

                                                                                          setState(() {});
                                                                                        },
                                                                                        child: Text(
                                                                                          'Follow',
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((widget.userId != 0) &&
                                                                                        (getJsonField(
                                                                                              rowIsFollowingResponse.jsonBody,
                                                                                              r'''$.count''',
                                                                                            ) ==
                                                                                            random_data.randomInteger(1, 1)))
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          _model.apiResultlb3 = await SmeGroup.unFollowCall.call(
                                                                                            followeeId: widget.userId,
                                                                                            accessToken: FFAppState().accessToken,
                                                                                          );
                                                                                          if ((_model.apiResultlb3?.succeeded ?? true)) {
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  getJsonField(
                                                                                                    (_model.apiResultlb3?.jsonBody ?? ''),
                                                                                                    r'''$.success''',
                                                                                                  ).toString(),
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

                                                                                          setState(() {});
                                                                                        },
                                                                                        child: Text(
                                                                                          'Unfollow',
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                );
                                                                              },
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
                                                        Divider(
                                                          height: 1.0,
                                                          thickness: 1.0,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                'About',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium,
                                                              ),
                                                            ),
                                                            if (widget.userId ==
                                                                0)
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .edit_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    barrierColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 1.0,
                                                                            child:
                                                                                UpdateOrgDetailsPageWidget(
                                                                              orgDetails: getJsonField(
                                                                                companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                r'''$''',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ));
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                        if (_model
                                                                .showMoreContent ==
                                                            false)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Wrap(
                                                              spacing: 0.0,
                                                              runSpacing: 0.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      getJsonField(
                                                                                companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                r'''$..about''',
                                                                              ) ==
                                                                              null
                                                                          ? 'N/A'
                                                                          : valueOrDefault<
                                                                              String>(
                                                                              getJsonField(
                                                                                companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                r'''$..about''',
                                                                              ).toString(),
                                                                              'N/A',
                                                                            ),
                                                                      'N/A',
                                                                    ).maybeHandleOverflow(
                                                                      maxChars:
                                                                          100,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                  ),
                                                                ),
                                                                if (getJsonField(
                                                                      companyDetailGetOrgDetailsResponse
                                                                          .jsonBody,
                                                                      r'''$..about''',
                                                                    ) !=
                                                                    null)
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model.showMoreContent =
                                                                            true;
                                                                      });
                                                                    },
                                                                    text:
                                                                        'Read More',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (_model
                                                                .showMoreContent ==
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Wrap(
                                                              spacing: 0.0,
                                                              runSpacing: 0.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      getJsonField(
                                                                                companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                r'''$..about''',
                                                                              ) ==
                                                                              null
                                                                          ? 'N/A'
                                                                          : valueOrDefault<
                                                                              String>(
                                                                              getJsonField(
                                                                                companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                r'''$..about''',
                                                                              ).toString(),
                                                                              'N/A',
                                                                            ),
                                                                      'N/A',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.showMoreContent =
                                                                          false;
                                                                    });
                                                                  },
                                                                  text:
                                                                      'Show  less',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (getJsonField(
                                                                    (_model.headerBannerAPIResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.healthChecks..name''',
                                                                  ) !=
                                                                  null)
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Badges Earned',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (functions.showHealthCheckBadge(
                                                                                getJsonField(
                                                                                  (_model.headerBannerAPIResponse?.jsonBody ?? ''),
                                                                                  r'''$.healthChecks..name''',
                                                                                ),
                                                                                _model.lokaleHealthBadge))
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Image.asset(
                                                                                    'assets/images/Design_Wizard_Badges_(1).png',
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                  Text(
                                                                                    'Lokal is Beautiful',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            if (functions.showHealthCheckBadge(
                                                                                getJsonField(
                                                                                  (_model.headerBannerAPIResponse?.jsonBody ?? ''),
                                                                                  r'''$.healthChecks..name''',
                                                                                ),
                                                                                _model.businessHealthCheckBadge))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Image.asset(
                                                                                      'assets/images/Design_Wizard_Badges_(2).png',
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                    Text(
                                                                                      'Resilience Award',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            if (functions.showHealthCheckBadge(
                                                                                getJsonField(
                                                                                  (_model.headerBannerAPIResponse?.jsonBody ?? ''),
                                                                                  r'''$.healthChecks..name''',
                                                                                ),
                                                                                _model.investHealthCheckBadge))
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Image.asset(
                                                                                    'assets/images/Design_Wizard_Badges.png',
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                  Text(
                                                                                    'Investment ready',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableController1,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Text(
                                                                  'Products, Services ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium,
                                                                ),
                                                                collapsed:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Explore what we offer',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Color(0x8A000000),
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                expanded:
                                                                    InkWell(
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
                                                                      _model.showContent =
                                                                          false;
                                                                    });
                                                                    if (_model
                                                                            .showContent ==
                                                                        false) {
                                                                      setState(
                                                                          () {
                                                                        _model.showContent =
                                                                            true;
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        _model.showContent =
                                                                            false;
                                                                      });
                                                                    }
                                                                  },
                                                                  child: FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future: SmeGroup
                                                                        .getContactDetailPubicCall
                                                                        .call(
                                                                      accessToken:
                                                                          FFAppState()
                                                                              .accessToken,
                                                                      userId:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        widget
                                                                            .userId,
                                                                        0,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitFadingCircle(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnGetContactDetailPubicResponse =
                                                                          snapshot
                                                                              .data!;
                                                                      return SingleChildScrollView(
                                                                        primary:
                                                                            false,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Products',
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).labelLarge,
                                                                                    ),
                                                                                    if (widget.userId == 0)
                                                                                      FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 0.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 40.0,
                                                                                        icon: Icon(
                                                                                          Icons.add_circle,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            barrierColor: Color(0x00000000),
                                                                                            enableDrag: false,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return WebViewAware(
                                                                                                  child: GestureDetector(
                                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                child: Padding(
                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                  child: Container(
                                                                                                    height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                    child: AddProductWidget(),
                                                                                                  ),
                                                                                                ),
                                                                                              ));
                                                                                            },
                                                                                          ).then((value) => safeSetState(() {}));
                                                                                        },
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                if (false)
                                                                                  Text(
                                                                                    'View all',
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                setState(() {
                                                                                  _model.showProductActions = false;
                                                                                });
                                                                              },
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: 300.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: FutureBuilder<ApiCallResponse>(
                                                                                  future: (_model.apiRequestCompleter1 ??= Completer<ApiCallResponse>()
                                                                                        ..complete(SmeGroup.getProductsCall.call(
                                                                                          pageNumber: 0,
                                                                                          pageSize: 100,
                                                                                          accessToken: FFAppState().accessToken,
                                                                                          userId: valueOrDefault<int>(
                                                                                            widget.userId,
                                                                                            0,
                                                                                          ),
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
                                                                                    final listViewGetProductsResponse = snapshot.data!;
                                                                                    return Builder(
                                                                                      builder: (context) {
                                                                                        final content = SmeGroup.getProductsCall
                                                                                                .content(
                                                                                                  listViewGetProductsResponse.jsonBody,
                                                                                                )
                                                                                                ?.map((e) => e)
                                                                                                .toList()
                                                                                                ?.toList() ??
                                                                                            [];
                                                                                        if (content.isEmpty) {
                                                                                          return EmptyListViewComponentWidget(
                                                                                            listIsFor: 'product',
                                                                                          );
                                                                                        }
                                                                                        return ListView.builder(
                                                                                          padding: EdgeInsets.zero,
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          itemCount: content.length,
                                                                                          itemBuilder: (context, contentIndex) {
                                                                                            final contentItem = content[contentIndex];
                                                                                            return Stack(
                                                                                              alignment: AlignmentDirectional(0.44999999999999996, -0.7),
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 16.0, 10.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      context.pushNamed(
                                                                                                        'ProductDetail',
                                                                                                        queryParameters: {
                                                                                                          'productinfo': serializeParam(
                                                                                                            contentItem,
                                                                                                            ParamType.JSON,
                                                                                                          ),
                                                                                                          'userId': serializeParam(
                                                                                                            widget.userId,
                                                                                                            ParamType.int,
                                                                                                          ),
                                                                                                          'orgDeatils': serializeParam(
                                                                                                            getJsonField(
                                                                                                              companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                                              r'''$''',
                                                                                                            ),
                                                                                                            ParamType.JSON,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                      );
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 300.0,
                                                                                                      height: 300.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      getJsonField(
                                                                                                                        contentItem,
                                                                                                                        r'''$.productName''',
                                                                                                                      ).toString(),
                                                                                                                      maxLines: 1,
                                                                                                                      style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                if (widget.userId == 0)
                                                                                                                  FlutterFlowIconButton(
                                                                                                                    borderColor: Colors.transparent,
                                                                                                                    borderRadius: 30.0,
                                                                                                                    borderWidth: 1.0,
                                                                                                                    buttonSize: 30.0,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.more_vert,
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      size: 20.0,
                                                                                                                    ),
                                                                                                                    onPressed: () async {
                                                                                                                      setState(() {
                                                                                                                        FFAppState().editProductItem = getJsonField(
                                                                                                                          contentItem,
                                                                                                                          r'''$.productId''',
                                                                                                                        );
                                                                                                                      });
                                                                                                                      setState(() {
                                                                                                                        _model.showServiceActions = false;
                                                                                                                      });
                                                                                                                      if (_model.showProductActions == false) {
                                                                                                                        setState(() {
                                                                                                                          _model.showProductActions = true;
                                                                                                                        });
                                                                                                                      } else {
                                                                                                                        setState(() {
                                                                                                                          _model.showProductActions = false;
                                                                                                                        });
                                                                                                                      }
                                                                                                                    },
                                                                                                                  ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                              child: Image.network(
                                                                                                                valueOrDefault<String>(
                                                                                                                  getJsonField(
                                                                                                                    functions.image(getJsonField(
                                                                                                                      contentItem,
                                                                                                                      r'''$.featuredImage''',
                                                                                                                    ).toString()),
                                                                                                                    r'''$.image''',
                                                                                                                  ),
                                                                                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw-bEkdCP8SGyEaKUiE-SXLonzfXIp8mgi546odmsBpwOkDRE5maYDfkPxtSORlCwA9znDkOmbi94&usqp=CAU&ec=48600113',
                                                                                                                ),
                                                                                                                width: double.infinity,
                                                                                                                height: 150.0,
                                                                                                                fit: BoxFit.contain,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                          child: FaIcon(
                                                                                                                            FontAwesomeIcons.briefcase,
                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                            size: 18.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          '${getJsonField(
                                                                                                                            contentItem,
                                                                                                                            r'''$.price''',
                                                                                                                          ).toString()} AED',
                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                if (!((widget.userId == 0) ||
                                                                                                                    (getJsonField(
                                                                                                                          columnGetContactDetailPubicResponse.jsonBody,
                                                                                                                          r'''$.companyName''',
                                                                                                                        ) ==
                                                                                                                        getJsonField(
                                                                                                                          companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                                                          r'''$.companyName''',
                                                                                                                        ))))
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              if (getJsonField(
                                                                                                                                    contentItem,
                                                                                                                                    r'''$.booked''',
                                                                                                                                  ) ==
                                                                                                                                  false)
                                                                                                                                InkWell(
                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                  onTap: () async {
                                                                                                                                    _model.apiResultvn5 = await SmeGroup.bookProductCall.call(
                                                                                                                                      accessToken: FFAppState().accessToken,
                                                                                                                                      productId: getJsonField(
                                                                                                                                        contentItem,
                                                                                                                                        r'''$.productId''',
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                    if ((_model.apiResultvn5?.succeeded ?? true)) {
                                                                                                                                      await showDialog(
                                                                                                                                        context: context,
                                                                                                                                        builder: (alertDialogContext) {
                                                                                                                                          return WebViewAware(
                                                                                                                                              child: AlertDialog(
                                                                                                                                            title: Text('Success'),
                                                                                                                                            content: Text('Your request hasbeen sent'),
                                                                                                                                            actions: [
                                                                                                                                              TextButton(
                                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                                                child: Text('Ok'),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ));
                                                                                                                                        },
                                                                                                                                      );
                                                                                                                                      setState(() => _model.apiRequestCompleter1 = null);
                                                                                                                                      await _model.waitForApiRequestCompleted1();
                                                                                                                                    } else {
                                                                                                                                      await showDialog(
                                                                                                                                        context: context,
                                                                                                                                        builder: (alertDialogContext) {
                                                                                                                                          return WebViewAware(
                                                                                                                                              child: AlertDialog(
                                                                                                                                            title: Text('Error'),
                                                                                                                                            content: Text('Something went wrong!'),
                                                                                                                                            actions: [
                                                                                                                                              TextButton(
                                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                                                child: Text('Try again'),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ));
                                                                                                                                        },
                                                                                                                                      );
                                                                                                                                    }

                                                                                                                                    setState(() {});
                                                                                                                                  },
                                                                                                                                  child: Container(
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                                                                    ),
                                                                                                                                    child: Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          Icon(
                                                                                                                                            Icons.message,
                                                                                                                                            color: Colors.white,
                                                                                                                                            size: 14.0,
                                                                                                                                          ),
                                                                                                                                          Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                            child: Text(
                                                                                                                                              'I\'m interested',
                                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                                    fontFamily: 'Roboto',
                                                                                                                                                    color: Colors.white,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              if (getJsonField(
                                                                                                                                    contentItem,
                                                                                                                                    r'''$.booked''',
                                                                                                                                  ) ==
                                                                                                                                  true)
                                                                                                                                Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  ),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                    children: [
                                                                                                                                      FaIcon(
                                                                                                                                        FontAwesomeIcons.solidCheckCircle,
                                                                                                                                        color: Color(0xFF67CB45),
                                                                                                                                        size: 16.0,
                                                                                                                                      ),
                                                                                                                                      Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                        child: Text(
                                                                                                                                          'Booked',
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                if ((getJsonField(
                                                                                                          contentItem,
                                                                                                          r'''$.productId''',
                                                                                                        ) ==
                                                                                                        FFAppState().editProductItem) &&
                                                                                                    (_model.showProductActions == true))
                                                                                                  Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: wrapWithModel(
                                                                                                      model: _model.moreDetailsModels1.getModel(
                                                                                                        getJsonField(
                                                                                                          contentItem,
                                                                                                          r'''$.productId''',
                                                                                                        ).toString(),
                                                                                                        contentIndex,
                                                                                                      ),
                                                                                                      updateCallback: () => setState(() {}),
                                                                                                      updateOnChange: true,
                                                                                                      child: MoreDetailsWidget(
                                                                                                        key: Key(
                                                                                                          'Keyzum_${getJsonField(
                                                                                                            contentItem,
                                                                                                            r'''$.productId''',
                                                                                                          ).toString()}',
                                                                                                        ),
                                                                                                        productItem: contentItem,
                                                                                                        question: null,
                                                                                                        serviceItem: null,
                                                                                                        answerItem: null,
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
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Services',
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                      ),
                                                                                      if (widget.userId == 0)
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 30.0,
                                                                                          borderWidth: 1.0,
                                                                                          buttonSize: 40.0,
                                                                                          icon: Icon(
                                                                                            Icons.add_circle,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 20.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              barrierColor: Color(0x00000000),
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return WebViewAware(
                                                                                                    child: GestureDetector(
                                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: Container(
                                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                      child: AddServiceWidget(),
                                                                                                    ),
                                                                                                  ),
                                                                                                ));
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          },
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  if (false)
                                                                                    Text(
                                                                                      'View all',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Stack(
                                                                              children: [
                                                                                Container(
                                                                                  width: double.infinity,
                                                                                  height: 350.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: FutureBuilder<ApiCallResponse>(
                                                                                    future: (_model.apiRequestCompleter2 ??= Completer<ApiCallResponse>()
                                                                                          ..complete(SmeGroup.getServiceCardListCall.call(
                                                                                            accessToken: FFAppState().accessToken,
                                                                                            userId: valueOrDefault<int>(
                                                                                              widget.userId,
                                                                                              0,
                                                                                            ),
                                                                                            pageNumber: 0,
                                                                                            pageSize: 100,
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
                                                                                      final listViewGetServiceCardListResponse = snapshot.data!;
                                                                                      return Builder(
                                                                                        builder: (context) {
                                                                                          final contentService = SmeGroup.getServiceCardListCall
                                                                                                  .content(
                                                                                                    listViewGetServiceCardListResponse.jsonBody,
                                                                                                  )
                                                                                                  ?.map((e) => e)
                                                                                                  .toList()
                                                                                                  ?.toList() ??
                                                                                              [];
                                                                                          if (contentService.isEmpty) {
                                                                                            return EmptyListViewComponentWidget(
                                                                                              listIsFor: 'service',
                                                                                            );
                                                                                          }
                                                                                          return ListView.builder(
                                                                                            padding: EdgeInsets.zero,
                                                                                            scrollDirection: Axis.horizontal,
                                                                                            itemCount: contentService.length,
                                                                                            itemBuilder: (context, contentServiceIndex) {
                                                                                              final contentServiceItem = contentService[contentServiceIndex];
                                                                                              return Stack(
                                                                                                alignment: AlignmentDirectional(0.45, -0.7),
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 16.0, 10.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        setState(() {
                                                                                                          _model.showServiceActions = false;
                                                                                                        });
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 300.0,
                                                                                                        height: 330.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              context.pushNamed(
                                                                                                                'ServiceDetail',
                                                                                                                queryParameters: {
                                                                                                                  'servicecardInfo': serializeParam(
                                                                                                                    contentServiceItem,
                                                                                                                    ParamType.JSON,
                                                                                                                  ),
                                                                                                                  'userId': serializeParam(
                                                                                                                    widget.userId,
                                                                                                                    ParamType.int,
                                                                                                                  ),
                                                                                                                  'orgDetail': serializeParam(
                                                                                                                    getJsonField(
                                                                                                                      companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                                                      r'''$''',
                                                                                                                    ),
                                                                                                                    ParamType.JSON,
                                                                                                                  ),
                                                                                                                }.withoutNulls,
                                                                                                              );
                                                                                                            },
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                              children: [
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          getJsonField(
                                                                                                                            contentServiceItem,
                                                                                                                            r'''$.name''',
                                                                                                                          ).toString().maybeHandleOverflow(maxChars: 50),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    if (widget.userId == 0)
                                                                                                                      FlutterFlowIconButton(
                                                                                                                        borderColor: Colors.transparent,
                                                                                                                        borderRadius: 30.0,
                                                                                                                        borderWidth: 1.0,
                                                                                                                        buttonSize: 30.0,
                                                                                                                        icon: Icon(
                                                                                                                          Icons.more_vert,
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                        onPressed: () async {
                                                                                                                          setState(() {
                                                                                                                            FFAppState().EditService = getJsonField(
                                                                                                                              contentServiceItem,
                                                                                                                              r'''$.id''',
                                                                                                                            );
                                                                                                                          });
                                                                                                                          setState(() {
                                                                                                                            _model.showProductActions = false;
                                                                                                                          });
                                                                                                                          if (_model.showServiceActions == false) {
                                                                                                                            setState(() {
                                                                                                                              _model.showServiceActions = true;
                                                                                                                            });
                                                                                                                          } else {
                                                                                                                            setState(() {
                                                                                                                              _model.showServiceActions = false;
                                                                                                                            });
                                                                                                                          }
                                                                                                                        },
                                                                                                                      ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                  child: ClipRRect(
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                    child: Image.network(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        getJsonField(
                                                                                                                          functions.image(getJsonField(
                                                                                                                            contentServiceItem,
                                                                                                                            r'''$.image''',
                                                                                                                          ).toString()),
                                                                                                                          r'''$.image''',
                                                                                                                        ),
                                                                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw-bEkdCP8SGyEaKUiE-SXLonzfXIp8mgi546odmsBpwOkDRE5maYDfkPxtSORlCwA9znDkOmbi94&usqp=CAU&ec=48600113',
                                                                                                                      ),
                                                                                                                      width: double.infinity,
                                                                                                                      height: 150.0,
                                                                                                                      fit: BoxFit.contain,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          FaIcon(
                                                                                                                            FontAwesomeIcons.briefcase,
                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                            size: 18.0,
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  getJsonField(
                                                                                                                                    contentServiceItem,
                                                                                                                                    r'''$.priceEstimate''',
                                                                                                                                  ).toString(),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                        fontFamily: 'Roboto',
                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                                Text(
                                                                                                                                  'AED',
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Roboto',
                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                        fontSize: 12.0,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                        children: [
                                                                                                                          Icon(
                                                                                                                            Icons.calendar_today,
                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                            size: 18.0,
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              getJsonField(
                                                                                                                                contentServiceItem,
                                                                                                                                r'''$.timeEstimate''',
                                                                                                                              ).toString(),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Roboto',
                                                                                                                                    fontSize: 12.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    if (!((widget.userId == 0) ||
                                                                                                                        (getJsonField(
                                                                                                                              columnGetContactDetailPubicResponse.jsonBody,
                                                                                                                              r'''$.companyName''',
                                                                                                                            ) ==
                                                                                                                            getJsonField(
                                                                                                                              companyDetailGetOrgDetailsResponse.jsonBody,
                                                                                                                              r'''$.companyName''',
                                                                                                                            ))))
                                                                                                                      Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  if (getJsonField(
                                                                                                                                        contentServiceItem,
                                                                                                                                        r'''$.booked''',
                                                                                                                                      ) ==
                                                                                                                                      false)
                                                                                                                                    InkWell(
                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                      onTap: () async {
                                                                                                                                        _model.apiResultService = await SmeGroup.bookServiceCall.call(
                                                                                                                                          serviceId: getJsonField(
                                                                                                                                            contentServiceItem,
                                                                                                                                            r'''$.id''',
                                                                                                                                          ),
                                                                                                                                          accessToken: FFAppState().accessToken,
                                                                                                                                        );
                                                                                                                                        if ((_model.apiResultService?.succeeded ?? true)) {
                                                                                                                                          await showDialog(
                                                                                                                                            context: context,
                                                                                                                                            builder: (alertDialogContext) {
                                                                                                                                              return WebViewAware(
                                                                                                                                                  child: AlertDialog(
                                                                                                                                                title: Text('Success'),
                                                                                                                                                content: Text('Your request hasbeen sent'),
                                                                                                                                                actions: [
                                                                                                                                                  TextButton(
                                                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                                                    child: Text('Ok'),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ));
                                                                                                                                            },
                                                                                                                                          );
                                                                                                                                          setState(() => _model.apiRequestCompleter2 = null);
                                                                                                                                          await _model.waitForApiRequestCompleted2();
                                                                                                                                        } else {
                                                                                                                                          await showDialog(
                                                                                                                                            context: context,
                                                                                                                                            builder: (alertDialogContext) {
                                                                                                                                              return WebViewAware(
                                                                                                                                                  child: AlertDialog(
                                                                                                                                                title: Text('Error'),
                                                                                                                                                content: Text('Something went wrong!'),
                                                                                                                                                actions: [
                                                                                                                                                  TextButton(
                                                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                                                    child: Text('Try again'),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ));
                                                                                                                                            },
                                                                                                                                          );
                                                                                                                                        }

                                                                                                                                        setState(() {});
                                                                                                                                      },
                                                                                                                                      child: Container(
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                                                                        ),
                                                                                                                                        child: Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                                                                                                                                          child: Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              Icon(
                                                                                                                                                Icons.message,
                                                                                                                                                color: Colors.white,
                                                                                                                                                size: 14.0,
                                                                                                                                              ),
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  'I\'m interested',
                                                                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                                        fontFamily: 'Roboto',
                                                                                                                                                        color: Colors.white,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  if (getJsonField(
                                                                                                                                        contentServiceItem,
                                                                                                                                        r'''$.booked''',
                                                                                                                                      ) ==
                                                                                                                                      true)
                                                                                                                                    Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      ),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                        children: [
                                                                                                                                          FaIcon(
                                                                                                                                            FontAwesomeIcons.solidCheckCircle,
                                                                                                                                            color: Color(0xFF67CB45),
                                                                                                                                            size: 16.0,
                                                                                                                                          ),
                                                                                                                                          Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                            child: Text(
                                                                                                                                              'Booked',
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ],
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
                                                                                                  if ((getJsonField(
                                                                                                            contentServiceItem,
                                                                                                            r'''$.id''',
                                                                                                          ) ==
                                                                                                          FFAppState().EditService) &&
                                                                                                      (_model.showServiceActions == true))
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: wrapWithModel(
                                                                                                        model: _model.moreDetailsModels2.getModel(
                                                                                                          getJsonField(
                                                                                                            contentServiceItem,
                                                                                                            r'''$.id''',
                                                                                                          ).toString(),
                                                                                                          contentServiceIndex,
                                                                                                        ),
                                                                                                        updateCallback: () => setState(() {}),
                                                                                                        child: MoreDetailsWidget(
                                                                                                          key: Key(
                                                                                                            'Key1nl_${getJsonField(
                                                                                                              contentServiceItem,
                                                                                                              r'''$.id''',
                                                                                                            ).toString()}',
                                                                                                          ),
                                                                                                          question: null,
                                                                                                          productItem: null,
                                                                                                          serviceItem: contentServiceItem,
                                                                                                          answerItem: null,
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
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableController2,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Text(
                                                                  'Get in touch',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium,
                                                                ),
                                                                collapsed:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Contact details',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Color(0x8A000000),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                expanded:
                                                                    InkWell(
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
                                                                      _model.showContent =
                                                                          false;
                                                                    });
                                                                    if (_model
                                                                            .showContent ==
                                                                        false) {
                                                                      setState(
                                                                          () {
                                                                        _model.showContent =
                                                                            true;
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        _model.showContent =
                                                                            false;
                                                                      });
                                                                    }
                                                                  },
                                                                  child: FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future: SmeGroup
                                                                        .getContactDetailPubicCall
                                                                        .call(
                                                                      accessToken:
                                                                          FFAppState()
                                                                              .accessToken,
                                                                      userId:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        widget
                                                                            .userId,
                                                                        0,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitFadingCircle(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnGetContactDetailPubicResponse =
                                                                          snapshot
                                                                              .data!;
                                                                      return SingleChildScrollView(
                                                                        primary:
                                                                            false,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                if (widget.userId == 0)
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Edit',
                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                      ),
                                                                                      if (widget.userId == 0)
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 20.0,
                                                                                          borderWidth: 1.0,
                                                                                          buttonSize: 40.0,
                                                                                          icon: Icon(
                                                                                            Icons.edit_sharp,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 18.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              barrierColor: Color(0x00000000),
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return WebViewAware(
                                                                                                    child: GestureDetector(
                                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: Container(
                                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                      child: GetInTouchDetailsWidget(
                                                                                                        getinTouch: SmeGroup.getContactDetailPubicCall.getContactDetails(
                                                                                                          columnGetContactDetailPubicResponse.jsonBody,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ));
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          },
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 20.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.location_on,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 22.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      getJsonField(
                                                                                                        columnGetContactDetailPubicResponse.jsonBody,
                                                                                                        r'''$.address''',
                                                                                                      ).toString(),
                                                                                                      'N/A',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.linkedin,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 22.0,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          columnGetContactDetailPubicResponse.jsonBody,
                                                                                                          r'''$.linkedIn''',
                                                                                                        ).toString(),
                                                                                                        'N/A',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.mail,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 22.0,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          columnGetContactDetailPubicResponse.jsonBody,
                                                                                                          r'''$.email''',
                                                                                                        ).toString(),
                                                                                                        'N/A',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.globeAsia,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 22.0,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          columnGetContactDetailPubicResponse.jsonBody,
                                                                                                          r'''$.website''',
                                                                                                        ).toString(),
                                                                                                        'N/A',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await launchUrl(Uri(
                                                                                                  scheme: 'tel',
                                                                                                  path: getJsonField(
                                                                                                    columnGetContactDetailPubicResponse.jsonBody,
                                                                                                    r'''$.contactNo''',
                                                                                                  ).toString(),
                                                                                                ));
                                                                                              },
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.phone,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          getJsonField(
                                                                                                            columnGetContactDetailPubicResponse.jsonBody,
                                                                                                            r'''$.contactNo''',
                                                                                                          ).toString(),
                                                                                                          'N/A',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.facebook,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'N/A',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.instagram,
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  size: 22.0,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'N/A',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableController3,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Text(
                                                                  'Team',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium,
                                                                ),
                                                                collapsed:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Team members',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Color(0x8A000000),
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                expanded:
                                                                    InkWell(
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
                                                                      _model.showContent =
                                                                          false;
                                                                    });
                                                                    if (_model
                                                                            .showContent ==
                                                                        false) {
                                                                      setState(
                                                                          () {
                                                                        _model.showContent =
                                                                            true;
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        _model.showContent =
                                                                            false;
                                                                      });
                                                                    }
                                                                  },
                                                                  child: FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future: SmeGroup
                                                                        .getContactDetailPubicCall
                                                                        .call(
                                                                      accessToken:
                                                                          FFAppState()
                                                                              .accessToken,
                                                                      userId:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        widget
                                                                            .userId,
                                                                        0,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitFadingCircle(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnGetContactDetailPubicResponse =
                                                                          snapshot
                                                                              .data!;
                                                                      return SingleChildScrollView(
                                                                        primary:
                                                                            false,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (widget.userId ==
                                                                                0)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Team',
                                                                                      style: FlutterFlowTheme.of(context).labelLarge,
                                                                                    ),
                                                                                    FlutterFlowIconButton(
                                                                                      borderColor: Colors.transparent,
                                                                                      borderRadius: 20.0,
                                                                                      borderWidth: 1.0,
                                                                                      buttonSize: 40.0,
                                                                                      icon: Icon(
                                                                                        Icons.person_add_alt_1_rounded,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          barrierColor: Color(0x00000000),
                                                                                          enableDrag: false,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return WebViewAware(
                                                                                                child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: Container(
                                                                                                  height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                  child: AddTeamMemberWidget(),
                                                                                                ),
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ).then((value) => safeSetState(() {}));
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 12.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.85,
                                                                                    height: 200.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: FutureBuilder<ApiCallResponse>(
                                                                                      future: SmeGroup.getTeamMemberListCall.call(
                                                                                        userId: valueOrDefault<int>(
                                                                                          widget.userId,
                                                                                          0,
                                                                                        ),
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
                                                                                        final listViewGetTeamMemberListResponse = snapshot.data!;
                                                                                        return Builder(
                                                                                          builder: (context) {
                                                                                            final teamList = SmeGroup.getTeamMemberListCall
                                                                                                    .teamList(
                                                                                                      listViewGetTeamMemberListResponse.jsonBody,
                                                                                                    )
                                                                                                    ?.map((e) => e)
                                                                                                    .toList()
                                                                                                    ?.toList() ??
                                                                                                [];
                                                                                            return ListView.builder(
                                                                                              padding: EdgeInsets.zero,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              itemCount: teamList.length,
                                                                                              itemBuilder: (context, teamListIndex) {
                                                                                                final teamListItem = teamList[teamListIndex];
                                                                                                return Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 145.0,
                                                                                                    height: 145.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              if (widget.userId == 0)
                                                                                                                FlutterFlowIconButton(
                                                                                                                  borderColor: Colors.transparent,
                                                                                                                  borderRadius: 30.0,
                                                                                                                  borderWidth: 1.0,
                                                                                                                  buttonSize: 40.0,
                                                                                                                  icon: Icon(
                                                                                                                    Icons.delete,
                                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                                    size: 20.0,
                                                                                                                  ),
                                                                                                                  onPressed: () async {
                                                                                                                    await showModalBottomSheet(
                                                                                                                      isScrollControlled: true,
                                                                                                                      backgroundColor: Color(0x0057636C),
                                                                                                                      barrierColor: Color(0x6757636C),
                                                                                                                      enableDrag: false,
                                                                                                                      context: context,
                                                                                                                      builder: (context) {
                                                                                                                        return WebViewAware(
                                                                                                                            child: GestureDetector(
                                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                          child: Padding(
                                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                                            child: Container(
                                                                                                                              height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                                                              child: DeleteTeamMemberWidget(
                                                                                                                                teamMemberID: teamListItem,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ));
                                                                                                                      },
                                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                                  },
                                                                                                                ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                                          child: Image.network(
                                                                                                            valueOrDefault<String>(
                                                                                                              getJsonField(
                                                                                                                functions.image(getJsonField(
                                                                                                                  teamListItem,
                                                                                                                  r'''$.image''',
                                                                                                                ).toString()),
                                                                                                                r'''$.image''',
                                                                                                              ),
                                                                                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw-bEkdCP8SGyEaKUiE-SXLonzfXIp8mgi546odmsBpwOkDRE5maYDfkPxtSORlCwA9znDkOmbi94&usqp=CAU&ec=48600113',
                                                                                                            ),
                                                                                                            width: 100.0,
                                                                                                            height: 100.0,
                                                                                                            fit: BoxFit.contain,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                                                                                                          child: Text(
                                                                                                            getJsonField(
                                                                                                              teamListItem,
                                                                                                              r'''$.empName''',
                                                                                                            ).toString(),
                                                                                                            textAlign: TextAlign.center,
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
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
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      40.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              color: Color(
                                                                  0x00000000),
                                                              child:
                                                                  ExpandableNotifier(
                                                                controller: _model
                                                                    .expandableController4,
                                                                child:
                                                                    ExpandablePanel(
                                                                  header: Text(
                                                                    'My Story',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium,
                                                                  ),
                                                                  collapsed:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'The journey of my company',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: Color(0x8A000000),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  expanded:
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
                                                                      setState(
                                                                          () {
                                                                        _model.showContent =
                                                                            false;
                                                                      });
                                                                      if (_model
                                                                              .showContent ==
                                                                          false) {
                                                                        setState(
                                                                            () {
                                                                          _model.showContent =
                                                                              true;
                                                                        });
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          _model.showContent =
                                                                              false;
                                                                        });
                                                                      }
                                                                    },
                                                                    child: FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: SmeGroup
                                                                          .getUserStoryCall
                                                                          .call(
                                                                        accessToken:
                                                                            FFAppState().accessToken,
                                                                        userId:
                                                                            valueOrDefault<int>(
                                                                          widget
                                                                              .userId,
                                                                          0,
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitFadingCircle(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final columnGetUserStoryResponse =
                                                                            snapshot.data!;
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            if (getJsonField(
                                                                                  columnGetUserStoryResponse.jsonBody,
                                                                                  r'''$.myStory''',
                                                                                ) !=
                                                                                null)
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  if (widget.userId == 0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Edit',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: Color(0xFF3A5FFF),
                                                                                                fontSize: 16.0,
                                                                                              ),
                                                                                        ),
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 30.0,
                                                                                          borderWidth: 1.0,
                                                                                          buttonSize: 40.0,
                                                                                          icon: Icon(
                                                                                            Icons.edit_sharp,
                                                                                            color: Color(0xFF3A5FFF),
                                                                                            size: 20.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              barrierColor: Color(0x00000000),
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return WebViewAware(
                                                                                                    child: GestureDetector(
                                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: Container(
                                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                      child: EditMyStoryWidget(
                                                                                                        myStory: getJsonField(
                                                                                                          columnGetUserStoryResponse.jsonBody,
                                                                                                          r'''$.myStory''',
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ));
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        columnGetUserStoryResponse.jsonBody,
                                                                                        r'''$.myStory.pastTitle''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        columnGetUserStoryResponse.jsonBody,
                                                                                        r'''$.myStory.past''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        columnGetUserStoryResponse.jsonBody,
                                                                                        r'''$.myStory.nowTitle''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        columnGetUserStoryResponse.jsonBody,
                                                                                        r'''$.myStory.now''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        columnGetUserStoryResponse.jsonBody,
                                                                                        r'''$.myStory.futureTitle''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        columnGetUserStoryResponse.jsonBody,
                                                                                        r'''$.myStory.future''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            if (getJsonField(
                                                                                  columnGetUserStoryResponse.jsonBody,
                                                                                  r'''$.myStory''',
                                                                                ) ==
                                                                                null)
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  if (widget.userId == 0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Edit',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: Color(0xFF3A5FFF),
                                                                                                fontSize: 16.0,
                                                                                              ),
                                                                                        ),
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 30.0,
                                                                                          borderWidth: 1.0,
                                                                                          buttonSize: 40.0,
                                                                                          icon: Icon(
                                                                                            Icons.edit_sharp,
                                                                                            color: Color(0xFF3A5FFF),
                                                                                            size: 20.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              barrierColor: Color(0x00000000),
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return WebViewAware(
                                                                                                    child: GestureDetector(
                                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: Container(
                                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                      child: EditMyStoryWidget(
                                                                                                        myStory: getJsonField(
                                                                                                          columnGetUserStoryResponse.jsonBody,
                                                                                                          r'''$.myStory''',
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ));
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                    child: Text(
                                                                                      'Past',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                    child: Text(
                                                                                      'Present',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Future',
                                                                                    style: FlutterFlowTheme.of(context).labelMedium,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  theme:
                                                                      ExpandableThemeData(
                                                                    tapHeaderToExpand:
                                                                        true,
                                                                    tapBodyToExpand:
                                                                        false,
                                                                    tapBodyToCollapse:
                                                                        false,
                                                                    headerAlignment:
                                                                        ExpandablePanelHeaderAlignment
                                                                            .center,
                                                                    hasIcon:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (widget.userId == 0)
                            Align(
                              alignment: AlignmentDirectional(0.92, -0.98),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.cloud_upload,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                          child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: BannerChangeWidget(
                                              oldBannerImage: getJsonField(
                                                stackGetBannerUserIdResponse
                                                    .jsonBody,
                                                r'''$''',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ));
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
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
        );
      },
    );
  }
}
