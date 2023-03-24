import 'package:flutter/material.dart';

class DropdownProvider with ChangeNotifier {
  var list = ['Breakfast', 'Lunch', 'Dinner'];
  String dropdownValue = "Breakfast";

  setValue(String i) {
    dropdownValue = i;
    notifyListeners();
  }
}
