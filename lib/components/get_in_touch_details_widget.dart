import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'get_in_touch_details_model.dart';
export 'get_in_touch_details_model.dart';

class GetInTouchDetailsWidget extends StatefulWidget {
  const GetInTouchDetailsWidget({
    Key? key,
    this.getinTouch,
  }) : super(key: key);

  final dynamic getinTouch;

  @override
  _GetInTouchDetailsWidgetState createState() =>
      _GetInTouchDetailsWidgetState();
}

class _GetInTouchDetailsWidgetState extends State<GetInTouchDetailsWidget> {
  late GetInTouchDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GetInTouchDetailsModel());

    _model.addressController ??= TextEditingController(
        text: (getJsonField(
                      widget.getinTouch,
                      r'''$.address''',
                    ) !=
                    null) ||
                (getJsonField(
                      widget.getinTouch,
                      r'''$.address''',
                    ) !=
                    '') ||
                (getJsonField(
                      widget.getinTouch,
                      r'''$.address''',
                    ) !=
                    'N/A')
            ? getJsonField(
                widget.getinTouch,
                r'''$.address''',
              ).toString().toString()
            : '');
    _model.addressFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController(
        text: (getJsonField(
                      widget.getinTouch,
                      r'''$.email''',
                    ) !=
                    null) ||
                (getJsonField(
                      widget.getinTouch,
                      r'''$.email''',
                    ) !=
                    '')
            ? getJsonField(
                widget.getinTouch,
                r'''$.email''',
              ).toString().toString()
            : '');
    _model.emailFocusNode ??= FocusNode();

    _model.linkedInController ??= TextEditingController(
        text: (getJsonField(
                      widget.getinTouch,
                      r'''$.linkedIn''',
                    ) !=
                    null) ||
                (getJsonField(
                      widget.getinTouch,
                      r'''$.linkedIn''',
                    ) !=
                    '')
            ? getJsonField(
                widget.getinTouch,
                r'''$.linkedIn''',
              ).toString().toString()
            : '');
    _model.linkedInFocusNode ??= FocusNode();

    _model.webSiteController ??= TextEditingController(
        text: (getJsonField(
                      widget.getinTouch,
                      r'''$.website''',
                    ) !=
                    null) ||
                (getJsonField(
                      widget.getinTouch,
                      r'''$.website''',
                    ) !=
                    '')
            ? getJsonField(
                widget.getinTouch,
                r'''$.website''',
              ).toString().toString()
            : '');
    _model.webSiteFocusNode ??= FocusNode();

    _model.phoneNumberController ??= TextEditingController(
        text: (getJsonField(
                      widget.getinTouch,
                      r'''$.contactNo''',
                    ) !=
                    null) ||
                (getJsonField(
                      widget.getinTouch,
                      r'''$.contactNo''',
                    ) !=
                    '')
            ? getJsonField(
                widget.getinTouch,
                r'''$.contactNo''',
              ).toString().toString()
            : '');
    _model.phoneNumberFocusNode ??= FocusNode();
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
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 45.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                        child: Text(
                          'Contact Details',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: TextFormField(
                            controller: _model.addressController,
                            focusNode: _model.addressFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.addressController',
                              Duration(milliseconds: 100),
                              () async {
                                if ((FFAppState().submittedContactDetailsForm ==
                                        true) &&
                                    ((_model.addressController.text != null &&
                                            _model.addressController.text !=
                                                '') ||
                                        (_model.addressController.text ==
                                                null ||
                                            _model.addressController.text ==
                                                ''))) {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                }
                              },
                            ),
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Address',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyLarge,
                              hintText: 'Enter Your Address',
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
                            maxLines: 6,
                            validator: _model.addressControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.emailController,
                            focusNode: _model.emailFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.emailController',
                              Duration(milliseconds: 100),
                              () async {
                                if ((FFAppState().submittedContactDetailsForm ==
                                        true) &&
                                    ((_model.emailController.text != null &&
                                            _model.emailController.text !=
                                                '') ||
                                        (_model.emailController.text == null ||
                                            _model.emailController.text ==
                                                ''))) {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                }
                              },
                            ),
                            textCapitalization: TextCapitalization.none,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyLarge,
                              hintText: 'enter your email',
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
                            keyboardType: TextInputType.emailAddress,
                            validator: _model.emailControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.linkedInController,
                            focusNode: _model.linkedInFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.linkedInController',
                              Duration(milliseconds: 100),
                              () async {
                                if ((FFAppState().submittedContactDetailsForm ==
                                        true) &&
                                    ((_model.linkedInController.text != null &&
                                            _model.linkedInController.text !=
                                                '') ||
                                        (_model.linkedInController.text ==
                                                null ||
                                            _model.linkedInController.text ==
                                                ''))) {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                }
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'LinkedIn Company Page URL',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyLarge,
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
                            keyboardType: TextInputType.url,
                            validator: _model.linkedInControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.webSiteController,
                            focusNode: _model.webSiteFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.webSiteController',
                              Duration(milliseconds: 100),
                              () async {
                                if ((FFAppState().submittedContactDetailsForm ==
                                        true) &&
                                    ((_model.webSiteController.text != null &&
                                            _model.webSiteController.text !=
                                                '') ||
                                        (_model.webSiteController.text ==
                                                null ||
                                            _model.webSiteController.text ==
                                                ''))) {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                }
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Enter your website',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyLarge,
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
                            keyboardType: TextInputType.url,
                            validator: _model.webSiteControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.phoneNumberController,
                              focusNode: _model.phoneNumberFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.phoneNumberController',
                                Duration(milliseconds: 100),
                                () async {
                                  if ((FFAppState()
                                              .submittedContactDetailsForm ==
                                          true) &&
                                      ((_model.phoneNumberController.text !=
                                                  null &&
                                              _model.phoneNumberController
                                                      .text !=
                                                  '') ||
                                          (_model.phoneNumberController.text ==
                                                  null ||
                                              _model.phoneNumberController
                                                      .text ==
                                                  ''))) {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                  }
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Enter your phone number',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyLarge,
                                hintText: 'Contact Number Ex: +2711-123-4567',
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
                              keyboardType: TextInputType.phone,
                              validator: _model.phoneNumberControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          FFAppState()
                                                  .submittedContactDetailsForm =
                                              true;
                                        });
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        _model.apiResultkcpCopy = await SmeGroup
                                            .editContactDetailCall
                                            .call(
                                          dataJson: functions.getInTouch(
                                              _model.addressController.text,
                                              _model.emailController.text,
                                              _model.webSiteController.text,
                                              _model.linkedInController.text,
                                              _model
                                                  .phoneNumberController.text),
                                          accessToken: FFAppState().accessToken,
                                        );
                                        if ((_model
                                                .apiResultkcpCopy?.succeeded ??
                                            true)) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                  child: AlertDialog(
                                                title: Text('Success'),
                                                content: Text(
                                                    'Updated your contact details successfully'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ));
                                            },
                                          );
                                          setState(() {
                                            FFAppState()
                                                    .submittedContactDetailsForm =
                                                false;
                                          });
                                          Navigator.pop(context);
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                  child: AlertDialog(
                                                title: Text('Error'),
                                                content: Text(
                                                    'Something went wrong'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
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
                                      text: 'Save',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
