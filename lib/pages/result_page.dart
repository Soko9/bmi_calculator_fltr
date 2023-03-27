import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums/bmi_result.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/ibm_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.bmi,
    required this.result,
    required this.interpretation,
  });

  final String bmi, interpretation;
  final BMIResult result;

  @override
  Widget build(BuildContext context) {
    Color resultColor;

    switch (result) {
      case BMIResult.normal:
        resultColor = Colors.green;
        break;
      case BMIResult.overWeight:
        resultColor = Colors.red;
        break;
      case BMIResult.underWeight:
        resultColor = Colors.amber;
        break;
      default:
        resultColor = Colors.white;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('YOUR RESULT'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 42.0,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: IBMCard(
                margin: 16.0,
                color: kSecondaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        result.toString().split('.').last.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: cardTextStyle.copyWith(
                          color: resultColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 34.0,
                        ),
                      ),
                      Text(
                        bmi,
                        textAlign: TextAlign.center,
                        style: cardLabelStyle.copyWith(fontSize: 100.0),
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: cardTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(
              onPress: () {
                Navigator.pop(context);
              },
              text: 'RE-CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
