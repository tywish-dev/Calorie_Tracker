import 'package:flutter/material.dart';

import '../../data/repository/bmi_repository.dart';

class BmiProvider with ChangeNotifier {
  int _gender = 1;
  int _genderSelected = 0;
  double _height = 180;
  int _weight = 70;
  int _age = 20;
  double _bmiResult = 0;
  String _bmiDegree = "";
  String _bmiDesc = "";
  Color _color = Colors.green;

  int get getGender => _gender;
  int get getGenderSelected => _genderSelected;
  double get getHeight => _height;
  int get getWeight => _weight;
  int get getAge => _age;
  double get getBmiResult => _bmiResult;
  String get getBmiDegree => _bmiDegree;
  String get getBmiDesc => _bmiDesc;
  Color get getColor => _color;

  var bmiRepo = BmiRepository();

  void calculateBmi() {
    _bmiResult = bmiRepo.calculateBmi(_height, _weight);
    _bmiDegree = bmiRepo.bmiDegree(_bmiDegree, _bmiResult);
    _bmiDesc = bmiRepo.bmiDesc(_bmiDesc, _bmiResult);
    _color = bmiRepo.bmiColor(_bmiResult);
    notifyListeners();
  }

  void genderSelected() {
    _genderSelected = bmiRepo.setGenderSelected(_gender);
  }

  void incrementWeight() {
    _weight = bmiRepo.incrementWeight(_weight);
    notifyListeners();
  }

  void decrementWeight() {
    _weight = bmiRepo.decrementWeight(_weight);
    notifyListeners();
  }

  void incrementAge() {
    _age = bmiRepo.incrementAge(_age);
    notifyListeners();
  }

  void decrementAge() {
    _age = bmiRepo.decrementAge(_age);
    notifyListeners();
  }

  void maleGender() {
    _gender = bmiRepo.maleGender(_gender);
    notifyListeners();
  }

  void femaleGender() {
    _gender = bmiRepo.femaleGender(_gender);
    notifyListeners();
  }

  void setHeight(double val) {
    _height = bmiRepo.setHeight(val);
    notifyListeners();
  }

  void setWeight(int val) {
    _weight = bmiRepo.setWeight(val);
    notifyListeners();
  }
}
