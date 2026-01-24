import 'package:flutter/material.dart';
import 'package:leap/models/music.dart';

class MusicListBuilder extends StatelessWidget {
  MusicListBuilder({super.key});

  final List<Music> musicList = [
    Music(title: 'Thinking Out Loud', duration: '3:32'),
    Music(title: 'Call Me Maybe', duration: '3:25'),
    Music(title: 'Ghost Town', duration: '2:27'),
    Music(title: '7 Years Old', duration: '3:44'),
    Music(title: 'Big Girls Cry', duration: '3:38'),
    Music(title: 'Unstoppable', duration: '2:32'),
    Music(title: 'Chandelier', duration: '3:07'),
    Music(title: 'Snowman', duration: '3:13'),
    Music(title: 'Perfect', duration: '3:16'),
    Music(title: 'All Of Me', duration: '3:29'),
    Music(title: 'All I Ask', duration: '2:02'),
    Music(title: 'Iris', duration: '3:24'),
    Music(title: 'Like A Stone', duration: '3:33'),
    Music(title: 'Castle On The Hill', duration: '3:32'),
    Music(title: 'Vienna', duration: '3:36'),
    Music(title: 'Talking To The Moon', duration: '3:46'),
    Music(title: 'It Will Rain', duration: '3:18'),
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
              //Music Thumbnail
              child: Text('IMG'),
            ),
          ),
          title: Text(musicList[index].title),
          trailing: SizedBox(
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(musicList[index].duration),
                Icon(Icons.play_arrow),
              ],
            ),
          ),
        );
      },
    );
  }
}
