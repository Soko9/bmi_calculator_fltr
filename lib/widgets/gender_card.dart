import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kIconSize,
          color: Colors.white,
        ),
        const SizedBox(
          height: kSizedBoxHeight,
        ),
        Text(
          text,
          style: cardTextStyle,
        )
      ],
    );
  }
}
