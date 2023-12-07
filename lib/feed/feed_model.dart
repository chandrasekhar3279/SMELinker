import '/backend/api_requests/api_calls.dart';
import '/components/feed_list_shimmer_loading_widget.dart';
import '/components/feed_page_shimmer_loading_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:async';
import 'feed_widget.dart' show FeedWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  Local state fields for this page.

  String pendingStatus = 'pending';

  String rejectedStatus = 'rejected';

  String approvedStatus = 'approved';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for ListViewAll widget.

  PagingController<ApiPagingParams, dynamic>? listViewAllPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewAllApiCall;

  // Stores action output result for [Backend Call - API (setHelpfulness)] action in IconThumbsUpOutline widget.
  ApiCallResponse? apiResultSetLike;
  // Stores action output result for [Backend Call - API (setHelpfulness)] action in IconThumbsUpFill widget.
  ApiCallResponse? apiResultRemoveLike;
  // Stores action output result for [Backend Call - API (setUnHelpfulness)] action in IconThumbsDownOutline widget.
  ApiCallResponse? apiResultSetUnlike;
  // Stores action output result for [Backend Call - API (setUnHelpfulness)] action in IconThumbsDownFill widget.
  ApiCallResponse? apiResultRemoveUnlike;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Stores action output result for [Backend Call - API ( getMessagingUsers)] action in IconButton widget.
  ApiCallResponse? usersListRes;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    listViewAllPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<ApiPagingParams, dynamic> setListViewAllController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewAllApiCall = apiCall;
    return listViewAllPagingController ??=
        _createListViewAllController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewAllController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewAllGetFeedPage);
  }

  void listViewAllGetFeedPage(ApiPagingParams nextPageMarker) =>
      listViewAllApiCall!(nextPageMarker).then((listViewAllGetFeedResponse) {
        final pageItems = (SmeGroup.getFeedCall
                    .feed(
                      listViewAllGetFeedResponse.jsonBody,
                    )!
                    .map((e) => e)
                    .toList() ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewAllPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewAllGetFeedResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListViewAll({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewAllPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
