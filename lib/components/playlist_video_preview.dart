import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/provider/youtube_provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PlaylistVideoPreview extends ConsumerStatefulWidget {
  const PlaylistVideoPreview({super.key});

  @override
  ConsumerState<PlaylistVideoPreview> createState() =>
      _PlaylistVideoPreviewState();
}

class _PlaylistVideoPreviewState extends ConsumerState<PlaylistVideoPreview> {
  YoutubePlayerController? controller;
  String? currentVideoId;
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPlaylist = ref.watch(topPlaylistProvider);

    return SizedBox(
      child: topPlaylist.when(
        data: (playlist) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final videoId = playlist[index].id;

              return Padding(
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentVideoId = videoId;
                      debugPrint(
                        'Title: ${playlist[index].title} VideoId: $currentVideoId',
                      );

                      controller?.close();
                      controller = YoutubePlayerController.fromVideoId(
                        videoId: videoId,
                        params: const YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: false,
                        ),
                      );

                      isPlaying = true;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
                      width: MediaQuery.of(context).size.width * 0.6,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (e, _) => Center(child: Text(e.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
