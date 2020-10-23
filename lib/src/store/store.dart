import 'package:gpodder_client/src/episode/episode.dart';
import 'package:gpodder_client/src/models/client_parametrization.dart';
import 'package:gpodder_client/src/models/episode_status.dart';
import 'package:gpodder_client/src/podcast/podcast.dart';
import 'package:gpodder_client/src/store/user_info.dart';

abstract class Store<P extends Podcast, E extends Episode> {
  /// General
  Future<UserInfo> getUserInfo();
  Future<void> putUserInfo(UserInfo userInfo);
  Future<void> deleteUser();
  Future<ClientParametrization> getClientParameters();
  Future<void> close();

  /// Podcasts
  Future<P> findPodcastByGuid(String urlGuid);
  Future<void> savePodcasts(Iterable<P> podcasts);
  Future<void> deletePodcasts(Iterable<Uri> podcasts);
  Future<Map<Uri,P>> subscriptions();

  /// Episodes
  Future<Map<Uri,E>> episodes();
  Future<E> findEpisodeByGuid(String urlGuid);
  Future<Iterable<E>> findEpisodesByPodcastGuid(String pUrlGuid);
  Future<void> saveEpisodes(Iterable<E> episodes);
  Future<void> deleteEpisode(E episode);
  Future<List<E>> findDownloadsByPodcastGuid(String pUrlGuid);
  Future<List<E>> findDownloads();
  Future<void> replaceEpisode(E episode);

  /// Event listeners
  Stream<Podcast> podcastListener;
  Stream<EpisodeStatus> episodeListener;
}
