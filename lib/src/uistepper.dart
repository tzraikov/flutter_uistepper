import 'package:flutter/material.dart';

/// Implementation of UIStepper control from Apple UI
class UIStepper extends StatefulWidget {
  UIStepper({ 
    Key? key, 
    required this.value,
    required this.onChanged,
    this.stepValue = 1,
    this.minimumValue = 1,
    this.maximumValue = 100,
    this.tintColor = Colors.black,
    this.backgroundColor = const Color(0xFFEEEEEF),
    this.lineColor = const Color(0xFFD6D6D9),
    this.cornerRadius = 8,
    this.shadowColor = Colors.grey,
    this.elevation = 0,
    this.wraps = false,
    this.showLabel = true,
    this.labelStyle = const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400)
    }): super(key: key);

  /// Specifies the current stepper value
  final double value;

  /// The step to increment with
  final double stepValue;

  /// The minimum value
  final double minimumValue;
  final double maximumValue;
  final Color tintColor;
  final Color backgroundColor;
  final Color lineColor;
  final double cornerRadius;
  final Color shadowColor;
  final double elevation;
  final bool wraps;
  final bool showLabel;
  final TextStyle labelStyle;
  final void Function(double)? onChanged;

  @override
  State<UIStepper> createState() => _UIStepperState();
}

class _UIStepperState extends State<UIStepper> {
  late var buttonStyle;
  late var disabledStyle;
  double value = 1;

  @override
  void initState() {
    value = widget.value;
    buttonStyle = TextButton.styleFrom(
      primary: widget.tintColor, 
      padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
      minimumSize: Size(42, 12),
      maximumSize: Size(42, 32)
    );
    disabledStyle = TextButton.styleFrom(
      primary: Color(0xFF777778), 
      padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
      minimumSize: Size(42, 12),
      maximumSize: Size(42, 32)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showLabel) {
      return Row(
        children: [
          Text('${value.round()}', style: widget.labelStyle),
          SizedBox(width: 16),
          buildStepper()
        ]
      );
    }
    return Center(child: buildStepper());
  }

  Widget buildStepper() {
    var isMin = value == widget.minimumValue;
    var isMax = value == widget.maximumValue;
    return Material(
      elevation: widget.elevation,
      shadowColor: widget.shadowColor,
      borderRadius: BorderRadius.circular(widget.cornerRadius),
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.cornerRadius),
        ),
        constraints: BoxConstraints(
          maxHeight: 32,
          maxWidth: 98
        ),
        child: Row(children: [
          TextButton(
            onPressed: onStepDown,
            child: const Icon(Icons.remove, size: 21),
            style: isMin ? disabledStyle : buttonStyle
          ),
          Container(
            color: widget.lineColor,
            width: 1,
            height: 18
          ),
          TextButton(
            onPressed: onStepUp,
            child: const Icon(Icons.add, size: 21),
            style: isMax ? disabledStyle : buttonStyle
          )
        ])
      ),
    );
  }

  onStepDown() {
    var newValue = value - widget.stepValue;
    if (widget.wraps && newValue < widget.minimumValue) { newValue = widget.minimumValue; }
    if (newValue != value && newValue >= widget.minimumValue) {
      setState(() => value = newValue); 
      if (widget.onChanged != null) {
        widget.onChanged!(value);
      }
    }
  }

  onStepUp() {
    var newValue = value + widget.stepValue;
    if (widget.wraps && newValue > widget.maximumValue) { newValue = widget.maximumValue; }
    if (newValue != value && newValue <= widget.maximumValue) {
      setState(() => value = newValue); 
      if (widget.onChanged != null) {
        widget.onChanged!(value);
      }
    }
  }
}