import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tab_bar_label_shimmer_loader_model.dart';
export 'tab_bar_label_shimmer_loader_model.dart';

class TabBarLabelShimmerLoaderWidget extends StatefulWidget {
  const TabBarLabelShimmerLoaderWidget({Key? key}) : super(key: key);

  @override
  _TabBarLabelShimmerLoaderWidgetState createState() =>
      _TabBarLabelShimmerLoaderWidgetState();
}

class _TabBarLabelShimmerLoaderWidgetState
    extends State<TabBarLabelShimmerLoaderWidget> {
  late TabBarLabelShimmerLoaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabBarLabelShimmerLoaderModel());
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
      width: 110.0,
      height: 45.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 14.0,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
          ),
        ],
      ),
    );
  }
}
