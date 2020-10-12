import 'package:gpodder_client/src/episode/gpoepisode.dart';
import 'package:gpodder_client/src/models/client_parametrization.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:gpodder_client/src/store/store.dart';
import 'package:gpodder_client/src/store/user.dart';

class MoorStore extends Store<GpoPodcast, GpoEpisode> {
  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEpisode(GpoEpisode episode) {
    // TODO: implement deleteEpisode
    throw UnimplementedError();
  }

  @override
  Future<void> deletePodcasts(List<GpoPodcast> podcast) {
    // TODO: implement deletePodcast
    throw UnimplementedError();
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
  Future<GpoEpisode> findEpisodeByGuid(String guid) {
    // TODO: implement findEpisodeByGuid
    throw UnimplementedError();
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
  Future<GpoPodcast> findPodcastByGuid(String guid) {
    // TODO: implement findPodcastByGuid
    throw UnimplementedError();
  }

  @override
  Future<GpoPodcast> findPodcastById(num id) {
    // TODO: implement findPodcastById
    throw UnimplementedError();
  }

  @override
  Future<ClientParametrization> getClientParameters() {
    // TODO: implement getClientParameters
    return Future.value(null);
  }

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    return Future.value(User.noUserAvailable);
  }

  @override
  Future<void> putUser(User user) {
    // TODO: implement putUser
    throw UnimplementedError();
  }

  @override
  Future<GpoEpisode> saveEpisode(GpoEpisode episode) {
    // TODO: implement saveEpisode
    throw UnimplementedError();
  }

  @override
  Future<GpoPodcast> savePodcasts(List<GpoPodcast> podcast) {
    // TODO: implement savePodcast
    throw UnimplementedError();
  }

  @override
  Future<List<GpoPodcast>> subscriptions() {
    // TODO: implement subscriptions
    throw UnimplementedError();
  }
}
