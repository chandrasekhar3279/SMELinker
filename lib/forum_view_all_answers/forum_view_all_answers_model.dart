import '/backend/api_requests/api_calls.dart';
import '/components/forum_answer_widget.dart';
import '/components/forum_answer_with_in_reply_widget.dart';
import '/components/more_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'forum_view_all_answers_widget.dart' show ForumViewAllAnswersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ForumViewAllAnswersModel
    extends FlutterFlowModel<ForumViewAllAnswersWidget> {
  ///  Local state fields for this page.

  bool showQuestionsAction = false;

  bool showAnswersAction = false;

  bool seeMore = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ForumAnswer component.
  late ForumAnswerModel forumAnswerModel;
  // Model for MoreDetails component.
  late MoreDetailsModel moreDetailsModel1;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // Stores action output result for [Backend Call - API (setForumHelpfulness)] action in IconThumbsUpOutline1 widget.
  ApiCallResponse? likeApiRes;
  // Stores action output result for [Backend Call - API (setForumHelpfulness)] action in IconThumbsUpFill2 widget.
  ApiCallResponse? likeAPiRes2;
  // Stores action output result for [Backend Call - API (setForumUnHelpfulness)] action in IconThumbsDownOutline1 widget.
  ApiCallResponse? disLikeApiRes;
  // Stores action output result for [Backend Call - API (setForumUnHelpfulness)] action in IconThumbsDownFill2 widget.
  ApiCallResponse? disLikeApiRes2;
  // Models for MoreDetails dynamic component.
  late FlutterFlowDynamicModels<MoreDetailsModel> moreDetailsModels2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    forumAnswerModel = createModel(context, () => ForumAnswerModel());
    moreDetailsModel1 = createModel(context, () => MoreDetailsModel());
    moreDetailsModels2 = FlutterFlowDynamicModels(() => MoreDetailsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    forumAnswerModel.dispose();
    moreDetailsModel1.dispose();
    listViewPagingController?.dispose();
    moreDetailsModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetAnswersPage);
  }

  void listViewGetAnswersPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetAnswersResponse) {
        final pageItems = (getJsonField(
                  listViewGetAnswersResponse.jsonBody,
                  r'''$.content''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetAnswersResponse,
                )
              : null,
        );
      });
}
