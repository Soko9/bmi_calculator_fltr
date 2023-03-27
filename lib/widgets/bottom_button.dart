import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

const bottomContainerHeight = 66.0;
const boxMargin = 10.0;

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  final GestureTapCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: bottomContainerHeight,
        margin: const EdgeInsets.only(top: boxMargin),
        color: kAccentColor,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
