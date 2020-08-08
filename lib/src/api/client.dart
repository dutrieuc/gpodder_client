import "dart:async";
import "dart:core";
import 'dart:math';

import 'package:chopper/chopper.dart';
import 'package:gpodder_client/src/models/episode.dart';

import 'api.dart';
import '../models/tag.dart';
import '../models/podcast.dart';
import '../models/episode.dart';

class GpodderClient {
  final ChopperClient _chopper;
  GpodderService _service;

  GpodderClient()
      : _chopper = ChopperClient(
          //TODO parametrize gpodder rep
          baseUrl: "https://gpodder.net",
          services: [GpodderService.create()],
          converter: JsonConverter(),
        ) {
    _service = _chopper.getService<GpodderService>();
  }

  Future<List<Tag>> topTags(int count) async {
    final response = await _service.toptags(count);
    return response.isSuccessful
        ? Tag.listFromJson(response.body)
        : Future.error(response.statusCode);
  }

  Future<List<Podcast>> podcastsForTag(Tag tag, int count) async {
    final response = await _service.podcastsForTag(tag.tag, count);
    return response.isSuccessful
        ? Podcast.listFromJson(response.body)
        : Future.error(response.statusCode);
  }

  Future<Podcast> podcast(Uri url) async {
    final response = await _service.podcastData(url);
    return Podcast.fromJson(response.body);
  }

  Future<Episode> episode(Uri podcast, String media_url) async {
    final response = await _service.episodeData(podcast, media_url);
    return Episode.fromJson(response.body);
  }

  Future<List<Podcast>> topPodcasts(int number, {int scale_logo = 64}) async {
    number = max(1, number);
    number = min(100, number);
    scale_logo = min(256, scale_logo);
    final response =
        await _service.topPodcasts(number, 'json', scale_logo: scale_logo);
    return Podcast.listFromJson(response.body);
  }

  Future<List<Podcast>> search(String query, {int scale_logo}) async {
    final response = await _service.search('json', query);
    return Podcast.listFromJson(response.body);
  }
}
