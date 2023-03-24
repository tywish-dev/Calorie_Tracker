import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/providers/dropdown_provider.dart';
import 'package:calorie_tracker/ui/view/screens/nutritionFacts.dart';
import 'package:calorie_tracker/ui/view/widgets/login/custom_button.dart';
import 'package:provider/provider.dart';

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
    DropdownProvider dropdownProvider = Provider.of<DropdownProvider>(context);
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
                        return Consumer<DropdownProvider>(
                          builder: (context, dropdownProvider, _) {
                            return AlertDialog(
                              title: Text('Add ${widget.nutrition.name}'),
                              content: DropdownButton(
                                value: dropdownProvider.dropdownValue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items:
                                    dropdownProvider.list.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  dropdownProvider.setValue(newValue!);
                                },
                              ),
                              actions: [
                                SizedBox(
                                  width: 150,
                                  child: CustomButton(
                                    text: "Delete",
                                    onPressed: () {},
                                    bgColor: false,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: CustomButton(
                                    text: "Add",
                                    onPressed: () {},
                                    bgColor: false,
                                  ),
                                ),
                              ],
                            );
                          },
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
