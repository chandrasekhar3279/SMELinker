import '/backend/api_requests/api_calls.dart';
import '/components/booking_empty_list_widget.dart';
import '/components/bookings_reply_widget.dart';
import '/components/tab_bar_label_shimmer_loader_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'bookings_model.dart';
export 'bookings_model.dart';

class BookingsWidget extends StatefulWidget {
  const BookingsWidget({
    Key? key,
    int? userId,
  })  : this.userId = userId ?? 0,
        super(key: key);

  final int userId;

  @override
  _BookingsWidgetState createState() => _BookingsWidgetState();
}

class _BookingsWidgetState extends State<BookingsWidget>
    with TickerProviderStateMixin {
  late BookingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingsModel());

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
        final bookingsGetProfileDetailsResponse = snapshot.data!;
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
                                  bookingsGetProfileDetailsResponse.jsonBody,
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
                                            bookingsGetProfileDetailsResponse
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
                            if (getJsonField(
                                  bookingsGetProfileDetailsResponse.jsonBody,
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
                                          bookingsGetProfileDetailsResponse
                                              .jsonBody,
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
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primary,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).accent2,
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        unselectedLabelStyle: TextStyle(),
                        tabs: [
                          FutureBuilder<ApiCallResponse>(
                            future: SmeGroup.getAllBookingsCall.call(
                              accessToken: FFAppState().accessToken,
                              myBookings: false,
                              pageNumber: 0,
                              pageSize: 9,
                              sortBy: 'dateBooked',
                              sortOrder: 'desc',
                              startDate: 'null',
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Container(
                                    width: 200.0,
                                    child: TabBarLabelShimmerLoaderWidget(),
                                  ),
                                );
                              }
                              final tabGetAllBookingsResponse = snapshot.data!;
                              return Tab(
                                text: 'Requests received (${getJsonField(
                                      (_model.bookingsFilteredAPIResponse
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.total''',
                                    ) != null ? getJsonField(
                                    (_model.bookingsFilteredAPIResponse
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.total''',
                                  ).toString() : getJsonField(
                                    tabGetAllBookingsResponse.jsonBody,
                                    r'''$.total''',
                                  ).toString()})',
                              );
                            },
                          ),
                          FutureBuilder<ApiCallResponse>(
                            future: SmeGroup.getAllBookingsCall.call(
                              accessToken: FFAppState().accessToken,
                              myBookings: true,
                              pageNumber: 0,
                              pageSize: 9,
                              sortBy: 'dateBooked',
                              sortOrder: 'desc',
                              startDate: 'null',
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Container(
                                    width: 200.0,
                                    child: TabBarLabelShimmerLoaderWidget(),
                                  ),
                                );
                              }
                              final tabGetAllBookingsResponse = snapshot.data!;
                              return Tab(
                                text: 'Requests I made (${getJsonField(
                                      (_model.mybookingsFilteredAPIResponse
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.total''',
                                    ) != null ? getJsonField(
                                    (_model.mybookingsFilteredAPIResponse
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.total''',
                                  ).toString() : getJsonField(
                                    tabGetAllBookingsResponse.jsonBody,
                                    r'''$.total''',
                                  ).toString()})',
                              );
                            },
                          ),
                        ],
                        controller: _model.tabBarController,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Text(
                                      'Companies who have requested to book your Products or Services',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController1 ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue1 ??= 'All',
                                            ),
                                            options: [
                                              'All',
                                              'Last 7 days',
                                              'Last month',
                                              'Last 3 months'
                                            ],
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.dropDownValue1 = val);
                                              _model.bookingsFilteredAPIResponse =
                                                  await SmeGroup
                                                      .getAllBookingsCall
                                                      .call(
                                                accessToken:
                                                    FFAppState().accessToken,
                                                pageNumber: 0,
                                                pageSize: 100,
                                                startDate:
                                                    functions.filterByDate(
                                                        _model.dropDownValue1),
                                                sortBy: 'dateBooked',
                                                sortOrder: 'desc',
                                                myBookings: false,
                                              );
                                              if ((_model
                                                      .bookingsFilteredAPIResponse
                                                      ?.succeeded ??
                                                  true)) {
                                                setState(() => _model
                                                    .listViewPagingController1
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForListView1();
                                              }

                                              setState(() {});
                                            },
                                            width: 180.0,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: 'Please select...',
                                            fillColor: Colors.white,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent2,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 12.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          PagedListView<ApiPagingParams,
                                              dynamic>(
                                            pagingController:
                                                _model.setListViewController1(
                                              (nextPageMarker) => SmeGroup
                                                  .getAllBookingsCall
                                                  .call(
                                                accessToken:
                                                    FFAppState().accessToken,
                                                myBookings: false,
                                                startDate:
                                                    functions.filterByDate(
                                                        _model.dropDownValue1),
                                                pageNumber: nextPageMarker
                                                    .nextPageNumber,
                                                pageSize: 9,
                                                sortBy: 'dateBooked',
                                                sortOrder: 'desc',
                                              ),
                                            ),
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            reverse: false,
                                            scrollDirection: Axis.vertical,
                                            builderDelegate:
                                                PagedChildBuilderDelegate<
                                                    dynamic>(
                                              // Customize what your widget looks like when it's loading the first page.
                                              firstPageProgressIndicatorBuilder:
                                                  (_) => Center(
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
                                              ),
                                              // Customize what your widget looks like when it's loading another page.
                                              newPageProgressIndicatorBuilder:
                                                  (_) => Center(
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
                                              ),
                                              noItemsFoundIndicatorBuilder:
                                                  (_) => Center(
                                                child: BookingEmptyListWidget(
                                                  emptyDescription:
                                                      'You’ll be notified when users book your services.',
                                                ),
                                              ),
                                              itemBuilder:
                                                  (context, _, bookingsIndex) {
                                                final bookingsItem = _model
                                                    .listViewPagingController1!
                                                    .itemList![bookingsIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  15.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          bookingsItem,
                                                                          r'''$.productOrServiceName''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: Row(
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
                                                                    if (getJsonField(
                                                                          bookingsItem,
                                                                          r'''$.bookedByLogo''',
                                                                        ) !=
                                                                        null)
                                                                      Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
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
                                                                                  valueOrDefault<int>(
                                                                                    getJsonField(
                                                                                      bookingsItem,
                                                                                      r'''$.bookedById''',
                                                                                    ),
                                                                                    0,
                                                                                  ),
                                                                                  ParamType.int,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                60.0,
                                                                            height:
                                                                                60.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                getJsonField(
                                                                                  functions.image(getJsonField(
                                                                                    bookingsItem,
                                                                                    r'''$.bookedByLogo''',
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
                                                                    if (getJsonField(
                                                                          bookingsItem,
                                                                          r'''$.bookedByLogo''',
                                                                        ) ==
                                                                        null)
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
                                                                          context
                                                                              .pushNamed(
                                                                            'CompanyDetailsPage',
                                                                            queryParameters:
                                                                                {
                                                                              'userId': serializeParam(
                                                                                valueOrDefault<int>(
                                                                                  getJsonField(
                                                                                    bookingsItem,
                                                                                    r'''$.bookedById''',
                                                                                  ),
                                                                                  0,
                                                                                ),
                                                                                ParamType.int,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFFA6400),
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                functions.profilePicName(getJsonField(
                                                                                  bookingsItem,
                                                                                  r'''$.bookedBy''',
                                                                                ).toString()),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            bookingsItem,
                                                                            r'''$.bookedBy''',
                                                                          ).toString(),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyLarge,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          if (getJsonField(
                                                                                bookingsItem,
                                                                                r'''$.bookingStatus''',
                                                                              ) !=
                                                                              FFAppState().bookingStatus)
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                functions.convertFirstLetterCapital(getJsonField(
                                                                                  bookingsItem,
                                                                                  r'''$.bookingStatus''',
                                                                                ).toString()),
                                                                                'no reply',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                  ),
                                                                            ),
                                                                          if (getJsonField(
                                                                                bookingsItem,
                                                                                r'''$.bookingStatus''',
                                                                              ) ==
                                                                              FFAppState().bookingStatus)
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Color(0xFF57636C),
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
                                                                                          child: BookingsReplyWidget(
                                                                                            bookedbyItemReply: bookingsItem,
                                                                                            myProfileDetails: getJsonField(
                                                                                              bookingsGetProfileDetailsResponse.jsonBody,
                                                                                              r'''$''',
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ));
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              text: 'Reply',
                                                                              icon: Icon(
                                                                                Icons.reply,
                                                                                size: 16.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: Colors.white,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 14.0,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              'Item Type',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    lineHeight: 0.8,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              bookingsItem,
                                                                              r'''$.bookingType''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              'Booked On',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    lineHeight: 0.8,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              bookingsItem,
                                                                              r'''$.dateBooked''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              'Status',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    lineHeight: 0.8,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (getJsonField(
                                                                                bookingsItem,
                                                                                r'''$.bookingStatus''',
                                                                              ) ==
                                                                              FFAppState().bookingStatus)
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.infoCircle,
                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                  size: 16.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      bookingsItem,
                                                                                      r'''$.bookingStatus''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          if (getJsonField(
                                                                                bookingsItem,
                                                                                r'''$.bookingStatus''',
                                                                              ) !=
                                                                              FFAppState().bookingStatus)
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.solidCheckCircle,
                                                                                  color: FlutterFlowTheme.of(context).success,
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    height:
                                                                        4.0))
                                                                .around(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
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
                                0.0, 10.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Requests you have made to other companies',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController2 ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue2 ??= 'All',
                                            ),
                                            options: [
                                              'All',
                                              'Last 7 days',
                                              'Last month',
                                              'Last 3 months'
                                            ],
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.dropDownValue2 = val);
                                              _model.mybookingsFilteredAPIResponse =
                                                  await SmeGroup
                                                      .getAllBookingsCall
                                                      .call(
                                                accessToken:
                                                    FFAppState().accessToken,
                                                pageNumber: 0,
                                                pageSize: 100,
                                                startDate:
                                                    functions.filterByDate(
                                                        _model.dropDownValue2),
                                                sortBy: 'dateBooked',
                                                sortOrder: 'desc',
                                                myBookings: true,
                                              );
                                              if ((_model
                                                      .mybookingsFilteredAPIResponse
                                                      ?.succeeded ??
                                                  true)) {
                                                setState(() => _model
                                                        .apiRequestCompleter2 =
                                                    null);
                                                await _model
                                                    .waitForApiRequestCompleted2();
                                              }

                                              setState(() {});
                                            },
                                            width: 180.0,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: 'Please select...',
                                            fillColor: Colors.white,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent2,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 12.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FutureBuilder<ApiCallResponse>(
                                            future: (_model
                                                        .apiRequestCompleter2 ??=
                                                    Completer<ApiCallResponse>()
                                                      ..complete(SmeGroup
                                                          .getAllBookingsCall
                                                          .call(
                                                        accessToken:
                                                            FFAppState()
                                                                .accessToken,
                                                        myBookings: true,
                                                        startDate: functions
                                                            .filterByDate(_model
                                                                .dropDownValue2),
                                                        pageNumber: 0,
                                                        pageSize: 100,
                                                        sortBy: 'dateBooked',
                                                        sortOrder: 'desc',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final listViewGetAllBookingsResponse =
                                                  snapshot.data!;
                                              return Builder(
                                                builder: (context) {
                                                  final bookings = SmeGroup
                                                          .getAllBookingsCall
                                                          .bookings(
                                                            listViewGetAllBookingsResponse
                                                                .jsonBody,
                                                          )
                                                          ?.map((e) => e)
                                                          .toList()
                                                          ?.toList() ??
                                                      [];
                                                  if (bookings.isEmpty) {
                                                    return BookingEmptyListWidget(
                                                      emptyDescription:
                                                          'Please book any service or products to display.',
                                                    );
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: bookings.length,
                                                    itemBuilder: (context,
                                                        bookingsIndex) {
                                                      final bookingsItem =
                                                          bookings[
                                                              bookingsIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        15.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            2.0),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        10.0,
                                                                        5.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                10.0,
                                                                                10.0,
                                                                                10.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                bookingsItem,
                                                                                r'''$.productOrServiceName''',
                                                                              ).toString(),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
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
                                                                          context
                                                                              .pushNamed(
                                                                            'CompanyDetailsPage',
                                                                            queryParameters:
                                                                                {
                                                                              'userId': serializeParam(
                                                                                getJsonField(
                                                                                  bookingsItem,
                                                                                  r'''$.providerId''',
                                                                                ),
                                                                                ParamType.int,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
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
                                                                                visible: getJsonField(
                                                                                      bookingsItem,
                                                                                      r'''$.providerLogo''',
                                                                                    ) !=
                                                                                    null,
                                                                                child: Container(
                                                                                  width: 60.0,
                                                                                  height: 60.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        functions.image(getJsonField(
                                                                                          bookingsItem,
                                                                                          r'''$.providerLogo''',
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
                                                                            if (getJsonField(
                                                                                  bookingsItem,
                                                                                  r'''$.providerLogo''',
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
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      functions.profilePicName(getJsonField(
                                                                                        bookingsItem,
                                                                                        r'''$.provider''',
                                                                                      ).toString()),
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    bookingsItem,
                                                                                    r'''$.provider''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
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
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Item Type',
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      lineHeight: 0.8,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    bookingsItem,
                                                                                    r'''$.bookingType''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Booked On',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      lineHeight: 0.8,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    bookingsItem,
                                                                                    r'''$.dateBooked''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                child: Text(
                                                                                  'Status',
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        lineHeight: 0.8,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              if (getJsonField(
                                                                                    bookingsItem,
                                                                                    r'''$.bookingStatus''',
                                                                                  ) ==
                                                                                  FFAppState().bookingStatus)
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.infoCircle,
                                                                                      color: FlutterFlowTheme.of(context).warning,
                                                                                      size: 16.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        getJsonField(
                                                                                          bookingsItem,
                                                                                          r'''$.bookingStatus''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              if (getJsonField(
                                                                                    bookingsItem,
                                                                                    r'''$.bookingStatus''',
                                                                                  ) !=
                                                                                  FFAppState().bookingStatus)
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.solidCheckCircle,
                                                                                      color: FlutterFlowTheme.of(context).success,
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
                                                                            ],
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
                                              );
                                            },
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
