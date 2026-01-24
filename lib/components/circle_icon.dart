import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final void Function()? onTap;
  const CircleIcon({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(38),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon, size: iconSize),
        ),
      ),
    );
  }
}
