import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/input_page.dart';

void main() => runApp(const BMI());

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        fontFamily: 'sans-serif-condensed',
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
          titleTextStyle: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const InputPage(),
    );
  }
}
