// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({
    Key? key,
    this.width,
    this.height,
    required this.activeColor,
    required this.inactiveColor,
    required this.min,
    required this.max,
    required this.divisions,
    required this.rangeIsFor,
    required this.currentStart,
    required this.currentEnd,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color activeColor;
  final Color inactiveColor;
  final double min;
  final double max;
  final int divisions;
  final String rangeIsFor;
  final double currentStart;
  final double currentEnd;

  @override
  _CustomRangeSliderState createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  RangeValues _currentRangeValues = RangeValues(0, 0);
  @override
  void initState() {
    super.initState();
    _currentRangeValues = RangeValues(widget.currentStart, widget.currentEnd);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: RangeSlider(
          min: widget.min, // minimum value of the RangeSlider
          max: widget.max, // maximum value of the RangeSlider
          divisions: widget
              .divisions, // number of divisions of RangeSlider : max/sizeOfEachStep
          values: _currentRangeValues,
          activeColor: widget.activeColor, // color of the selected range
          inactiveColor: widget.inactiveColor, // color of the unselected range
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
              if (widget.rangeIsFor == 'time') {
                FFAppState().minServiceTimeRange = values.start;
                FFAppState().maxServiceTimeRange = values.end;
              }
              if (widget.rangeIsFor == 'cost') {
                FFAppState().minServiceCostRange = values.start;
                FFAppState().maxServiceCostRange = values.end;
              }
            });
          },
        ));
  }
}
