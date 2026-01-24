import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  const CircleIcon({super.key, required this.icon, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(38),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(icon, size: iconSize),
      ),
    );
  }
}
