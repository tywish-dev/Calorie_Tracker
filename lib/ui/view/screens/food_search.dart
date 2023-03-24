import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:lottie/lottie.dart';
import '/ui/providers/nutrition_provider.dart';
import '/ui/view/widgets/home/custom_app_bar.dart';
import '/ui/view/widgets/search/food_item.dart';
import '/ui/view/widgets/search/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodSearch extends StatefulWidget {
  const FoodSearch({super.key});

  @override
  State<FoodSearch> createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  late TextEditingController foodSearch;
  @override
  void initState() {
    foodSearch = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "",
        isProfile: true,
        appBar: AppBar(),
      ),
      body: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                color: bgGreen,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 100))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Opacity(
              opacity: .6,
              child: Lottie.network(
                  "https://assets3.lottiefiles.com/packages/lf20_TmewUx.json",
                  repeat: false),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomSearchBar(
                  textEditingController: foodSearch,
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Consumer<NutritionProvider>(
                    builder: (context, nutritionProvider, _) => ListView(
                      children: [
                        ...nutritionProvider.getFoods
                            .map((e) => FoodItem(nutrition: e))
                            .toList(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
