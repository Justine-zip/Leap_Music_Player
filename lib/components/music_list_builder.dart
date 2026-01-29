import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/pages/music_play_page.dart';
import 'package:leap/provider/music_player_provider.dart';
import 'package:leap/provider/youtube_provider.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class MusicListBuilder extends ConsumerStatefulWidget {
  const MusicListBuilder({super.key});

  @override
  ConsumerState<MusicListBuilder> createState() => _MusicListBuilderState();
}

class _MusicListBuilderState extends ConsumerState<MusicListBuilder> {
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
                  ref
                      .read(musicPlayerProvider.notifier)
                      .play(playlist[index].id);
                  Navigator.of(context).push(
                    PageAnimationTransition(
                      page: MusicPlayPage(
                        id: playlist[index].id,
                        title: playlist[index].title,
                        owner: playlist[index].owner,
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
