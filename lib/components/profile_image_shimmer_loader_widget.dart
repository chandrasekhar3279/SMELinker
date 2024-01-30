import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_image_shimmer_loader_model.dart';
export 'profile_image_shimmer_loader_model.dart';

class ProfileImageShimmerLoaderWidget extends StatefulWidget {
  const ProfileImageShimmerLoaderWidget({super.key});

  @override
  State<ProfileImageShimmerLoaderWidget> createState() =>
      _ProfileImageShimmerLoaderWidgetState();
}

class _ProfileImageShimmerLoaderWidgetState
    extends State<ProfileImageShimmerLoaderWidget> {
  late ProfileImageShimmerLoaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileImageShimmerLoaderModel());
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
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
