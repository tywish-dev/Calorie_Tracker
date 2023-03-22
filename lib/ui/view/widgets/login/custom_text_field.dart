// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode myfocusNode = FocusNode();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: TextField(
        focusNode: myfocusNode,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bgOrange),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bgOrange),
              borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(),
          labelText: label,
          labelStyle: TextStyle(color: bgOrange),
        ),
      ),
    );
  }
}
