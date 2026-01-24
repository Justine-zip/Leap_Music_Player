import 'package:flutter/material.dart';
import 'package:leap/components/circle_icon.dart';
import 'package:leap/components/music_list_builder.dart';

class MusicLibraryPage extends StatefulWidget {
  const MusicLibraryPage({super.key});

  @override
  State<MusicLibraryPage> createState() => _MusicLibraryPageState();
}

class _MusicLibraryPageState extends State<MusicLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 100, 12, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CircleIcon(icon: Icons.play_arrow, iconSize: 28),
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: MusicListBuilder()),
          ],
        ),
      ),
    );
  }
}
