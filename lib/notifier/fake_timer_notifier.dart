import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/provider/music_player_provider.dart';

class FakeTimerNotifier extends Notifier<double> {
  @override
  double build() {
    return 0;
  }

  double totalSeconds = 0;

  Timer? progressTimer;

  void startFakeProgress() {
    totalSeconds = ref.read(musicPlayerProvider.notifier).getDuration();
    stop();
    state = 0;
    _startTimer();
  }

  void pause() {
    progressTimer?.cancel();
    progressTimer = null;
  }

  void resume() {
    if (progressTimer != null) return;
    _startTimer();
  }

  void stop() {
    progressTimer?.cancel();
    progressTimer = null;
    state = 0;
  }

  void _startTimer() {
    progressTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state < totalSeconds) {
        state += 1.0;
        if (state > totalSeconds) state = totalSeconds;
      } else {
        stop();
      }
    });
  }
}
