import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'groups_selection_popup_model.dart';
export 'groups_selection_popup_model.dart';

class GroupsSelectionPopupWidget extends StatefulWidget {
  const GroupsSelectionPopupWidget({
    super.key,
    this.industries,
  });

  final dynamic industries;

  @override
  State<GroupsSelectionPopupWidget> createState() =>
      _GroupsSelectionPopupWidgetState();
}

class _GroupsSelectionPopupWidgetState
    extends State<GroupsSelectionPopupWidget> {
  late GroupsSelectionPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupsSelectionPopupModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: FutureBuilder<ApiCallResponse>(
        future: SmeGroup.getAllJoinedGroupsCall.call(
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
          final columnGetAllJoinedGroupsResponse = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.8,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 45.0, 12.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Select groups to visible',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 12.0, 0.0, 0.0),
                            child: Text(
                              '${FFAppState().groupsData.length.toString()} / 5',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final selectGroups =
                                  SmeGroup.getAllJoinedGroupsCall
                                          .requestedgroups(
                                            columnGetAllJoinedGroupsResponse
                                                .jsonBody,
                                          )
                                          ?.map((e) => e)
                                          .toList()
                                          ?.toList() ??
                                      [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: selectGroups.length,
                                itemBuilder: (context, selectGroupsIndex) {
                                  final selectGroupsItem =
                                      selectGroups[selectGroupsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 8.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Theme(
                                              data: ThemeData(
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              child: CheckboxListTile(
                                                value:
                                                    _model.checkboxListTileValueMap[
                                                            selectGroupsItem] ??=
                                                        FFAppState()
                                                            .groupsData
                                                            .contains(
                                                                getJsonField(
                                                              selectGroupsItem,
                                                              r'''$.id''',
                                                            )),
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkboxListTileValueMap[
                                                              selectGroupsItem] =
                                                          newValue!);
                                                  if (newValue!) {
                                                    setState(() {
                                                      FFAppState()
                                                          .addToGroupsData(
                                                              getJsonField(
                                                        selectGroupsItem,
                                                        r'''$.id''',
                                                      ));
                                                    });
                                                  } else {
                                                    setState(() {
                                                      FFAppState()
                                                          .removeFromGroupsData(
                                                              getJsonField(
                                                        selectGroupsItem,
                                                        r'''$.id''',
                                                      ));
                                                    });
                                                  }
                                                },
                                                title: Text(
                                                  getJsonField(
                                                    selectGroupsItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        lineHeight: 2.0,
                                                      ),
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor: Colors.white,
                                                dense: false,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0, 0.0, 8.0, 0.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          FFAppState().groupsAvailable = false;
                        });
                        setState(() {
                          FFAppState().selectGroupsPopup = false;
                        });
                        Navigator.pop(context);
                        setState(() {
                          FFAppState().groupsData = [];
                        });
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 40.0,
                        padding: EdgeInsets.all(0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: !((FFAppState().groupsData.length >= 1) &&
                              (FFAppState().groupsData.length <= 5))
                          ? null
                          : () async {
                              setState(() {
                                FFAppState().groupsAvailable = true;
                              });
                              setState(() {
                                FFAppState().selectGroupsPopup = true;
                              });
                              Navigator.pop(context);
                            },
                      text: 'Confirm',
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 40.0,
                        padding: EdgeInsets.all(0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        disabledColor: FlutterFlowTheme.of(context).accent3,
                        disabledTextColor:
                            FlutterFlowTheme.of(context).secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
