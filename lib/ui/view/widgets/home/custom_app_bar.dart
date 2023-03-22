import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      title: Text(label),
      leading: isProfile == true
          ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(Faker()
                  .image
                  .image(random: true, keywords: ["profile pic", "asian"])),
            )
          : null,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      ],
    );
  }
}
