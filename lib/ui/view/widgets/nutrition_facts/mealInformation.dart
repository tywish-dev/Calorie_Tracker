import 'package:flutter/material.dart';

class MealInformation extends StatelessWidget {
  final String mealName;
  final String mealgr;
  final String percentage;
  const MealInformation({
    Key? key,
    required this.mealName,
    required this.mealgr,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * .7,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black54, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                mealName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "$mealgr g",
                ),
              )
            ],
          ),
          percentage == ""
              ? const Text(
                  "",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              : Text(
                  "% $percentage",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
        ],
      ),
    );
  }
}
