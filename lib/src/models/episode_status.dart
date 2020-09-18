class EpisodeStatus {
  final String status;


  factory EpisodeStatus.fromJson(String json) => EpisodeStatus._(json);

  String toJson() => this.status;

  const EpisodeStatus._(this.status);

  static const EpisodeStatus NEW = const EpisodeStatus._('new');
  static const EpisodeStatus PLAY = const EpisodeStatus._('play');
  static const EpisodeStatus DOWNLOAD = EpisodeStatus._('download');
  static const EpisodeStatus DELETE = EpisodeStatus._('delete');
  static const EpisodeStatus FLATTR = EpisodeStatus._('flattr');


  static List<String> availableStatus = [
    'new',
    'play',
    'download',
    'delete',
    'flattr'
  ];

  @override
  String toString() {
    return this.status;
  }
}


