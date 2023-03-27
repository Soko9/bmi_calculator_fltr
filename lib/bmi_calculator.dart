import 'dart:math';
import 'package:bmi_calculator/enums/bmi_result.dart';

class BMICalculator {
  final int height;
  final int weight;

  final double _bmi;

  BMICalculator({required this.height, required this.weight})
      : _bmi = weight / pow((height / 100), 2);

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  BMIResult getBMIResult() {
    if (_bmi <= 18.4) {
      return BMIResult.underWeight;
    } else if (_bmi >= 25) {
      return BMIResult.overWeight;
    } else {
      return BMIResult.normal;
    }
  }

  String getBMIInterpretation() {
    if (_bmi <= 18.4) {
      return 'You Have a Lower Than Normal Body Weight\n\nEat More Dude!';
    } else if (_bmi >= 25) {
      return 'You Have a Higher Than Normal Body Weight\n\nTry To Exercise More!';
    } else {
      return 'You Have a Normal Body Weight\n\nGood Job!';
    }
  }
}
