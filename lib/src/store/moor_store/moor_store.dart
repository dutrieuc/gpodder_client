import 'package:gpodder_client/src/store/moor_store/converter.dart';
import 'package:gpodder_client/src/store/moor_store/database.dart';

import 'package:gpodder_client/src/episode/gpoepisode.dart';
import 'package:gpodder_client/src/models/client_parametrization.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:gpodder_client/src/store/store.dart';
import 'package:gpodder_client/src/store/user_info.dart';

class MoorStore extends Store<GpoPodcast, GpoEpisode> {
  final GpodderDB _db;

  MoorStore(e) : _db = GpodderDB(e);

  @override
  Future<void> close() {
    return _db.close();
  }

  @override
  Future<void> deleteEpisode(GpoEpisode episode) {
    // TODO: implement deleteEpisode
    throw UnimplementedError();
  }

  @override
  Future<void> deletePodcasts(Iterable<Uri> podcasts) {
    return _db.deletePodcasts(
        podcasts.map((e) => PodcastRecord(guidUrl: e.toString())));
  }

  @override
  Future<List<GpoEpisode>> findDownloads() {
    // TODO: implement findDownloads
    throw UnimplementedError();
  }

  @override
  Future<List<GpoEpisode>> findDownloadsByPodcastGuid(String pguid) {
    // TODO: implement findDownloadsByPodcastGuid
    throw UnimplementedError();
  }

  @override
  Future<GpoEpisode> findEpisodeByGuid(String guid) async {
    return EpisodeConverter.mapToDart(await _db.findEpisodeByGuid(guid));
  }

  @override
  Future<GpoEpisode> findEpisodeByTaskId(String taskId) {
    // TODO: implement findEpisodeByTaskId
    throw UnimplementedError();
  }

  @override
  Future<List<GpoEpisode>> findEpisodesByPodcastGuid(String pguid) {
    // TODO: implement findEpisodesByPodcastGuid
    throw UnimplementedError();
  }

  @override
  Future<GpoPodcast> findPodcastByGuid(String urlGuid) async {
    return PodcastConverter.mapToDart(await _db.findPodcastByGuid(urlGuid));
  }

  @override
  Future<ClientParametrization> getClientParameters() {
    // TODO: implement getClientParameters
    return Future.value(null);
  }

  @override
  Future<UserInfo> getUserInfo() {
    // TODO: implement getUser
    return Future.error('No user available');
  }

  @override
  Future<void> putUserInfo(UserInfo userInfo) async {
    // TODO: implement putUser
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    // throw UnimplementedError();
  }

  @override
  Future<void> saveEpisodes(Iterable<GpoEpisode> episodes) {
    return _db.saveEpisodes(episodes.map((e) => EpisodeConverter.mapToSql(e)));
  }

  @override
  Future<void> savePodcasts(Iterable<GpoPodcast> podcasts) {
    return _db.savePodcasts(podcasts.map((p) => PodcastConverter.mapToSql(p)));
  }

  @override
  Future<Map<Uri, GpoPodcast>> subscriptions() async {
    var ps = await _db.allPodcasts();
    return Map.fromIterable(
      ps,
      key: (v) => Uri.parse(v.guidUrl),
      value: (v) => PodcastConverter.mapToDart(v),
    );
  }

  @override
  Future<void> replaceEpisode(GpoEpisode episode) {
    return _db
        .update(_db.episodeRecords)
        .replace(EpisodeConverter.mapToSql(episode));
  }

  @override
  Future<Map<Uri, GpoEpisode>> episodes() async {
    var eps = await _db.allEpisodes();
    return Map.fromIterable(
      eps,
      key: (v) => Uri.parse(v.guidUrl),
      value: (v) => EpisodeConverter.mapToDart(v),
    );
  }
}
