import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'follow_list_model.dart';
export 'follow_list_model.dart';

class FollowListWidget extends StatefulWidget {
  const FollowListWidget({
    Key? key,
    this.followersList,
  }) : super(key: key);

  final dynamic followersList;

  @override
  _FollowListWidgetState createState() => _FollowListWidgetState();
}

class _FollowListWidgetState extends State<FollowListWidget>
    with TickerProviderStateMixin {
  late FollowListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowListModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 45.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0.0, 0),
                  child: TabBar(
                    labelColor: FlutterFlowTheme.of(context).primary,
                    unselectedLabelColor: FlutterFlowTheme.of(context).accent2,
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    unselectedLabelStyle: TextStyle(),
                    indicatorColor: FlutterFlowTheme.of(context).primary,
                    tabs: [
                      Tab(
                        text: 'Followers',
                      ),
                      Tab(
                        text: 'Following',
                      ),
                    ],
                    controller: _model.tabBarController,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _model.tabBarController,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Your page has ${valueOrDefault<String>(
                                getJsonField(
                                  widget.followersList,
                                  r'''$.total''',
                                ).toString(),
                                'no',
                              )} followers.',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          if (getJsonField(
                                widget.followersList,
                                r'''$.total''',
                              ) !=
                              random_data.randomInteger(0, 0))
                            Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.8,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final followers = getJsonField(
                                    widget.followersList,
                                    r'''$.followList''',
                                  ).toList();
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(followers.length,
                                          (followersIndex) {
                                        final followersItem =
                                            followers[followersIndex];
                                        return Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 12.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (getJsonField(
                                                      followersItem,
                                                      r'''$.userIcon''',
                                                    ) !=
                                                    null)
                                                  Container(
                                                    width: 60.0,
                                                    height: 60.0,
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
                                                    child: Container(
                                                      width: 60.0,
                                                      height: 60.0,
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
                                                              followersItem,
                                                              r'''$.userIcon''',
                                                            ).toString()),
                                                            r'''$.image''',
                                                          ).toString(),
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                if (getJsonField(
                                                      followersItem,
                                                      r'''$.userIcon''',
                                                    ) ==
                                                    null)
                                                  Container(
                                                    width: 60.0,
                                                    height: 60.0,
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
                                                            followersItem,
                                                            r'''$.companyName''',
                                                          ).toString()),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
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
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            followersItem,
                                                            r'''$.companyName''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            followersItem,
                                                            r'''$.industry''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'CompanyDetailsPage',
                                                      queryParameters: {
                                                        'userId':
                                                            serializeParam(
                                                          getJsonField(
                                                            followersItem,
                                                            r'''$.userId''',
                                                          ),
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Text(
                                                    'View Page',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                        ],
                      ),
                      FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter ??=
                                Completer<ApiCallResponse>()
                                  ..complete(SmeGroup.getFolloweesCall.call(
                                    pageNumber: 0,
                                    pageSize: 100,
                                    userId: 0,
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
                          final columnGetFolloweesResponse = snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'You are following ${getJsonField(
                                    columnGetFolloweesResponse.jsonBody,
                                    r'''$.total''',
                                  ).toString()} companies.',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final followees = SmeGroup.getFolloweesCall
                                            .followingList(
                                              columnGetFolloweesResponse
                                                  .jsonBody,
                                            )
                                            ?.map((e) => e)
                                            .toList()
                                            ?.toList() ??
                                        [];
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            followees.length, (followeesIndex) {
                                          final followeesItem =
                                              followees[followeesIndex];
                                          return Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 8.0, 12.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 60.0,
                                                    height: 60.0,
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
                                                            followeesItem,
                                                            r'''$.userIcon''',
                                                          ) !=
                                                          null,
                                                      child: Container(
                                                        width: 60.0,
                                                        height: 60.0,
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
                                                                followeesItem,
                                                                r'''$.userIcon''',
                                                              ).toString()),
                                                              r'''$.image''',
                                                            ).toString(),
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-linker-hh39tp/assets/6sjweisoxvxb/sme_blue_bold.png',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (getJsonField(
                                                        followeesItem,
                                                        r'''$.userIcon''',
                                                      ) ==
                                                      null)
                                                    Container(
                                                      width: 60.0,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFA6400),
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
                                                              followeesItem,
                                                              r'''$.companyName''',
                                                            ).toString()),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
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
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              followeesItem,
                                                              r'''$.companyName''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      2.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              followeesItem,
                                                              r'''$.industry''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.apiResultoyy =
                                                          await SmeGroup
                                                              .unFollowCall
                                                              .call(
                                                        followeeId:
                                                            getJsonField(
                                                          followeesItem,
                                                          r'''$.userId''',
                                                        ),
                                                        accessToken:
                                                            FFAppState()
                                                                .accessToken,
                                                      );
                                                      if ((_model.apiResultoyy
                                                              ?.succeeded ??
                                                          true)) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                              title: Text(
                                                                  'Success!'),
                                                              content: Text(
                                                                  'You are now unfollowing the company.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ));
                                                          },
                                                        );
                                                        setState(() => _model
                                                                .apiRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted();
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                              title:
                                                                  Text('Error'),
                                                              content: Text(
                                                                  'Something went wrong'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'TTry again'),
                                                                ),
                                                              ],
                                                            ));
                                                          },
                                                        );
                                                      }

                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Unfollow',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20.0,
                                                    child: VerticalDivider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'CompanyDetailsPage',
                                                        queryParameters: {
                                                          'userId':
                                                              serializeParam(
                                                            getJsonField(
                                                              followeesItem,
                                                              r'''$.userId''',
                                                            ),
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Text(
                                                      'View Page',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
        ],
      ),
    );
  }
}
