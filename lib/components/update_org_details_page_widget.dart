import '/backend/api_requests/api_calls.dart';
import '/components/change_interest_selection_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_org_details_page_model.dart';
export 'update_org_details_page_model.dart';

class UpdateOrgDetailsPageWidget extends StatefulWidget {
  const UpdateOrgDetailsPageWidget({
    Key? key,
    this.orgDetails,
  }) : super(key: key);

  final dynamic orgDetails;

  @override
  _UpdateOrgDetailsPageWidgetState createState() =>
      _UpdateOrgDetailsPageWidgetState();
}

class _UpdateOrgDetailsPageWidgetState
    extends State<UpdateOrgDetailsPageWidget> {
  late UpdateOrgDetailsPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateOrgDetailsPageModel());

    _model.companyNameController ??= TextEditingController(
        text: getJsonField(
      widget.orgDetails,
      r'''$.companyName''',
    ).toString().toString());
    _model.companyNameFocusNode ??= FocusNode();
    _model.brnNumberController ??= TextEditingController(
        text: getJsonField(
      widget.orgDetails,
      r'''$.brnNumber''',
    ).toString().toString());
    _model.brnNumberFocusNode ??= FocusNode();
    _model.tradeLicenseNumberController ??= TextEditingController(
        text: getJsonField(
      widget.orgDetails,
      r'''$.tradeLicense''',
    ).toString().toString());
    _model.tradeLicenseNumberFocusNode ??= FocusNode();
    _model.descriptionController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
                widget.orgDetails,
                r'''$.about''',
              ) ==
              null
          ? 'N/A'
          : getJsonField(
              widget.orgDetails,
              r'''$.about''',
            ).toString().toString(),
      'N/A',
    ));
    _model.descriptionFocusNode ??= FocusNode();
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
        color: Color(0x98101213),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 700.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 45.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 24.0, 0.0),
                          child: Text(
                            'Edit Company Profile',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextFormField(
                            controller: _model.companyNameController,
                            focusNode: _model.companyNameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.companyNameController',
                              Duration(milliseconds: 100),
                              () async {
                                if ((FFAppState()
                                            .submittedUpdateOrgDetailsForm ==
                                        true) &&
                                    ((_model.companyNameController.text !=
                                                null &&
                                            _model.companyNameController.text !=
                                                '') ||
                                        (_model.companyNameController.text ==
                                                null ||
                                            _model.companyNameController.text ==
                                                ''))) {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.industriesValue == null) {
                                    return;
                                  }
                                  if (_model.yearofLaunchValue == null) {
                                    return;
                                  }
                                }
                              },
                            ),
                            textCapitalization: TextCapitalization.sentences,
                            readOnly: getJsonField(
                                  widget.orgDetails,
                                  r'''$.verifiedCompany''',
                                ) ==
                                true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Company Name',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyLarge,
                              hintText: 'Your company name',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyLarge,
                            maxLines: null,
                            validator: _model.companyNameControllerValidator
                                .asValidator(context),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.brnNumberController,
                              focusNode: _model.brnNumberFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.brnNumberController',
                                Duration(milliseconds: 100),
                                () async {
                                  if ((FFAppState()
                                              .submittedUpdateOrgDetailsForm ==
                                          true) &&
                                      ((_model.brnNumberController.text !=
                                                  null &&
                                              _model.brnNumberController.text !=
                                                  '') ||
                                          (_model.brnNumberController.text ==
                                                  null ||
                                              _model.brnNumberController.text ==
                                                  ''))) {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.industriesValue == null) {
                                      return;
                                    }
                                    if (_model.yearofLaunchValue == null) {
                                      return;
                                    }
                                  }
                                },
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'BRN Number',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyLarge,
                                hintText: 'eg: C12345678',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 24.0, 0.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyLarge,
                              maxLines: null,
                              validator: _model.brnNumberControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.tradeLicenseNumberController,
                              focusNode: _model.tradeLicenseNumberFocusNode,
                              autofocus: true,
                              readOnly: getJsonField(
                                    widget.orgDetails,
                                    r'''$.verifiedCompany''',
                                  ) ==
                                  true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Trade License Number',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyLarge,
                                hintText: 'Enter Trade License Number',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondary,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 24.0, 0.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model
                                  .tradeLicenseNumberControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 7.0, 0.0, 0.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .countryOfRegionValueController ??=
                                            FormFieldController<String>(
                                          _model.countryOfRegionValue ??=
                                              getJsonField(
                                            widget.orgDetails,
                                            r'''$.companyRegion''',
                                          ).toString(),
                                        ),
                                        options: ['IND', 'ARE', 'RUS', 'USA'],
                                        onChanged: (val) => setState(() =>
                                            _model.countryOfRegionValue = val),
                                        width: double.infinity,
                                        height: 60.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: 'Country of Registration',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                        borderWidth: 1.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        disabled: getJsonField(
                                              widget.orgDetails,
                                              r'''$.verifiedCompany''',
                                            ) ==
                                            true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 7.0, 0.0, 0.0),
                                      child: Container(
                                        width: 134.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Country of Registration',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 7.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future:
                                            SmeGroup.getIndustriesCall.call(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
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
                                            );
                                          }
                                          final industriesGetIndustriesResponse =
                                              snapshot.data!;
                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .industriesValueController ??=
                                                FormFieldController<String>(
                                              _model.industriesValue ??=
                                                  getJsonField(
                                                widget.orgDetails,
                                                r'''$.industry''',
                                              ).toString(),
                                            ),
                                            options: (getJsonField(
                                              industriesGetIndustriesResponse
                                                  .jsonBody,
                                              r'''$..industryName''',
                                              true,
                                            ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList()!,
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.industriesValue = val);
                                              if ((FFAppState()
                                                          .submittedUpdateOrgDetailsForm ==
                                                      true) &&
                                                  ((_model.industriesValue !=
                                                              null &&
                                                          _model.industriesValue !=
                                                              '') ||
                                                      (_model.industriesValue ==
                                                              null ||
                                                          _model.industriesValue ==
                                                              ''))) {
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                if (_model.industriesValue ==
                                                    null) {
                                                  return;
                                                }
                                                if (_model.yearofLaunchValue ==
                                                    null) {
                                                  return;
                                                }
                                              }
                                            },
                                            width: double.infinity,
                                            height: 60.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: 'Please select Industry',
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent3,
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 12.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 7.0, 0.0, 0.0),
                                      child: Container(
                                        width: 55.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Industry',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 7.0, 0.0, 0.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .yearofLaunchValueController ??=
                                            FormFieldController<String>(
                                          _model.yearofLaunchValue ??=
                                              getJsonField(
                                            widget.orgDetails,
                                            r'''$.incorporationYear''',
                                          ).toString(),
                                        ),
                                        options: functions
                                            .incorporationYearList()
                                            .map((e) => getJsonField(
                                                  e,
                                                  r'''$..year''',
                                                ))
                                            .toList()
                                            .map((e) => e.toString())
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.yearofLaunchValue = val);
                                          if ((FFAppState()
                                                      .submittedUpdateOrgDetailsForm ==
                                                  true) &&
                                              ((_model.yearofLaunchValue !=
                                                          null &&
                                                      _model.yearofLaunchValue !=
                                                          '') ||
                                                  (_model.yearofLaunchValue ==
                                                          null ||
                                                      _model.yearofLaunchValue ==
                                                          ''))) {
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            if (_model.industriesValue ==
                                                null) {
                                              return;
                                            }
                                            if (_model.yearofLaunchValue ==
                                                null) {
                                              return;
                                            }
                                          }
                                        },
                                        width: double.infinity,
                                        height: 60.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: 'Please select launch year',
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondary,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                        borderWidth: 1.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 7.0, 0.0, 0.0),
                                      child: Container(
                                        width: 85.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Year of launch',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.descriptionController,
                              focusNode: _model.descriptionFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.descriptionController',
                                Duration(milliseconds: 100),
                                () async {
                                  if ((FFAppState()
                                              .submittedUpdateOrgDetailsForm ==
                                          true) &&
                                      ((_model.descriptionController.text !=
                                                  null &&
                                              _model.descriptionController
                                                      .text !=
                                                  '') ||
                                          (_model.descriptionController.text ==
                                                  null ||
                                              _model.descriptionController
                                                      .text ==
                                                  ''))) {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.industriesValue == null) {
                                      return;
                                    }
                                    if (_model.yearofLaunchValue == null) {
                                      return;
                                    }
                                  }
                                },
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'About',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyLarge,
                                hintText: 'Description about your company',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 24.0, 0.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyLarge,
                              maxLines: 5,
                              validator: _model.descriptionControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Builder(
                                        builder: (context) {
                                          final previouselySelectedIndustries =
                                              FFAppState()
                                                  .dummyIndisties
                                                  .map((e) => e)
                                                  .toList();
                                          return Wrap(
                                            spacing: 0.0,
                                            runSpacing: 0.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                previouselySelectedIndustries
                                                    .length,
                                                (previouselySelectedIndustriesIndex) {
                                              final previouselySelectedIndustriesItem =
                                                  previouselySelectedIndustries[
                                                      previouselySelectedIndustriesIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFC0D7FF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 8.0,
                                                                10.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            previouselySelectedIndustriesItem,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              FFAppState()
                                                                  .removeFromDummyIndisties(
                                                                      previouselySelectedIndustriesItem);
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons.close_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 20.0,
                                                          ),
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: FutureBuilder<ApiCallResponse>(
                                          future:
                                              SmeGroup.getIndustriesCall.call(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
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
                                              );
                                            }
                                            final interestGetIndustriesResponse =
                                                snapshot.data!;
                                            return FFButtonWidget(
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState().intesrestPopup =
                                                      true;
                                                });
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        child:
                                                            ChangeInterestSelectionWidget(
                                                          industries:
                                                              getJsonField(
                                                            interestGetIndustriesResponse
                                                                .jsonBody,
                                                            r'''$''',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              text: 'Change Your Interests',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 40.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: 'Cancel',
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        FFAppState()
                                                .submittedUpdateOrgDetailsForm =
                                            true;
                                      });
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.industriesValue == null) {
                                        return;
                                      }
                                      if (_model.yearofLaunchValue == null) {
                                        return;
                                      }
                                      _model.apiResult3zcCopy = await SmeGroup
                                          .updateOrgDetailsCall
                                          .call(
                                        dataJson: getJsonField(
                                          functions.updateOrgDetails(
                                              _model.companyNameController.text,
                                              _model.brnNumberController.text,
                                              _model.industriesValue!,
                                              _model.yearofLaunchValue!,
                                              _model.descriptionController.text,
                                              _model
                                                  .tradeLicenseNumberController
                                                  .text,
                                              _model.countryOfRegionValue!),
                                          r'''$''',
                                        ),
                                        accessToken: FFAppState().accessToken,
                                      );
                                      if ((_model.apiResult3zcCopy?.succeeded ??
                                          true)) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Org Details '),
                                              content:
                                                  Text('Updated Successfully'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        Navigator.pop(context);
                                        setState(() {
                                          FFAppState()
                                                  .submittedUpdateOrgDetailsForm =
                                              false;
                                        });
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Error'),
                                              content: Text(
                                                  'Something went wrong !'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Try again'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }

                                      setState(() {});
                                    },
                                    text: 'Update',
                                    options: FFButtonOptions(
                                      width: 130.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
