import 'package:flutter/material.dart';

class MusicLibraryPage extends StatefulWidget {
  const MusicLibraryPage({super.key});

  @override
  State<MusicLibraryPage> createState() => _MusicLibraryPageState();
}

class _MusicLibraryPageState extends State<MusicLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'L I B R A R Y',
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
