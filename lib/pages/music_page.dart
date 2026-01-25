import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/components/music_list_builder.dart';
import 'package:leap/components/my_searchbox.dart';
import 'package:leap/provider/youtube_provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MusicPage extends ConsumerStatefulWidget {
  const MusicPage({super.key});

  @override
  ConsumerState<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends ConsumerState<MusicPage> {
  YoutubePlayerController? controller;

  @override
  void dispose() {
    controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPlaylist = ref.watch(topPlaylistProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 100, 12, 0),
        child: Column(
          children: [
            topPlaylist.when(
              data: (playlist) {
                final videoId = playlist[0].id;
                debugPrint('VideoID: $videoId');

                // Initialize controller only once
                controller ??= YoutubePlayerController.fromVideoId(
                  videoId: videoId,
                  params: const YoutubePlayerParams(
                    showVideoAnnotations: false,
                    strictRelatedVideos: false,
                    enableCaption: false,
                    enableKeyboard: false,
                    enableJavaScript: false,

                    showControls: true,
                    showFullscreenButton: false,
                    origin: 'https://www.youtube-nocookie.com',
                  ),
                );

                return ClipRect(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: double.infinity,
                    child: YoutubePlayer(
                      controller: controller!,
                      aspectRatio: 16 / 9,
                    ),
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text(e.toString())),
            ),
            const SizedBox(height: 30),
            const MySearchbox(hint: 'Search...'),
            Expanded(child: MusicListBuilder()),
          ],
        ),
      ),
    );
  }
}
