import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/widgets/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreen,
      appBar: CustomAppBar(
        label: "ABOUT US",
        isProfile: false,
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Esat Özkan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Oğuzhan Gündüz",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 170),
                child: Text(
                  "Samet Yılmaz",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
