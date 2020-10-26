import 'package:gpodder_client/src/episode/gpoepisode.dart';
import 'package:gpodder_client/src/models/device.dart';
import 'package:gpodder_client/src/models/episode_action.dart';
import 'package:gpodder_client/src/models/episode_status.dart';
import 'package:gpodder_client/src/models/sub_diff.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:gpodder_client/src/podcast/podcast.dart';
import 'package:gpodder_client/src/episode/episode.dart';
import 'package:gpodder_client/src/server.dart';
import 'package:gpodder_client/src/store/store.dart';
import 'package:meta/meta.dart';
import 'package:podcast_search/podcast_search.dart' as psapi;

class User<P extends Podcast, E extends Episode> {
  final Store<P, E> store;
  final Server server;
  final P Function(GpoPodcast) podcastFrom;
  final E Function(GpoEpisode) episodeFrom;
  final Device device;

  User(
    this.store,
    this.server,
    this.podcastFrom,
    this.episodeFrom,
    this.device,
  );

  Future<void> logout() {
    return Future.wait([
      store.close(),
      server.api.logout(),
    ]);
  }

  Future<List<P>> search({
    @required String query,
    int scale_logo = 0,
  }) async {
    var s = await server.api.search(
      query,
      scale_logo: scale_logo,
    );
    return s.map(podcastFrom).toList();
  }

  Future<List<P>> charts({
    @required int size,
    int scale_logo = 64,
  }) async {
    var s = await server.api.topPodcasts(
      size,
      scale_logo: scale_logo,
    );
    return s.map(podcastFrom).toList();
  }

  Future<P> loadPodcast(
    Uri podcast_url,
  ) async {
    var gpodcast = await server.api.podcast(podcast_url);
    return podcastFrom(gpodcast);
  }

  Future<List<P>> subscribe(List<P> podcasts) async {
    var answer = await server.api.postSubscriptionUpdate(
        device.id,
        SubscriptionDiff(
          add: podcasts.map((e) => e.url).toList(),
          remove: [],
        ));
    for (List<Uri> urls in answer.update_urls) {
      for (P p in podcasts) {
        if (p.url == urls[0]) {
          p.url = urls[1];
        }
      }
    }
    store.savePodcasts(podcasts);
    return podcasts;
  }

  Future<void> unsubscribe(List<P> podcasts) {
    return Future.wait([
      server.api.postSubscriptionUpdate(
          device.id,
          SubscriptionDiff(
            add: [],
            remove: podcasts.map((e) => e.url).toList(),
          )),
      store.deletePodcasts(podcasts.map((e) => e.url)),
    ]);
  }

  Future<void> pullSubscription() async {
    //TODO use proper timestamp
    var update = await server.api.getSubscriptionUpdate(device.id, 0);
    return Future.wait([
      store.deletePodcasts(update.remove),
      store.savePodcasts(
          await Future.wait(update.add.map((e) async => await loadPodcast(e)))),
      //TODO save timestamp
    ]);
  }

  Future<List<List<E>>> loadEpisodes([List<P> podcasts]) async {
    if (podcasts == null) {
      podcasts = (await subscriptions()).values;
    }
    return Future.wait(podcasts.map((p) async {
      var loadFeed = await psapi.Podcast.loadFeed(url: p.url.toString());
      var newEpisodes = loadFeed.episodes
          .where((e) =>
              //TODO use previous sync DateTime
              e.publicationDate.isAfter(DateTime.fromMillisecondsSinceEpoch(0)))
          .map((e) => episodeFrom(GpoEpisode(
                e.title,
                Uri.parse(e.contentUrl),
                loadFeed.title,
                p.url,
                e.description,
                Uri.parse(loadFeed.link),
                e.publicationDate,
                null,
                status: EpisodeStatus.NEW,
              )));
      //TODO check if podcasts are subscribed before storing episodes
      await store.saveEpisodes(newEpisodes);
      return newEpisodes.toList();
    }));
  }

  Future<Map<Uri, P>> subscriptions() {
    return store.subscriptions();
  }

  Future<Map<Uri, E>> episodes() {
    return store.episodes();
  }

  Future<E> setDownloaded(Episode episode) async {
    var episodeAction = EpisodeAction(
      episode: episode.url,
      podcast: episode.podcast_url,
      action: EpisodeStatus.DOWNLOAD,
    );
    episode.applyAction(episodeAction);
    await Future.wait([
      server.api.postEpisodeActions([episodeAction]),
      store.replaceEpisode(episode),
    ]);
    return episode;
  }

  Future<E> setCompletion(
    E episode,
    int position,
    int total,
  ) async {
    var episodeAction = EpisodeAction(
      episode: episode.url,
      podcast: episode.podcast_url,
      action: EpisodeStatus.PLAY,
      started: 0,
      position: position,
      total: total,
    );
    episode.applyAction(episodeAction);
    var answer = await server.api.postEpisodeActions([episodeAction]);
    if(answer.update_urls.isNotEmpty){
      var urls = answer.update_urls.first;
      episode.url = urls[1];
    }
    store.replaceEpisode(episode);
    return episode;
  }

  Future<List<E>> pullEpisodeActions({bool resync = false}) async {
    //TODO use and store timestamp
    final since = 0;
    final device = resync ? null : this.device;
    final updated = <E>[];
    final epDiff =
        await server.api.getEpisodeActions(device: device, since: since);
    await Future.wait(epDiff.actions.map((action) async {
      var episode = await store.findEpisodeByGuid(action.episode.toString());
      //TODO sort out why episode isn't in the db,
      // not subscribed ? subscribed after sync ? sub sync after episode sync
      if (episode == null) {
        return Future.error(EpisodeMissingException(action));
      }
      episode.applyAction(action);
      updated.add(episode);
      await store.replaceEpisode(episode);
    }));
    return updated;
  }
}

class EpisodeMissingException implements Exception{
  final String message =
   '''EpisodeMissingException,
   Episode couldn't be found in the database to apply an EpisodeAction.
   Try synchronizing subscriptions and loading episodes feed before pulling actions.
  ''';
  final EpisodeAction action;

  const EpisodeMissingException(this.action);

  @override
  String toString() {
    return message  + '\n' + action.toJson().toString();
  }
}
