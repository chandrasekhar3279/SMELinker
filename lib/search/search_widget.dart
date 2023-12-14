import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
    this.orgeDetails,
  }) : super(key: key);

  final dynamic orgeDetails;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkAuth(context);
    });

    _model.searchBarController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();
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
        userId: 0,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
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
        final searchGetOrgDetailsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: TextFormField(
                            controller: _model.searchBarController,
                            focusNode: _model.searchBarFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.searchBarController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            onFieldSubmitted: (_) async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              setState(() {
                                _model.isLoading = true;
                              });
                              _model.apiResult26k =
                                  await SmeGroup.searchByCategoryCall.call(
                                term: _model.searchBarController.text,
                                accessToken: FFAppState().accessToken,
                              );
                              if ((_model.apiResult26k?.succeeded ?? true)) {
                                setState(() {
                                  _model.showCategories = true;
                                });
                                setState(() {
                                  _model.isLoading = false;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Something went wrong!',
                                      style: TextStyle(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }

                              setState(() {});
                            },
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Search',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              prefixIcon: Icon(
                                Icons.search,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 16.0,
                              ),
                              suffixIcon:
                                  _model.searchBarController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.searchBarController?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        )
                                      : null,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.searchBarControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 30.0,
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: _model.isLoading == true,
                    child: Lottie.asset(
                      'assets/lottie_animations/Loader_2_JSON_(1).json',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 30.0,
                      fit: BoxFit.fitWidth,
                      animate: true,
                    ),
                  ),
                ),
                if (_model.showCategories == true)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (functions
                                  .lengthOfMyArray(SmeGroup.searchByCategoryCall
                                      .companies(
                                        (_model.apiResult26k?.jsonBody ?? ''),
                                      )!
                                      .toList())
                                  .toString() !=
                              '0')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Enterprenurs (${functions.lengthOfMyArray(SmeGroup.searchByCategoryCall.companies(
                                            (_model.apiResult26k?.jsonBody ??
                                                ''),
                                          )!.toList()).toString()})',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    indent: 10.0,
                                    endIndent: 10.0,
                                    color: FlutterFlowTheme.of(context).accent3,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Builder(
                                      builder: (context) {
                                        final enterprenurs =
                                            SmeGroup.searchByCategoryCall
                                                    .companies(
                                                      (_model.apiResult26k
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                    ?.map((e) => e)
                                                    .toList()
                                                    ?.toList() ??
                                                [];
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children:
                                              List.generate(enterprenurs.length,
                                                  (enterprenursIndex) {
                                            final enterprenursItem =
                                                enterprenurs[enterprenursIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'CompanyDetailsPage',
                                                  queryParameters: {
                                                    'userId': serializeParam(
                                                      getJsonField(
                                                        enterprenursItem,
                                                        r'''$.userId''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 0.0, 10.0,
                                                          15.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 60.0,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width: 120.0,
                                                            height: 120.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              getJsonField(
                                                                functions.image(
                                                                    getJsonField(
                                                                  enterprenursItem,
                                                                  r'''$.logo''',
                                                                ).toString()),
                                                                r'''$.image''',
                                                              ),
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          getJsonField(
                                                            enterprenursItem,
                                                            r'''$.companyName''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 22.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            'CompanyDetailsPage',
                                                            queryParameters: {
                                                              'userId':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  enterprenursItem,
                                                                  r'''$.userId''',
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (functions
                                  .lengthOfMyArray(SmeGroup.searchByCategoryCall
                                      .products(
                                        (_model.apiResult26k?.jsonBody ?? ''),
                                      )!
                                      .toList())
                                  .toString() !=
                              '0')
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Products (${functions.lengthOfMyArray(SmeGroup.searchByCategoryCall.products(
                                          (_model.apiResult26k?.jsonBody ?? ''),
                                        )!.toList()).toString()})',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  indent: 10.0,
                                  endIndent: 10.0,
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final products =
                                          SmeGroup.searchByCategoryCall
                                                  .products(
                                                    (_model.apiResult26k
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.map((e) => e)
                                                  .toList()
                                                  ?.toList() ??
                                              [];
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: List.generate(products.length,
                                            (productsIndex) {
                                          final productsItem =
                                              products[productsIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'ProductDetail',
                                                queryParameters: {
                                                  'userId': serializeParam(
                                                    getJsonField(
                                                      productsItem,
                                                      r'''$.userId''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                  'productinfo': serializeParam(
                                                    productsItem,
                                                    ParamType.JSON,
                                                  ),
                                                  'orgDeatils': serializeParam(
                                                    getJsonField(
                                                      searchGetOrgDetailsResponse
                                                          .jsonBody,
                                                      r'''$''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width: 120.0,
                                                          height: 120.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            getJsonField(
                                                              functions.image(
                                                                  getJsonField(
                                                                productsItem,
                                                                r'''$.image''',
                                                              ).toString()),
                                                              r'''$.image''',
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        getJsonField(
                                                          productsItem,
                                                          r'''$.productName''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 22.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'ProductDetail',
                                                          queryParameters: {
                                                            'userId':
                                                                serializeParam(
                                                              getJsonField(
                                                                productsItem,
                                                                r'''$.userId''',
                                                              ),
                                                              ParamType.int,
                                                            ),
                                                            'productinfo':
                                                                serializeParam(
                                                              productsItem,
                                                              ParamType.JSON,
                                                            ),
                                                            'orgDeatils':
                                                                serializeParam(
                                                              getJsonField(
                                                                searchGetOrgDetailsResponse
                                                                    .jsonBody,
                                                                r'''$''',
                                                              ),
                                                              ParamType.JSON,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          if (functions
                                  .lengthOfMyArray(SmeGroup.searchByCategoryCall
                                      .services(
                                        (_model.apiResult26k?.jsonBody ?? ''),
                                      )!
                                      .toList())
                                  .toString() !=
                              '0')
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Services (${functions.lengthOfMyArray(SmeGroup.searchByCategoryCall.services(
                                          (_model.apiResult26k?.jsonBody ?? ''),
                                        )!.toList()).toString()})',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  indent: 10.0,
                                  endIndent: 10.0,
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final services =
                                          SmeGroup.searchByCategoryCall
                                                  .services(
                                                    (_model.apiResult26k
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.map((e) => e)
                                                  .toList()
                                                  ?.toList() ??
                                              [];
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: List.generate(services.length,
                                            (servicesIndex) {
                                          final servicesItem =
                                              services[servicesIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'ServiceDetail',
                                                queryParameters: {
                                                  'servicecardInfo':
                                                      serializeParam(
                                                    servicesItem,
                                                    ParamType.JSON,
                                                  ),
                                                  'userId': serializeParam(
                                                    getJsonField(
                                                      servicesItem,
                                                      r'''$.userId''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                  'orgDetail': serializeParam(
                                                    getJsonField(
                                                      searchGetOrgDetailsResponse
                                                          .jsonBody,
                                                      r'''$''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width: 120.0,
                                                          height: 120.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            getJsonField(
                                                              functions.image(
                                                                  getJsonField(
                                                                servicesItem,
                                                                r'''$.image''',
                                                              ).toString()),
                                                              r'''$.image''',
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        getJsonField(
                                                          servicesItem,
                                                          r'''$.serviceName''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 22.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'ServiceDetail',
                                                          queryParameters: {
                                                            'servicecardInfo':
                                                                serializeParam(
                                                              servicesItem,
                                                              ParamType.JSON,
                                                            ),
                                                            'userId':
                                                                serializeParam(
                                                              getJsonField(
                                                                servicesItem,
                                                                r'''$.userId''',
                                                              ),
                                                              ParamType.int,
                                                            ),
                                                            'orgDetail':
                                                                serializeParam(
                                                              getJsonField(
                                                                searchGetOrgDetailsResponse
                                                                    .jsonBody,
                                                                r'''$''',
                                                              ),
                                                              ParamType.JSON,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          if (functions
                                  .lengthOfMyArray(SmeGroup.searchByCategoryCall
                                      .feeds(
                                        (_model.apiResult26k?.jsonBody ?? ''),
                                      )!
                                      .toList())
                                  .toString() !=
                              '0')
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Newsfeed Posts (${functions.lengthOfMyArray(SmeGroup.searchByCategoryCall.feeds(
                                          (_model.apiResult26k?.jsonBody ?? ''),
                                        )!.toList()).toString()})',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  indent: 10.0,
                                  endIndent: 10.0,
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final newsfeedPosts =
                                          SmeGroup.searchByCategoryCall
                                                  .feeds(
                                                    (_model.apiResult26k
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.map((e) => e)
                                                  .toList()
                                                  ?.toList() ??
                                              [];
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children:
                                            List.generate(newsfeedPosts.length,
                                                (newsfeedPostsIndex) {
                                          final newsfeedPostsItem =
                                              newsfeedPosts[newsfeedPostsIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'FeedDetail',
                                                queryParameters: {
                                                  'feedDetail': serializeParam(
                                                    newsfeedPostsItem,
                                                    ParamType.JSON,
                                                  ),
                                                  'feedId': serializeParam(
                                                    0,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width: 120.0,
                                                          height: 120.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            getJsonField(
                                                              functions.image(
                                                                  getJsonField(
                                                                newsfeedPostsItem,
                                                                r'''$.companyLogo''',
                                                              ).toString()),
                                                              r'''$.image''',
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        getJsonField(
                                                          newsfeedPostsItem,
                                                          r'''$.title''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 22.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'FeedDetail',
                                                          queryParameters: {
                                                            'feedDetail':
                                                                serializeParam(
                                                              newsfeedPostsItem,
                                                              ParamType.JSON,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          if (functions
                                  .lengthOfMyArray(SmeGroup.searchByCategoryCall
                                      .growthcards(
                                        (_model.apiResult26k?.jsonBody ?? ''),
                                      )!
                                      .toList())
                                  .toString() !=
                              '0')
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Growth Cards (${functions.lengthOfMyArray(SmeGroup.searchByCategoryCall.growthcards(
                                          (_model.apiResult26k?.jsonBody ?? ''),
                                        )!.toList()).toString()})',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  indent: 10.0,
                                  endIndent: 10.0,
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final growthCards =
                                          SmeGroup.searchByCategoryCall
                                                  .growthcards(
                                                    (_model.apiResult26k
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.map((e) => e)
                                                  .toList()
                                                  ?.toList() ??
                                              [];
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children:
                                            List.generate(growthCards.length,
                                                (growthCardsIndex) {
                                          final growthCardsItem =
                                              growthCards[growthCardsIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'GrowthCardDetail',
                                                queryParameters: {
                                                  'growthCardInfo':
                                                      serializeParam(
                                                    growthCardsItem,
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width: 120.0,
                                                          height: 120.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            getJsonField(
                                                              functions.image(
                                                                  getJsonField(
                                                                growthCardsItem,
                                                                r'''$.growthPatnerLogo''',
                                                              ).toString()),
                                                              r'''$.image''',
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        getJsonField(
                                                          growthCardsItem,
                                                          r'''$.growthPatnerName''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 22.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'GrowthCardDetail',
                                                          queryParameters: {
                                                            'growthCardInfo':
                                                                serializeParam(
                                                              growthCardsItem,
                                                              ParamType.JSON,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          if (functions
                                  .lengthOfMyArray(SmeGroup.searchByCategoryCall
                                      .growthPartners(
                                        (_model.apiResult26k?.jsonBody ?? ''),
                                      )!
                                      .toList())
                                  .toString() !=
                              '0')
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Service Providers (${functions.lengthOfMyArray(SmeGroup.searchByCategoryCall.growthPartners(
                                          (_model.apiResult26k?.jsonBody ?? ''),
                                        )!.toList()).toString()})',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  indent: 10.0,
                                  endIndent: 10.0,
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final serviceProviders =
                                          SmeGroup.searchByCategoryCall
                                                  .growthPartners(
                                                    (_model.apiResult26k
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.map((e) => e)
                                                  .toList()
                                                  ?.toList() ??
                                              [];
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: List.generate(
                                            serviceProviders.length,
                                            (serviceProvidersIndex) {
                                          final serviceProvidersItem =
                                              serviceProviders[
                                                  serviceProvidersIndex];
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      width: 60.0,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: 120.0,
                                                        height: 120.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          getJsonField(
                                                            functions.image(
                                                                getJsonField(
                                                              serviceProvidersItem,
                                                              r'''$.logo''',
                                                            ).toString()),
                                                            r'''$.image''',
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(
                                                        serviceProvidersItem,
                                                        r'''$.companyName''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          if ((functions
                                      .lengthOfMyArray(
                                          SmeGroup.searchByCategoryCall
                                              .products(
                                                (_model.apiResult26k
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .toString() ==
                                  '0') &&
                              (functions
                                      .lengthOfMyArray(
                                          SmeGroup.searchByCategoryCall
                                              .companies(
                                                (_model.apiResult26k
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .toString() ==
                                  '0') &&
                              (functions
                                      .lengthOfMyArray(
                                          SmeGroup.searchByCategoryCall
                                              .services(
                                                (_model.apiResult26k
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .toString() ==
                                  '0') &&
                              (functions
                                      .lengthOfMyArray(
                                          SmeGroup.searchByCategoryCall
                                              .growthPartners(
                                                (_model.apiResult26k
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .toString() ==
                                  '0') &&
                              (functions
                                      .lengthOfMyArray(
                                          SmeGroup.searchByCategoryCall
                                              .feeds(
                                                (_model.apiResult26k
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .toString() ==
                                  '0') &&
                              (functions
                                      .lengthOfMyArray(
                                          SmeGroup.searchByCategoryCall
                                              .growthcards(
                                                (_model.apiResult26k
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .toString() ==
                                  '0'))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'No results found',
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
