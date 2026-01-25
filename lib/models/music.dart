class Music {
  String title;
  String owner;
  String? duration;
  String? thumbnail;

  Music({
    required this.title,
    required this.owner,
    this.duration,
    this.thumbnail,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'] ?? {};
    return Music(
      title: snippet['title'],
      owner: snippet['videoOwnerChannelTitle'],
      duration: null,
      thumbnail: snippet['thumbnails']?['high']?['url'],
    );
  }
}
