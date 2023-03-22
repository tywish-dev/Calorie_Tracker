import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/bmi_provider.dart';

class GenderCard extends StatefulWidget {
  const GenderCard({super.key, required this.gender});
  final int gender;

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    var bmiProvider = Provider.of<BmiProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.4,
      height: size.height * 0.2,
      child: Card(
        child: GestureDetector(
          onTap: () {
            if (widget.gender == 0) {
              bmiProvider.femaleGender();
              bmiProvider.genderSelected();
            } else {
              bmiProvider.maleGender();
              bmiProvider.genderSelected();
            }
          },
          child: Column(
            children: [
              widget.gender == 0
                  ? bmiProvider.getGenderSelected == 0
                      ? const Opacity(
                          opacity: 1,
                          child: Icon(
                            Icons.female,
                            size: 144,
                          ),
                        )
                      : const Opacity(
                          opacity: 0.5,
                          child: Icon(
                            Icons.female,
                            size: 144,
                          ),
                        )
                  : bmiProvider.getGenderSelected == 1
                      ? const Opacity(
                          opacity: 1,
                          child: Icon(
                            Icons.male,
                            size: 144,
                          ),
                        )
                      : const Opacity(
                          opacity: 0.5,
                          child: Icon(
                            Icons.male,
                            size: 144,
                          ),
                        ),
              widget.gender == 0
                  ? const Text(
                      'Female',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  : const Text('Male',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
