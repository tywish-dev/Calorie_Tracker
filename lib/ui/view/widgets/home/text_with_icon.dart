import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon(
      {super.key, required this.label, required this.num, required this.icon});
  final String label;
  final String num;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon.icon,
          size: 30,
          color: Colors.red,
        ),
        Text(
          num,
          style: const TextStyle(
            letterSpacing: 2,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
        ),
      ],
    );
  }
}
