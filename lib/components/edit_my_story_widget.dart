import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_my_story_model.dart';
export 'edit_my_story_model.dart';

class EditMyStoryWidget extends StatefulWidget {
  const EditMyStoryWidget({
    Key? key,
    this.myStory,
  }) : super(key: key);

  final dynamic myStory;

  @override
  _EditMyStoryWidgetState createState() => _EditMyStoryWidgetState();
}

class _EditMyStoryWidgetState extends State<EditMyStoryWidget> {
  late EditMyStoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditMyStoryModel());

    _model.pastTitleController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
                widget.myStory,
                r'''$''',
              ) ==
              null
          ? 'N/A'
          : valueOrDefault<String>(
              getJsonField(
                widget.myStory,
                r'''$.pastTitle''',
              ).toString().toString(),
              'N/A',
            ),
      'N/A',
    ));
    _model.pastDescController ??= TextEditingController(
        text: getJsonField(
                  widget.myStory,
                  r'''$''',
                ) ==
                null
            ? 'N/A'
            : valueOrDefault<String>(
                getJsonField(
                  widget.myStory,
                  r'''$.past''',
                ).toString().toString(),
                'N/A',
              ));
    _model.nowTitleController ??= TextEditingController(
        text: getJsonField(
                  widget.myStory,
                  r'''$''',
                ) ==
                null
            ? 'N/A'
            : getJsonField(
                widget.myStory,
                r'''$.nowTitle''',
              ).toString().toString());
    _model.nowDescController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
                widget.myStory,
                r'''$''',
              ) ==
              null
          ? 'N/A'
          : valueOrDefault<String>(
              getJsonField(
                widget.myStory,
                r'''$.now''',
              ).toString().toString(),
              'N/A',
            ),
      'N/A',
    ));
    _model.futureTitleController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
                widget.myStory,
                r'''$''',
              ) ==
              null
          ? 'N/A'
          : valueOrDefault<String>(
              getJsonField(
                widget.myStory,
                r'''$.futureTitle''',
              ).toString().toString(),
              'N/A',
            ),
      'N/A',
    ));
    _model.futureDescController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
                widget.myStory,
                r'''$''',
              ) ==
              null
          ? 'N/A'
          : valueOrDefault<String>(
              getJsonField(
                widget.myStory,
                r'''$.future''',
              ).toString().toString(),
              'N/A',
            ),
      'N/A',
    ));
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
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 45.0, 16.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                        child: Text(
                          'Edit your story',
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SelectionArea(
                                  child: AutoSizeText(
                                'Sharing your story is a great way to let potential customers & Investor know about your business.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.pastTitleController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.pastTitleController',
                                  Duration(milliseconds: 100),
                                  () async {
                                    if ((FFAppState()
                                                .submittedEditYourStoryForm ==
                                            true) &&
                                        ((_model.pastTitleController.text !=
                                                    null &&
                                                _model.pastTitleController
                                                        .text !=
                                                    '') ||
                                            (_model.pastTitleController.text ==
                                                    null ||
                                                _model.pastTitleController
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
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Past title',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyLarge,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                textAlign: TextAlign.justify,
                                maxLines: null,
                                validator: _model.pastTitleControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.pastDescController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.pastDescController',
                                  Duration(milliseconds: 100),
                                  () async {
                                    if ((FFAppState()
                                                .submittedEditYourStoryForm ==
                                            true) &&
                                        ((_model.pastDescController.text !=
                                                    null &&
                                                _model.pastDescController
                                                        .text !=
                                                    '') ||
                                            (_model.pastDescController.text ==
                                                    null ||
                                                _model.pastDescController
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
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Past description',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyLarge,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
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
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                                validator: _model.pastDescControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.nowTitleController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.nowTitleController',
                                  Duration(milliseconds: 100),
                                  () async {
                                    if ((FFAppState()
                                                .submittedEditYourStoryForm ==
                                            true) &&
                                        ((_model.nowTitleController.text !=
                                                    null &&
                                                _model.nowTitleController
                                                        .text !=
                                                    '') ||
                                            (_model.nowTitleController.text ==
                                                    null ||
                                                _model.nowTitleController
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
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Now title',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyLarge,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                textAlign: TextAlign.justify,
                                maxLines: null,
                                validator: _model.nowTitleControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.nowDescController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.nowDescController',
                                  Duration(milliseconds: 100),
                                  () async {
                                    if ((FFAppState()
                                                .submittedEditYourStoryForm ==
                                            true) &&
                                        ((_model.nowDescController.text !=
                                                    null &&
                                                _model.nowDescController.text !=
                                                    '') ||
                                            (_model.nowDescController.text ==
                                                    null ||
                                                _model.nowDescController.text ==
                                                    ''))) {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                    }
                                  },
                                ),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Now description',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyLarge,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
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
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                                validator: _model.nowDescControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.futureTitleController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.futureTitleController',
                                  Duration(milliseconds: 100),
                                  () async {
                                    if ((FFAppState()
                                                .submittedEditYourStoryForm ==
                                            true) &&
                                        ((_model.futureTitleController.text !=
                                                    null &&
                                                _model.futureTitleController
                                                        .text !=
                                                    '') ||
                                            (_model.futureTitleController
                                                        .text ==
                                                    null ||
                                                _model.futureTitleController
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
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Future title',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyLarge,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                textAlign: TextAlign.justify,
                                maxLines: null,
                                validator: _model.futureTitleControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.futureDescController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.futureDescController',
                                  Duration(milliseconds: 100),
                                  () async {
                                    if ((FFAppState()
                                                .submittedEditYourStoryForm ==
                                            true) &&
                                        ((_model.futureDescController.text !=
                                                    null &&
                                                _model.futureDescController
                                                        .text !=
                                                    '') ||
                                            (_model.futureDescController.text ==
                                                    null ||
                                                _model.futureDescController
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
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Future Description',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyLarge,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
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
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                maxLines: 4,
                                validator: _model.futureDescControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          text: 'Cancel',
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            setState(() {
                                              FFAppState()
                                                      .submittedEditYourStoryForm =
                                                  true;
                                            });
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            _model.apiResult9kkCopy =
                                                await SmeGroup.addStoryCall
                                                    .call(
                                              future: _model
                                                  .futureDescController.text,
                                              futureTitle: _model
                                                  .futureTitleController.text,
                                              now:
                                                  _model.nowDescController.text,
                                              nowTitle: _model
                                                  .nowTitleController.text,
                                              past: _model
                                                  .pastDescController.text,
                                              pastTitle: _model
                                                  .pastTitleController.text,
                                              accessToken:
                                                  FFAppState().accessToken,
                                            );
                                            if ((_model.apiResult9kkCopy
                                                    ?.succeeded ??
                                                true)) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Success'),
                                                    content:
                                                        Text('Story updated.'),
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
                                              setState(() {
                                                FFAppState()
                                                        .submittedEditYourStoryForm =
                                                    false;
                                              });
                                              Navigator.pop(context);
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Error'),
                                                    content: Text(
                                                        'Image size must be below 1MB.'),
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
                                            }

                                            setState(() {});
                                          },
                                          text: 'Save',
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
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
            ),
          ],
        ),
      ),
    );
  }
}
