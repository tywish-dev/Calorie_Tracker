import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int page = 0;

  setPage(int i) {
    page = i;
    notifyListeners();
  }
}
