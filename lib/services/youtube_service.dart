import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:leap/models/music.dart';

class YoutubeService {
  static const String apiKey = 'AIzaSyCYx2BnArXfiCv4HcAhhQxloK0M6CjCG_w';
  static const String baseUrl = 'https://www.googleapis.com/youtube/v3/search';
  static const String basePlaylistUrl =
      'https://www.googleapis.com/youtube/v3/playlistItems';

  Future<List<Music>> fetchTopPlaylist() async {
    final uri = Uri.parse(
      '$baseUrl'
      '?part=snippet'
      '&q=top+playlist'
      '&type=playlist'
      '&maxResults=1'
      '&key=$apiKey',
    );

    final baseResponse = await http.get(uri);

    if (baseResponse.statusCode != 200) {
      throw Exception('Failed to fetch data');
    }

    final baseData = json.decode(baseResponse.body);
    debugPrint('data: $baseData');

    final playlistId = baseData['items'][0]['id']['playlistId'];

    final playlistUri = Uri.parse(
      '$basePlaylistUrl'
      '?part=snippet'
      '&playlistId=$playlistId'
      '&maxResults=10'
      '&key=$apiKey',
    );

    final response = await http.get(playlistUri);

    final playlistData = json.decode(response.body);

    final playlistItems = playlistData['items'] as List;

    return playlistItems.map((item) => Music.fromJson(item)).toList();
  }
}
