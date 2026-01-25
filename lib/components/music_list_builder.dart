import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/models/music.dart';
import 'package:leap/pages/music_play_page.dart';
import 'package:leap/provider/youtube_provider.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class MusicListBuilder extends ConsumerStatefulWidget {
  const MusicListBuilder({super.key});

  @override
  ConsumerState<MusicListBuilder> createState() => _MusicListBuilderState();
}

class _MusicListBuilderState extends ConsumerState<MusicListBuilder> {
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
    final topPlaylist = ref.watch(topPlaylistProvider);
    return topPlaylist.when(
      data:
          (playlist) => ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  debugPrint('Music Title: ${playlist[index].title}');
                  Navigator.of(context).push(
                    PageAnimationTransition(
                      page: MusicPlayPage(
                        title: playlist[index].title,
                        thumbnail: '${playlist[index].thumbnail}',
                        duration: '${playlist[index].duration}',
                      ),
                      pageAnimationType: RightToLeftTransition(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                        playlist[index].thumbnail != null
                            ? SizedBox(
                              width: 40,
                              height: 30,
                              child: Image.network(
                                '${playlist[index].thumbnail}',
                              ),
                            )
                            : Padding(
                              padding: const EdgeInsets.all(8.0),
                              //Music Thumbnail
                              child: Text('IMG'),
                            ),
                  ),
                  title: Text(
                    playlist[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: SizedBox(
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${playlist[index].duration}'),
                        Icon(Icons.play_arrow),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
      error: (e, _) => Center(child: Text(e.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
