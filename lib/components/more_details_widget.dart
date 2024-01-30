import '/components/delete_feed_comment_widget.dart';
import '/components/delete_forum_answer_widget.dart';
import '/components/delete_forum_question_widget.dart';
import '/components/delete_product_item_widget.dart';
import '/components/delete_service_item_widget.dart';
import '/components/edit_comment_widget.dart';
import '/components/edit_forum_answer_widget.dart';
import '/components/edit_forum_question_widget.dart';
import '/components/edit_product_widget.dart';
import '/components/edit_service_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'more_details_model.dart';
export 'more_details_model.dart';

class MoreDetailsWidget extends StatefulWidget {
  const MoreDetailsWidget({
    super.key,
    this.question,
    this.productItem,
    this.serviceItem,
    this.answerItem,
    this.feedCommentInfo,
    this.feedID,
    this.userId,
  });

  final dynamic question;
  final dynamic productItem;
  final dynamic serviceItem;
  final dynamic answerItem;
  final dynamic feedCommentInfo;
  final dynamic feedID;
  final int? userId;

  @override
  State<MoreDetailsWidget> createState() => _MoreDetailsWidgetState();
}

class _MoreDetailsWidgetState extends State<MoreDetailsWidget> {
  late MoreDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreDetailsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (getJsonField(
                        widget.question,
                        r'''$.questionId''',
                      ) ==
                      FFAppState().showMoreQstn) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              child: EditForumQuestionWidget(
                                questionItem: widget.question,
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  } else {
                    if (getJsonField(
                          widget.productItem,
                          r'''$.productId''',
                        ) ==
                        FFAppState().editProductItem) {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: EditProductWidget(
                                  productItem: widget.productItem,
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else {
                      if (getJsonField(
                            widget.serviceItem,
                            r'''$.id''',
                          ) ==
                          FFAppState().EditService) {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: EditServiceWidget(
                                    editServiceItem: widget.serviceItem,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      } else {
                        if (getJsonField(
                              widget.answerItem,
                              r'''$.answerId''',
                            ) ==
                            FFAppState().editAnswerId) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    child: EditForumAnswerWidget(
                                      answerItem: widget.answerItem,
                                      questionId: getJsonField(
                                        widget.question,
                                        r'''$.questionId''',
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        } else {
                          if (getJsonField(
                                widget.feedCommentInfo,
                                r'''$.id''',
                              ) ==
                              FFAppState().editCommentID) {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: EditCommentWidget(
                                        feedCommentInfo:
                                            widget.feedCommentInfo!,
                                        feedId: widget.feedID,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        }
                      }
                    }
                  }
                },
                text: 'Edit',
                options: FFButtonOptions(
                  width: 100.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                showLoadingIndicator: false,
              ),
            ),
            SizedBox(
              width: 100.0,
              child: Divider(
                height: 2.0,
                thickness: 0.0,
                color: Color(0xFFCBCBCB),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (getJsonField(
                        widget.question,
                        r'''$.questionId''',
                      ) ==
                      FFAppState().showMoreQstn) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Color(0x00FFFFFF),
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.3,
                              child: DeleteForumQuestionWidget(
                                deleteQuestionId: getJsonField(
                                  widget.question,
                                  r'''$.questionId''',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  } else {
                    if (getJsonField(
                          widget.productItem,
                          r'''$.productId''',
                        ) ==
                        FFAppState().editProductItem) {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Color(0x00FFFFFF),
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                child: DeleteProductItemWidget(
                                  deleteProductId: getJsonField(
                                    widget.productItem,
                                    r'''$.productId''',
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else {
                      if (getJsonField(
                            widget.serviceItem,
                            r'''$.id''',
                          ) ==
                          FFAppState().EditService) {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Color(0x00FFFFFF),
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  child: DeleteServiceItemWidget(
                                    deleteServiceId: getJsonField(
                                      widget.serviceItem,
                                      r'''$.id''',
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      } else {
                        if (getJsonField(
                              widget.answerItem,
                              r'''$.answerId''',
                            ) ==
                            FFAppState().editAnswerId) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Color(0x00FFFFFF),
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.3,
                                    child: DeleteForumAnswerWidget(
                                      deleteAnswerId: getJsonField(
                                        widget.answerItem,
                                        r'''$.answerId''',
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        } else {
                          if (getJsonField(
                                widget.feedCommentInfo,
                                r'''$.id''',
                              ) ==
                              FFAppState().editCommentID) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.3,
                                      child: DeleteFeedCommentWidget(
                                        deleteFeedCommentId:
                                            widget.feedCommentInfo,
                                        deleteFeedId: getJsonField(
                                          widget.feedID,
                                          r'''$.feedId''',
                                        ),
                                        userId: 0,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        }
                      }
                    }
                  }
                },
                text: 'Delete',
                options: FFButtonOptions(
                  width: 100.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).error,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                showLoadingIndicator: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
