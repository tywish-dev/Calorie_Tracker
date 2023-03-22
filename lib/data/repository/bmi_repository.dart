import 'package:flutter/material.dart';

class BmiRepository {
  int setGenderSelected(int gender) {
    return gender;
  }

  int incrementWeight(int weight) {
    return ++weight;
  }

  int decrementWeight(int weight) {
    return --weight;
  }

  int incrementAge(int age) {
    return ++age;
  }

  int decrementAge(int age) {
    return --age;
  }

  int maleGender(int gender) {
    return 1;
  }

  int femaleGender(int gender) {
    return 0;
  }

  double setHeight(double height) {
    return height;
  }

  double calculateBmi(double height, int weight) {
    return ((weight / (height * height)) * 10000);
  }

  String bmiDegree(String degree, double bmiResult) {
    if (bmiResult <= 18.5) {
      degree = "Underweight";
      return degree;
    } else if (bmiResult <= 25) {
      degree = "Normal";
      return degree;
    } else if (bmiResult <= 30) {
      degree = "Overweight";
      return degree;
    } else if (bmiResult >= 30) {
      degree = "Obese";
      return degree;
    } else {
      return "";
    }
  }

  String bmiDesc(String desc, double bmiResult) {
    if (bmiResult <= 18.5) {
      desc =
          "You have a lower than normal body weight. You can eat a bit more.";
      return desc;
    } else if (bmiResult <= 25) {
      desc = "You have a normal body weight. Good job!";
      return desc;
    } else if (bmiResult <= 30) {
      desc = "You have a higher than normal body weight. Try to exercise more.";
      return desc;
    } else if (bmiResult >= 30) {
      desc = "You are obese. See a doctor or pharmacist for counselling.";
      return desc;
    } else {
      return "";
    }
  }

  Color bmiColor(double bmiResult) {
    if (bmiResult <= 18.5) {
      return Colors.yellow;
    } else if (bmiResult <= 25) {
      return Colors.green;
    } else if (bmiResult <= 30) {
      return Colors.orange;
    } else if (bmiResult >= 30) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }
}
