// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool bgColor;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          height: 50,
          width: (MediaQuery.of(context).size.width * .8) - 60,
          decoration: BoxDecoration(
              border: Border.all(color: bgColor == false ? bgOrange : bgGreen),
              borderRadius: BorderRadius.circular(20)),
          child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(color: bgColor == false ? bgOrange : bgGreen),
              ))),
    );
  }
}
