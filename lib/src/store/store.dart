import 'package:gpodder_client/src/user.dart';
import 'package:gpodder_client/src/episode/episode.dart';
import 'package:gpodder_client/src/models/client_parametrization.dart';
import 'package:gpodder_client/src/models/device.dart';
import 'package:gpodder_client/src/models/episode_status.dart';
import 'package:gpodder_client/src/podcast/podcast.dart';
import 'package:gpodder_client/src/store/user_info.dart';

abstract class Store<P extends Podcast, E extends Episode> {
  /// General
  Future<UserInfo> getUserInfo();
  Future<void> putUserInfo(User user, Device device);
  Future<void> deleteUser();
  Future<ClientParametrization> getClientParameters();
  Future<void> close();

  /// Podcasts
  Future<P> findPodcastById(num id);
  Future<P> findPodcastByGuid(String guid);
  Future<P> savePodcasts(List<P> podcasts);
  Future<void> deletePodcasts(List<P> podcast);
  Future<List<P>> subscriptions();

  /// Episodes
  Future<E> findEpisodeByGuid(String guid);
  Future<List<E>> findEpisodesByPodcastGuid(String pguid);
  Future<E> findEpisodeByTaskId(String taskId);
  Future<E> saveEpisode(E episode);
  Future<void> deleteEpisode(E episode);
  Future<List<E>> findDownloadsByPodcastGuid(String pguid);
  Future<List<E>> findDownloads();

  /// Event listeners
  Stream<Podcast> podcastListener;
  Stream<EpisodeStatus> episodeListener;
}
