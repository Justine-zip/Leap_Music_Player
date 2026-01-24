import 'package:flutter/material.dart';
import 'package:leap/components/circle_icon.dart';
import 'package:leap/pages/music_library_page.dart';
import 'package:leap/pages/music_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Scaffold(
            body: const TabBarView(children: [MusicPage(), MusicLibraryPage()]),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: CircleIcon(icon: Icons.sunny, iconSize: 24, onTap: () {}),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: TabBar(
                dividerColor: Colors.transparent,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.library_music_rounded)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
