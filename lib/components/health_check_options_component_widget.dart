import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'health_check_options_component_model.dart';
export 'health_check_options_component_model.dart';

class HealthCheckOptionsComponentWidget extends StatefulWidget {
  const HealthCheckOptionsComponentWidget({
    super.key,
    required this.options,
    required this.healthCheckId,
    required this.topic,
    required this.questionId,
    required this.healthCheckContentParameter,
    required this.healthCheckAnswersParameter,
  });

  final List<dynamic>? options;
  final int? healthCheckId;
  final String? topic;
  final int? questionId;
  final dynamic healthCheckContentParameter;
  final dynamic healthCheckAnswersParameter;

  @override
  State<HealthCheckOptionsComponentWidget> createState() =>
      _HealthCheckOptionsComponentWidgetState();
}

class _HealthCheckOptionsComponentWidgetState
    extends State<HealthCheckOptionsComponentWidget> {
  late HealthCheckOptionsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthCheckOptionsComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.allOptions = widget.options!.toList().cast<dynamic>();
      });
    });
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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final answerOptions = _model.allOptions.map((e) => e).toList();
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(answerOptions.length, (answerOptionsIndex) {
              final answerOptionsItem = answerOptions[answerOptionsIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.userSelectedOptionId = getJsonField(
                      answerOptionsItem,
                      r'''$.id''',
                    );
                    _model.allOptions = functions
                        .selectHealthCheckAnswer(_model.allOptions.toList(),
                            _model.userSelectedOptionId!)
                        .toList()
                        .cast<dynamic>();
                    _model.saveAnswerAPIResponse =
                        await SmeGroup.saveUserResponsesCall.call(
                      accessToken: FFAppState().accessToken,
                      healthCheckAnswersJson: getJsonField(
                        functions.saveUserResponsePayload(
                            widget.healthCheckContentParameter!,
                            widget.healthCheckAnswersParameter!,
                            widget.topic!,
                            widget.questionId!,
                            _model.userSelectedOptionId!),
                        r'''$''',
                      ),
                    );
                    if ((_model.saveAnswerAPIResponse?.succeeded ?? true)) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Response saved',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 3000),
                          backgroundColor: FlutterFlowTheme.of(context).success,
                        ),
                      );
                      setState(() {});
                      _model.updatePage(() {});
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Error saving response',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                          ),
                          duration: Duration(milliseconds: 3000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          if (getJsonField(
                                answerOptionsItem,
                                r'''$.selected''',
                              ) ==
                              true)
                            Icon(
                              Icons.radio_button_checked_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 22.0,
                            ),
                          if (getJsonField(
                                answerOptionsItem,
                                r'''$.selected''',
                              ) ==
                              false)
                            Icon(
                              Icons.radio_button_off,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 22.0,
                            ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 1.0, 0.0, 0.0),
                          child: Text(
                            getJsonField(
                              answerOptionsItem,
                              r'''$.answer''',
                            ).toString(),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                          ),
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
    );
  }
}
