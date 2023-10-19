import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(Object context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Colors.white,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        )
      ],
    );
  }
}
