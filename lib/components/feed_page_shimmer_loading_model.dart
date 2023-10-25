import '/components/feed_list_shimmer_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feed_page_shimmer_loading_widget.dart'
    show FeedPageShimmerLoadingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedPageShimmerLoadingModel
    extends FlutterFlowModel<FeedPageShimmerLoadingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for FeedListShimmerLoading component.
  late FeedListShimmerLoadingModel feedListShimmerLoadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    feedListShimmerLoadingModel =
        createModel(context, () => FeedListShimmerLoadingModel());
  }

  void dispose() {
    feedListShimmerLoadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
