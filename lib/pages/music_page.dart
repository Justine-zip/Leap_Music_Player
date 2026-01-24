import 'package:flutter/material.dart';
import 'package:leap/components/music_list_builder.dart';
import 'package:leap/components/my_searchbox.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 100, 12, 0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              height: MediaQuery.of(context).size.width * .4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                //Music Albums or Songs
                child: Center(child: Text('D A T A')),
              ),
            ),
            SizedBox(height: 30),
            MySearchbox(hint: 'Search...'),
            Expanded(child: MusicListBuilder()),
          ],
        ),
      ),
    );
  }
}
