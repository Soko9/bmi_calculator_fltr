import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class WageStepper extends StatelessWidget {
  const WageStepper({
    super.key,
    required this.incrementIcon,
    required this.onIncrement,
    required this.decrementIcon,
    required this.onDecrement,
  });

  final IconData incrementIcon;
  final VoidCallback onIncrement;
  final IconData decrementIcon;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: onIncrement,
          constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
          elevation: 4.0,
          fillColor: kGrayColor,
          shape: const CircleBorder(),
          child: Icon(
            incrementIcon,
            size: 45.0,
            color: Colors.white,
          ),
        ),
        RawMaterialButton(
          onPressed: onDecrement,
          constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
          elevation: 4.0,
          fillColor: kGrayColor,
          shape: const CircleBorder(),
          child: Icon(
            decrementIcon,
            size: 45.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
