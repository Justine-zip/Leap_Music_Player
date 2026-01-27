import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/components/music_list_builder.dart';
import 'package:leap/components/my_searchbox.dart';
import 'package:leap/components/playlist_video_preview.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MusicPage extends ConsumerStatefulWidget {
  const MusicPage({super.key});

  @override
  ConsumerState<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends ConsumerState<MusicPage> {
  YoutubePlayerController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 100, 12, 0),
        child: Column(
          children: [
            Expanded(flex: 1, child: PlaylistVideoPreview()),
            const SizedBox(height: 30),
            const MySearchbox(hint: 'Search...'),
            Expanded(flex: 2, child: MusicListBuilder()),
          ],
        ),
      ),
    );
  }
}
