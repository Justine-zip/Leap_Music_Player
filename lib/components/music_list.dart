import 'package:flutter/material.dart';

class MusicList extends StatelessWidget {
  MusicList({super.key});

  final List<String> musicList = [
    'Thinking Out Loud',
    'Call Me Maybe',
    'Ghost Town',
    '7 Years Old',
    'Big Girls Cry',
    'Unstoppable',
    'Chandelier',
    'Snowman',
    'Perfect',
    'All Of Me',
    'All I Ask',
    'Iris',
    'Lips Of An Angel',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: musicList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('IMG'),
            ),
          ),
          title: Text(musicList[index]),
          trailing: SizedBox(
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('3:38'), Icon(Icons.play_arrow)],
            ),
          ),
        );
      },
    );
  }
}
