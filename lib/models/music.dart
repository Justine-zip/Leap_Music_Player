class Music {
  String title;
  String? duration;
  String? thumbnail;

  Music({required this.title, this.duration, this.thumbnail});

  factory Music.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'] ?? {};
    return Music(
      title: snippet['title'],
      duration: null,
      thumbnail: snippet['thumbnails']?['high']?['url'],
    );
  }
}
