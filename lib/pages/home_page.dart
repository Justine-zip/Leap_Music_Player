import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'L E A P  M S X',
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
