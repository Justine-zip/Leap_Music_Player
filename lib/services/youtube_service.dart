import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:leap/models/music.dart';

class YoutubeService {
  static const String apiKey = 'AIzaSyCYx2BnArXfiCv4HcAhhQxloK0M6CjCG_w';
  static const String baseUrl = 'https://www.googleapis.com/youtube/v3/search';
  static const String basePlaylistUrl = '';

  Future<List<Music>> fetchTopPlaylist() async {
    final uri = Uri.parse(
      '$baseUrl'
      '?part=snippet'
      '&q=top+playlist'
      '&type=playlist'
      '&maxResults=1'
      '&key=$apiKey',
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch data');
    }

    final data = json.decode(response.body);
    debugPrint('data: $data');

    final items = data['items'] as List;

    return items.map((item) => Music.fromJson(item)).toList();
  }
}
