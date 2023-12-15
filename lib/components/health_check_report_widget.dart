import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'health_check_report_model.dart';
export 'health_check_report_model.dart';

class HealthCheckReportWidget extends StatefulWidget {
  const HealthCheckReportWidget({
    Key? key,
    this.healthcheckReport,
  }) : super(key: key);

  final dynamic healthcheckReport;

  @override
  _HealthCheckReportWidgetState createState() =>
      _HealthCheckReportWidgetState();
}

class _HealthCheckReportWidgetState extends State<HealthCheckReportWidget> {
  late HealthCheckReportModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthCheckReportModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 1.0,
        constraints: BoxConstraints(
          maxWidth: 700.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 5.0),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: FutureBuilder<ApiCallResponse>(
          future: SmeGroup.submitAnswersViewReportCall.call(
            healthCheckId: getJsonField(
              widget.healthcheckReport,
              r'''$.id''',
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
            final columnSubmitAnswersViewReportResponse = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 45.0, 16.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
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
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 24.0, 0.0),
                            child: Text(
                              'Business Resilience Health Check',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 24.0),
                                child: CircularPercentIndicator(
                                  percent: functions
                                      .convertProgressValue(getJsonField(
                                    widget.healthcheckReport,
                                    r'''$.score''',
                                  ))!,
                                  radius: 60.0,
                                  lineWidth: 12.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor: Color(0xFF069422),
                                  backgroundColor: Color(0xFFF1F4F8),
                                  center: Text(
                                    '${getJsonField(
                                      columnSubmitAnswersViewReportResponse
                                          .jsonBody,
                                      r'''$.score''',
                                    ).toString()}%',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF069422),
                                          fontSize: 36.0,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  getJsonField(
                                    columnSubmitAnswersViewReportResponse
                                        .jsonBody,
                                    r'''$.summary''',
                                  ).toString(),
                                  style:
                                      FlutterFlowTheme.of(context).labelLarge,
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final detailsList = getJsonField(
                                    columnSubmitAnswersViewReportResponse
                                        .jsonBody,
                                    r'''$.moreDetails''',
                                  ).toList();
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(detailsList.length,
                                        (detailsListIndex) {
                                      final detailsListItem =
                                          detailsList[detailsListIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          elevation: 2.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Container(
                                              width: double.infinity,
                                              color: Colors.white,
                                              child: ExpandableNotifier(
                                                child: ExpandablePanel(
                                                  header: Text(
                                                    getJsonField(
                                                      detailsListItem,
                                                      r'''$.section''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                  collapsed: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${getJsonField(
                                                          detailsListItem,
                                                          r'''$.sectionScore''',
                                                        ).toString()}%',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  expanded: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '${getJsonField(
                                                        detailsListItem,
                                                        r'''$.sectionScore''',
                                                      ).toString()}%',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0xFF069422),
                                                                fontSize: 18.0,
                                                              ),
                                                    ),
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: false,
                                                    tapBodyToCollapse: false,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
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
    );
  }
}
