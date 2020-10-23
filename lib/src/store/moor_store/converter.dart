import 'package:gpodder_client/src/episode/gpoepisode.dart';
import 'package:gpodder_client/src/models/episode_status.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:gpodder_client/src/store/moor_store/database.dart';

class PodcastConverter {
  static GpoPodcast mapToDart(PodcastRecord p) {
    return GpoPodcast(
      url: Uri.parse(p.guidUrl),
      title: p.title,
      description: p.description,
      subscribers: p.subscribers,
      logo_url: Uri.parse(p.logo_url),
      website: Uri.parse(p.website),
      mygpo_link: Uri.parse(p.mygpo_link),
    );
  }

  static PodcastRecord mapToSql(GpoPodcast p) {
    return PodcastRecord(
      guidUrl: p.url.toString(),
      title: p.title,
      author: p.author,
      description: p.description,
      subscribers: p.subscribers,
      logo_url: p.logo_url.toString(),
      website: p.website.toString(),
      mygpo_link: p.mygpo_link.toString(),
    );
  }
}

class EpisodeConverter {
  static GpoEpisode mapToDart(EpisodeRecord e) {
    if (e == null) {
      return null;
    }
    return GpoEpisode(
        e.title,
        Uri.parse(e.guidUrl),
        e.podcast_title,
        Uri.parse(e.podcast_url),
        e.description,
        Uri.parse(e.website),
        e.released,
        Uri.parse(e.mygpo_link),
        status: EpisodeStatus.fromJson(e.status),
        position: e.position,
        total: e.total,
    );
  }

  static EpisodeRecord mapToSql(GpoEpisode e) {
    return EpisodeRecord(
      guidUrl: e.url.toString(),
      title: e.title,
      podcast_title: e.podcast_title,
      podcast_url: e.podcast_url.toString(),
      description: e.description,
      website: e.website.toString(),
      released: e.released,
      mygpo_link: e.mygpo_link.toString(),
      status: e.status?.status ?? EpisodeStatus.NEW.status,
      position: e.position ?? 0,
      total: e.total ?? 1,
    );
  }
}
