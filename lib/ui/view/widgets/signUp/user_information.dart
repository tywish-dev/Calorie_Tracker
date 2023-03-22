// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  final String image;
  final String text;
  final double value;
  final double maxValue;

  const UserInformation({
    Key? key,
    required this.image,
    required this.text,
    required this.value,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double value = 0;
    return Container(
        margin: EdgeInsets.all(10),
        height: 100,
        width: MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 4,
                  offset: const Offset(4, 4))
            ]),
        child: Row(children: [
          Column(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                padding: const EdgeInsets.all(2),
                child: Image.asset(
                  image,
                  color: Colors.black87,
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: 3,
                          offset: const Offset(3, 3))
                    ]),
              ),
              Text(
                text,
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ],
          ),
          Container(
            width: 250,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.grey.shade200,
                  inactiveTrackColor: Colors.grey.shade200,
                  valueIndicatorColor: Colors.black54),
              child: Slider(
                  min: 0,
                  max: maxValue,
                  value: value,
                  thumbColor: Colors.grey.shade200,
                  activeColor: Colors.black54,
                  inactiveColor: Colors.black54,
                  divisions: maxValue.toInt(),
                  label: "${value}",
                  onChanged: (double values) => value = values),
            ),
          )
        ]));
  }
}
