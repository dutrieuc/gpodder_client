import 'package:gpodder_client/src/models/episode_status.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database.g.dart';

class PodcastRecords extends Table {
  TextColumn get guidUrl => text()();
  TextColumn get title => text()();
  TextColumn get author => text()();
  TextColumn get description => text()();
  IntColumn get subscribers => integer()();
  TextColumn get logo_url => text()();
  TextColumn get website => text()();
  TextColumn get mygpo_link => text()();
  IntColumn get position_last_week => integer().nullable()();

  @override
  Set<Column> get primaryKey => {guidUrl};
}

@DataClassName("Category")
class EpisodeRecords extends Table {
  TextColumn get guidUrl => text()();
  TextColumn get title => text()();
  TextColumn get podcast_title => text()();
  TextColumn get podcast_url => text()();
  TextColumn get description => text()();
  TextColumn get website => text()();
  DateTimeColumn get released => dateTime()();
  TextColumn get mygpo_link => text()();
  TextColumn get status => text().withDefault(const Constant('new'))();
  IntColumn get position => integer().withDefault(const Constant(0))();
  IntColumn get total => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {guidUrl};
}

@UseMoor(tables: [PodcastRecords, EpisodeRecords])
class GpodderDB extends _$GpodderDB  {
  GpodderDB(QueryExecutor e) : super(e);

  Future<PodcastRecord> findPodcastByGuid(String url){
    return (select(podcastRecords)..where((p) => p.guidUrl.equals(url))).getSingle();
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

  @override
  int get schemaVersion => 1;
}