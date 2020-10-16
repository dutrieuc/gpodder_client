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
