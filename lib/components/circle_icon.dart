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
    return Material(
      elevation: 4,
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(42),
      child: InkWell(
        borderRadius: BorderRadius.circular(42),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon, size: iconSize),
        ),
      ),
    );
  }
}
