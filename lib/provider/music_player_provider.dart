import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/notifier/music_player_notifier.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

final musicPlayerProvider =
    NotifierProvider<MusicPlayerNotifier, YoutubePlayerController?>(
      MusicPlayerNotifier.new,
    );
