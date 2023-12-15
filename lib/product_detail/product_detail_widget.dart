import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'product_detail_model.dart';
export 'product_detail_model.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({
    Key? key,
    this.productinfo,
    this.userId,
    this.orgDeatils,
  }) : super(key: key);

  final dynamic productinfo;
  final int? userId;
  final dynamic orgDeatils;

  @override
  _ProductDetailWidgetState createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  late ProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailModel());
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 48.0,
          icon: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 22.0,
          ),
          onPressed: () async {
            context.safePop();
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent1,
                      width: 1.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      getJsonField(
                        functions.image(getJsonField(
                                  widget.productinfo,
                                  r'''$.featuredImage''',
                                ) !=
                                null
                            ? getJsonField(
                                widget.productinfo,
                                r'''$.featuredImage''',
                              ).toString()
                            : getJsonField(
                                widget.productinfo,
                                r'''$.image''',
                              ).toString()),
                        r'''$.image''',
                      ).toString(),
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            if ((getJsonField(
                      widget.productinfo,
                      r'''$.companyName''',
                    ) !=
                    null) ||
                (getJsonField(
                      widget.productinfo,
                      r'''$.companyLogo''',
                    ) !=
                    null))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
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
                              widget.productinfo,
                              r'''$.companyLogo''',
                            ).toString()),
                            r'''$.image''',
                          ).toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                        child: Text(
                          getJsonField(
                            widget.productinfo,
                            r'''$.companyName''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      getJsonField(
                        widget.productinfo,
                        r'''$.productName''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (getJsonField(
                        widget.productinfo,
                        r'''$.category''',
                      ) !=
                      null)
                    Text(
                      valueOrDefault<String>(
                        getJsonField(
                          widget.productinfo,
                          r'''$.category''',
                        ).toString(),
                        'N/A',
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall,
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.fileInvoiceDollar,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20.0,
                      ),
                      Text(
                        '${getJsonField(
                          widget.productinfo,
                          r'''$.price''',
                        ).toString()} AED',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      getJsonField(
                                widget.productinfo,
                                r'''$.description''',
                              ) !=
                              null
                          ? getJsonField(
                              widget.productinfo,
                              r'''$.description''',
                            ).toString()
                          : getJsonField(
                              widget.productinfo,
                              r'''$.productDescription''',
                            ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            if (!((widget.userId == 0) ||
                (getJsonField(
                      widget.productinfo,
                      r'''$.isOwnProduct''',
                    ) ==
                    true)))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((getJsonField(
                                      widget.productinfo,
                                      r'''$.booked''',
                                    ) ==
                                    false) ||
                                (getJsonField(
                                      widget.productinfo,
                                      r'''$.bookingStatus''',
                                    ) ==
                                    random_data.randomInteger(0, 0)))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.booked = false;
                                  });
                                  _model.bookedProduct =
                                      await SmeGroup.bookProductCall.call(
                                    accessToken: FFAppState().accessToken,
                                    productId: getJsonField(
                                      widget.productinfo,
                                      r'''$.productId''',
                                    ),
                                  );
                                  if ((_model.bookedProduct?.succeeded ??
                                      true)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                            child: AlertDialog(
                                          title: Text('Success'),
                                          content:
                                              Text('Your request hasbeen sent'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ));
                                      },
                                    );
                                    setState(() {
                                      _model.booked = true;
                                    });
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                            child: AlertDialog(
                                          title: Text('Error'),
                                          content:
                                              Text('Something went wrong!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 6.0, 12.0, 6.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.message,
                                          color: Colors.white,
                                          size: 14.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'I\'m interested',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
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
                            if ((getJsonField(
                                      widget.productinfo,
                                      r'''$.booked''',
                                    ) ==
                                    true) ||
                                (getJsonField(
                                      widget.productinfo,
                                      r'''$.bookingStatus''',
                                    ) ==
                                    random_data.randomInteger(1, 1)))
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Booked',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
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
              ),
          ],
        ),
      ),
    );
  }
}
