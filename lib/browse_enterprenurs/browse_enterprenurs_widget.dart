import '/backend/api_requests/api_calls.dart';
import '/components/empty_browse_list_widget.dart';
import '/components/industries_selection_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'browse_enterprenurs_model.dart';
export 'browse_enterprenurs_model.dart';

class BrowseEnterprenursWidget extends StatefulWidget {
  const BrowseEnterprenursWidget({Key? key}) : super(key: key);

  @override
  _BrowseEnterprenursWidgetState createState() =>
      _BrowseEnterprenursWidgetState();
}

class _BrowseEnterprenursWidgetState extends State<BrowseEnterprenursWidget> {
  late BrowseEnterprenursModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrowseEnterprenursModel());
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
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 52.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 22.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Entrepreneurs',
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
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Entrepreneurs',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                          ToggleIcon(
                            onPressed: () async {
                              setState(() => FFAppState().dummyBoolean =
                                  !FFAppState().dummyBoolean);
                              _model.industriesAPIResponse =
                                  await SmeGroup.getIndustriesCall.call();
                              setState(() {
                                FFAppState().browseIndustries = (getJsonField(
                                  (_model.industriesAPIResponse?.jsonBody ??
                                      ''),
                                  r'''$..industryName''',
                                  true,
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()!
                                    .toList()
                                    .cast<String>();
                                FFAppState().browseCategories = '';
                              });
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
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        child: IndustriesSelectionWidget(
                                          industries: (_model
                                                  .industriesAPIResponse
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                      ),
                                    ),
                                  ));
                                },
                              ).then((value) => safeSetState(() {}));

                              setState(() {});
                            },
                            value: FFAppState().dummyBoolean,
                            onIcon: Icon(
                              Icons.filter_alt,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 25.0,
                            ),
                            offIcon: Icon(
                              Icons.filter_alt,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 25.0,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().browseCategories = '';
                                FFAppState().browseentrepenur = [];
                              });
                              setState(() =>
                                  _model.listViewPagingController?.refresh());
                              await _model.waitForOnePageForListView();
                            },
                            child: Icon(
                              Icons.filter_alt_off_sharp,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: PagedListView<ApiPagingParams, dynamic>(
                                  pagingController:
                                      _model.setListViewController(
                                    (nextPageMarker) =>
                                        SmeGroup.searchUsersCall.call(
                                      categories: valueOrDefault<String>(
                                        FFAppState().browseCategories,
                                        'All',
                                      ),
                                      pageNumber: nextPageMarker.nextPageNumber,
                                      pageSize: 9,
                                      accessToken: FFAppState().accessToken,
                                    ),
                                  ),
                                  padding: EdgeInsets.zero,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<dynamic>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitFadingCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitFadingCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                    noItemsFoundIndicatorBuilder: (_) =>
                                        EmptyBrowseListWidget(),
                                    itemBuilder: (context, _, searchedIndex) {
                                      final searchedItem = _model
                                          .listViewPagingController!
                                          .itemList![searchedIndex];
                                      return Padding(
                                        padding: EdgeInsets.all(4.0),
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
                                                    searchedItem,
                                                    r'''$.userId''',
                                                  ),
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 1.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              height: 180.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    width: 150.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        getJsonField(
                                                          functions.image(
                                                              getJsonField(
                                                            searchedItem,
                                                            r'''$.logo''',
                                                          ).toString()),
                                                          r'''$.image''',
                                                        ).toString(),
                                                        width: double.infinity,
                                                        height: 100.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  2.0,
                                                                  2.0,
                                                                  2.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  searchedItem,
                                                                  r'''$.companyName''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  searchedItem,
                                                                  r'''$.industry''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
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
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                          searchedItem,
                                                                          r'''$.about''',
                                                                        ) !=
                                                                        null
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        getJsonField(
                                                                          searchedItem,
                                                                          r'''$.about''',
                                                                        )?.toString(),
                                                                        'N/A',
                                                                      )
                                                                    : '',
                                                                maxLines: 3,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
