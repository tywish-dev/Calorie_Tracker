import '/ui/providers/nutrition_provider.dart';
import 'package:provider/provider.dart';
import '/data/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    NutritionProvider nutritionProvider =
        Provider.of<NutritionProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: TextField(
            controller: textEditingController,
            cursorColor: bgOrange,
            autocorrect: false,
            onSubmitted: (value) async {
              await nutritionProvider.getNutrition(value);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              hintText: "Search in food database",
            ),
          ),
        ),
      ],
    );
  }
}
