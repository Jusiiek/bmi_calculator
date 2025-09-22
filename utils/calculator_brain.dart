import 'dart:math';
import 'package:bmi_calculator/pages/input_page.dart';


class CalculatorBrain {
  final int height;
  final int weight;
  final int age;
  final Gender gender;

  final double _bmi;

  CalculatorBrain({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age
  }) : _bmi = weight / pow(height/100, 2);

  String getBmiResult() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    }
    else if (_bmi > 18.5) {
      return "Normal";
    }
    else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    }
    else if (_bmi > 18.5) {
      return "You have normal body weight.";
    }
    else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}
