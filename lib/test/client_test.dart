import 'package:test/test.dart';
import '../src/api/client.dart';
import '../src/models/tag.dart';

Future<void> main() async {
  var client = GpodderClient();
  var episode = client.episode(Uri.http('feeds.99percentinvisible.org', '/99percentinvisible'),
      'https://dts.podtrac.com/redirect.mp3/media.blubrry.com/99percentinvisible/dovetail.prxu.org/96/9a5d71bb-62ca-4391-9ac6-df00f5b4578b/408_Valley_of_the_Fallen_pt01.mp3'
  );
  var toptags = await client.topTags(3);
  var toppod = await client.topPodcasts(3);
  print(toptags);
  print(toppod);
  var podcasts = await client.podcastsForTag(toptags.first, 3);
  print(podcasts);
  var podcast = await client.podcast(podcasts.first.url);
  print(podcast.description);
  print(await episode);
  var search = await client.search("invisible");
  print(search);

}
