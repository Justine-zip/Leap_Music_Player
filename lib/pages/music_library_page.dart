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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'LEAP where your music lives.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleIcon(
                    icon: Icons.play_arrow_rounded,
                    iconSize: 42,
                    onTap: () {
                      //Play Music
                    },
                  ),
                  SizedBox(width: 8),
                  CircleIcon(
                    icon: Icons.shuffle_rounded,
                    iconSize: 15,
                    onTap: () {
                      //Play Music
                    },
                  ),
                ],
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
