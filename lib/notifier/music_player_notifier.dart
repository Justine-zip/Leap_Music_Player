import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/provider/fake_timer_provider.dart';
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
      state!.listen((event) {
        // When video starts playing, start the fake timer
        if (event.playerState == PlayerState.playing) {
          ref.read(fakeTimerProvider.notifier).resume();

          final duration = event.metaData.duration.inSeconds.toDouble();
          if (duration > 0) {
            ref.read(fakeTimerProvider.notifier).totalSeconds = duration;
          }
        }

        if (event.playerState == PlayerState.paused) {
          ref.read(fakeTimerProvider.notifier).pause();
        }

        if (event.playerState == PlayerState.ended) {
          ref.read(fakeTimerProvider.notifier).stop();
        }
      });
    } else {
      state!.loadVideoById(videoId: videoId);
      ref.read(fakeTimerProvider.notifier).startFakeProgress();
    }
  }

  double getDuration() {
    return state!.value.metaData.duration.inSeconds.toDouble();
  }

  void pause() {
    state?.pauseVideo();
    ref.read(fakeTimerProvider.notifier).pause();
  }

  void resume() {
    state?.playVideo();
    ref.read(fakeTimerProvider.notifier).resume();
  }
}
