import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.label,
      required this.isProfile,
      required this.appBar});
  final String label;
  final bool isProfile;
  final AppBar appBar;

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.orange,
      ),
      title: isProfile == true
          ? Text(
              label,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            )
          : null,
      elevation: 0,
      backgroundColor: bgGreen,
      leadingWidth: 71,
      leading: isProfile == true
          ? Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  Faker()
                      .image
                      .image(random: true, keywords: ["profile pic", "asian"]),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: bgOrange,
              )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            iconSize: 40,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
