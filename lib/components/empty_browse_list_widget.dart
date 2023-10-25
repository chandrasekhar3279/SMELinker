import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_browse_list_model.dart';
export 'empty_browse_list_model.dart';

class EmptyBrowseListWidget extends StatefulWidget {
  const EmptyBrowseListWidget({Key? key}) : super(key: key);

  @override
  _EmptyBrowseListWidgetState createState() => _EmptyBrowseListWidgetState();
}

class _EmptyBrowseListWidgetState extends State<EmptyBrowseListWidget> {
  late EmptyBrowseListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyBrowseListModel());
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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Results',
            style: FlutterFlowTheme.of(context).labelLarge,
          ),
        ],
      ),
    );
  }
}
