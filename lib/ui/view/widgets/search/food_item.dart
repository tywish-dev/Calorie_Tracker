import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/screens/nutritionFacts.dart';

import '/data/models/nutrition_model.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({super.key, required this.nutrition});
  final Nutrition nutrition;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    var list = ['Breakfast', 'Lunch', 'Dinner'];
    String dropDownValue = "Breakfast";
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NutritionFacts(
              nutrition: widget.nutrition,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: bgOrange,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 22,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.nutrition.name[0].toUpperCase()}${widget.nutrition.name.substring(1).toLowerCase()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${widget.nutrition.calories} Calories, ${widget.nutrition.serving_size_g.toInt()} gr",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black54),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Add ${widget.nutrition.name}'),
                          content: DropdownButton(
                            onChanged: (String? value) {
                              setState(() {
                                dropDownValue = value!;
                              });
                            },
                            value: dropDownValue,
                            items: list.map(
                              (String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              },
                            ).toList(),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
