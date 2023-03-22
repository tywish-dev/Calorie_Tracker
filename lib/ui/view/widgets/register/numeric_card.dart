import '/ui/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumericCard extends StatelessWidget {
  const NumericCard({super.key, required this.numeric});
  final int numeric;
  @override
  Widget build(BuildContext context) {
    var bmiProvider = Provider.of<BmiProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.4,
      height: size.height * 0.23,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                numeric == 0
                    ? const Opacity(
                        opacity: 0.5,
                        child: Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : const Opacity(
                        opacity: 0.5,
                        child: Text(
                          'Age',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                Center(
                  child: numeric == 0
                      ? Text(
                          bmiProvider.getWeight.toString(),
                          style: const TextStyle(
                              fontSize: 72, fontWeight: FontWeight.w600),
                        )
                      : Text(
                          bmiProvider.getAge.toString(),
                          style: const TextStyle(
                              fontSize: 72, fontWeight: FontWeight.w600),
                        ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      if (numeric == 0) {
                        bmiProvider.decrementWeight();
                      } else {
                        bmiProvider.decrementAge();
                      }
                    },
                    icon: const Icon(
                      Icons.remove,
                      size: 50,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      if (numeric == 0) {
                        bmiProvider.incrementWeight();
                      } else {
                        bmiProvider.incrementAge();
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
