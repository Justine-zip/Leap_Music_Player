import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/models/music.dart';
import 'package:leap/services/youtube_service.dart';

final youtubeServiceProvider = Provider<YoutubeService>((ref) {
  return YoutubeService();
});

final topPlaylistProvider = FutureProvider<List<Music>>((ref) async {
  final youtubeService = ref.read(youtubeServiceProvider);
  return youtubeService.fetchTopPlaylist();
});
