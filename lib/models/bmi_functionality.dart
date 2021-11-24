import 'dart:math';

class BMIFunctionality {
  final int height;
  final int weight;
  BMIFunctionality({required this.height, required this.weight});

  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(String _bmi) {
    double bmi = double.parse(_bmi);
    if (bmi > 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getFeedback(String _bmi) {
    double bmi = double.parse(_bmi);
    if (bmi > 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. Try to eat a bit more';
    }
  }
}
