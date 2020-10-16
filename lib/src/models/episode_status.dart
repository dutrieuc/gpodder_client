class EpisodeStatus {
  final String status;

  factory EpisodeStatus.fromJson(String json) => EpisodeStatus._(json);

  String toJson() => this.status;

  const EpisodeStatus._(this.status);

  static const EpisodeStatus NEW = const EpisodeStatus._('new');
  static const EpisodeStatus PLAY = const EpisodeStatus._('play');
  static const EpisodeStatus DOWNLOAD = const EpisodeStatus._('download');
  static const EpisodeStatus DELETE = const EpisodeStatus._('delete');
  static const EpisodeStatus FLATTR = const EpisodeStatus._('flattr');


  @override
  String toString() {
    return this.status;
  }
}


