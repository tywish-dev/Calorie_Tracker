// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calorie_tracker/ui/providers/user_auth_provider.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  // final String image;
  final String foodName;
  final int kcal;
  // final int piece;
  final int gr;
  const FoodCard({
    Key? key,
    // required this.image,
    required this.foodName,
    required this.kcal,
    // required this.piece,
    required this.gr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAuthProvider userAuthProvider = Provider.of<UserAuthProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          // Image.asset(
          //   image,
          //   height: 50,
          //   width: 50,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              width: MediaQuery.of(context).size.width - 130,
              height: 50,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black26))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "$kcal kcal - $gr gr",
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
