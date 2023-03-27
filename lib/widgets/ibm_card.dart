import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IBMCard extends StatelessWidget {
  const IBMCard(
      {Key? key, required this.color, this.child, this.onPress, this.margin})
      : super(key: key);

  final Color color;
  final Widget? child;
  final GestureTapCallback? onPress;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(margin ?? kBoxMargin),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kBoxRadius),
        ),
        child: child,
      ),
    );
  }
}
