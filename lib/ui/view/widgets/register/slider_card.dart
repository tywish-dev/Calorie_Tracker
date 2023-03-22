import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/ui/providers/bmi_provider.dart';

class SliderCard extends StatefulWidget {
  const SliderCard({super.key});

  @override
  State<SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  @override
  Widget build(BuildContext context) {
    var bmiProvider = Provider.of<BmiProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.4,
      height: size.height * 0.2,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Opacity(
              opacity: 0.5,
              child: Text(
                'Height',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              '${bmiProvider.getHeight.round()} cm',
              style: const TextStyle(fontSize: 72),
            ),
            Slider(
              value: bmiProvider.getHeight,
              min: 110,
              max: 230,
              label: bmiProvider.getHeight.round().toString(),
              onChanged: (double value) {
                bmiProvider.setHeight(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
