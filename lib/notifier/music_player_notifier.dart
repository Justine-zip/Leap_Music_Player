import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MusicPlayerNotifier extends Notifier<YoutubePlayerController?> {
  @override
  YoutubePlayerController? build() {
    // Controller lives as long as provider lives
    return null;
  }

  void play(String videoId) {
    if (state == null) {
      state = YoutubePlayerController.fromVideoId(
        videoId: videoId,
        autoPlay: true,
        params: const YoutubePlayerParams(
          enableJavaScript: true,
          mute: false,
          showControls: false,
          showFullscreenButton: false,

          origin: 'https://www.youtube-nocookie.com',
        ),
      );
    } else {
      state!.loadVideoById(videoId: videoId);
    }
  }

  void pause() => state?.pauseVideo();
  void resume() => state?.playVideo();
}
