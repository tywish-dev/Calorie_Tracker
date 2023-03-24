// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  Date({
    Key? key,
  }) : super(key: key);

  @override
  DateState createState() => DateState();
}

class DateState extends State<Date> {
  final DateTime _daysAgo = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day - 3);
  @override
  Widget build(BuildContext context) {
    return DatePicker(
      _daysAgo,
      initialSelectedDate: DateTime.now(),
      daysCount: 31,
      height: 80,
      dayTextStyle: const TextStyle(fontSize: 8),
      monthTextStyle: const TextStyle(fontSize: 10),
      selectedTextColor: bgOrange,
      selectionColor: bgGreen,
      onDateChange: (date) {},
    );
  }
}
