import 'package:moor/moor.dart';

part 'database.g.dart';

class PodcastRecords extends Table {
  TextColumn get guidUrl => text()();
  TextColumn get title => text()();
  TextColumn get author => text()();
  TextColumn get description => text()();
  IntColumn get subscribers => integer()();
  TextColumn get logo_url => text()();
  TextColumn get website => text()();
  TextColumn get mygpo_link => text().nullable()();
  IntColumn get position_last_week => integer().nullable()();

  @override
  Set<Column> get primaryKey => {guidUrl};
}

class EpisodeRecords extends Table {
  TextColumn get guidUrl => text()();
  TextColumn get title => text()();
  TextColumn get podcast_title => text()();
  TextColumn get podcast_url => text()();
  TextColumn get description => text()();
  TextColumn get website => text()();
  DateTimeColumn get released => dateTime()();
  TextColumn get mygpo_link => text().nullable()();
  TextColumn get status => text()();
  IntColumn get position => integer()();
  IntColumn get total => integer()();

  @override
  Set<Column> get primaryKey => {guidUrl};
}

@UseMoor(tables: [PodcastRecords, EpisodeRecords])
class GpodderDB extends _$GpodderDB {
  GpodderDB(QueryExecutor e) : super(e);

  Future<PodcastRecord> findPodcastByGuid(String url) {
    return (select(podcastRecords)..where((p) => p.guidUrl.equals(url)))
        .getSingle();
  }

  Future savePodcasts(Iterable<PodcastRecord> podcasts) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(podcastRecords, podcasts.toList());
    });
  }

  Future deletePodcasts(Iterable<PodcastRecord> podcasts) {
    return batch((batch) {
      podcasts.map((p) => batch.delete(podcastRecords, p));
    });
  }

  Future<Iterable<PodcastRecord>> allPodcasts() {
    return (select(podcastRecords).get());
  }

  Future<EpisodeRecord> findEpisodeByGuid(String guid) {
    return (select(episodeRecords)..where((p) => p.guidUrl.equals(guid)))
        .getSingle();
  }

  Future<void> saveEpisodes(Iterable<EpisodeRecord> episodes) {
    return batch((batch) {
      batch.insertAll(episodeRecords, episodes.toList());
    });
  }

  Future<Iterable<EpisodeRecord>> allEpisodes() {
    return (select(episodeRecords).get());
  }

  @override
  int get schemaVersion => 1;
}