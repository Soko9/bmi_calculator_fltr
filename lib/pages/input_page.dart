import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/ibm_card.dart';
import 'package:bmi_calculator/widgets/gender_card.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/wage_stepper.dart';
import 'package:bmi_calculator/enums/gender.dart';
import 'package:bmi_calculator/bmi_calculator.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int selectedHeight = 170;
  int selectedWeight = 70;
  int selectedAge = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI INPUTS'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: IBMCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kAccentColor
                          : kSecondaryColor,
                      child: const GenderCard(icon: Icons.male, text: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: IBMCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kAccentColor
                          : kSecondaryColor,
                      child: const GenderCard(
                        icon: Icons.female,
                        text: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: IBMCard(
                color: kSecondaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: cardTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          selectedHeight.toString(),
                          style: cardLabelStyle,
                        ),
                        const SizedBox(
                          width: kSizedBoxHeight - 10,
                        ),
                        const Text(
                          'cm',
                          style: cardTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        trackHeight: 1.0,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kTextColor,
                        thumbColor: kAccentColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0),
                        overlayColor: kThumbColor,
                      ),
                      child: Slider(
                        value: selectedHeight.toDouble(),
                        min: 100,
                        max: 220,
                        divisions: 120,
                        onChanged: (value) {
                          setState(() {
                            selectedHeight = value.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: IBMCard(
                      color: kSecondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: cardTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                selectedWeight.toString(),
                                style: cardLabelStyle,
                              ),
                              const SizedBox(
                                width: kSizedBoxHeight - 10,
                              ),
                              const Text(
                                'kg',
                                style: cardTextStyle,
                              ),
                            ],
                          ),
                          WageStepper(
                            incrementIcon: Icons.add,
                            onIncrement: () {
                              setState(() {
                                if (selectedWeight <= 149) {
                                  selectedWeight++;
                                }
                              });
                            },
                            decrementIcon: Icons.remove,
                            onDecrement: () {
                              setState(() {
                                if (selectedWeight >= 36) {
                                  selectedWeight--;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: IBMCard(
                      color: kSecondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'AGE',
                            style: cardTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                selectedAge.toString(),
                                style: cardLabelStyle,
                              ),
                              const SizedBox(
                                width: kSizedBoxHeight - 10,
                              ),
                              const Text(
                                'yo',
                                style: cardTextStyle,
                              ),
                            ],
                          ),
                          WageStepper(
                            incrementIcon: Icons.add,
                            onIncrement: () {
                              setState(() {
                                if (selectedAge <= 99) {
                                  selectedAge++;
                                }
                              });
                            },
                            decrementIcon: Icons.remove,
                            onDecrement: () {
                              setState(() {
                                if (selectedAge >= 2) {
                                  selectedAge--;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onPress: () {
                BMICalculator bmi = BMICalculator(
                    height: selectedHeight, weight: selectedWeight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: bmi.getBMI(),
                      result: bmi.getBMIResult(),
                      interpretation: bmi.getBMIInterpretation(),
                    ),
                  ),
                );
              },
              text: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
