class Music {
  String id;
  String title;
  String owner;
  String? duration;
  String? thumbnail;

  Music({
    required this.id,
    required this.title,
    required this.owner,
    this.duration,
    this.thumbnail,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'] ?? {};
    return Music(
      id: snippet['resourceId']?['videoId'],
      title: snippet['title'],
      owner: snippet['videoOwnerChannelTitle'],
      duration: null,
      thumbnail: snippet['thumbnails']?['high']?['url'],
    );
  }
}
