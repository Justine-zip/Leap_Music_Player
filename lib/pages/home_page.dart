import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomSheet: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.library_music_rounded)),
          ],
        ),
        body: const TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'L E A P  M S X',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Icon(Icons.library_music_rounded),
          ],
        ),
      ),
    );
  }
}
