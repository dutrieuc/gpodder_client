import "dart:async";
import "dart:core";
import 'dart:math';

import 'package:chopper/chopper.dart';
import 'package:gpodder_client/src/models/client_parametrization.dart';

import 'api.dart';
import 'authentification.dart';
import '../models/tag.dart';
import '../models/podcast.dart';
import '../models/episode.dart';
import '../models/device.dart';
import '../models/update.dart';
import '../models/sub_diff.dart';
import '../models/upload_answer.dart';
import '../models/episode_action.dart';
import '../models/ep_diff.dart';

class GpodderClient {
  String _username;
  ChopperClient _chopper;
  GpodderService _service;

  GpodderClient(
      {String username, String password, String host = "https://gpodder.net"}) {
    _username = username;
    _chopper = ChopperClient(
      //TODO parametrize gpodder rep
      baseUrl: host,
      services: [GpodderService.create()],
      converter: JsonConverter(),
      interceptors: [AuthInterceptor(username, password)],
    );
    _service = _chopper.getService<GpodderService>();
  }

  ///
  /// Directory API, public
  ///
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

  ///
  /// Login API
  ///
  Future<int> login() async {
    final response = await _service.login(_username);
    return response.statusCode;
  }

  Future<int> logout() async {
    final response = await _service.login(_username);
    return response.statusCode;
  }

  ///
  /// Device API
  ///
  Future<int> updateDeviceData(Device device) async {
    final response =
        await _service.updateDeviceData(_username, device.id, device.toJson());
    return response.statusCode;
  }

  Future<List<Device>> listDevices() async {
    final response = await _service.listDevices(_username);
    return Device.listFromJson(response.body);
  }

  Future<Update> getDeviceUpdate(
    Device device,
    int since, {
    bool include_actions = false,
  }) async {
    final response = await _service.deviceUpdates(
        _username, device.id, since, include_actions);
    return Update.fromJson(response.body);
  }

  ///
  /// Subscriptions API
  ///
  Future<SubscriptionDiff> getSubscriptionUpdate(
    String deviceid,
    int since,
  ) async {
    final response =
        await _service.getSubscriptionUpdate(_username, deviceid, since);
    return SubscriptionDiff.fromJson(response.body);
  }

  Future<UploadAnswer> postSubscriptionUpdate(
    String deviceid,
    SubscriptionDiff diff,
  ) async {
    final response = await _service.postSubscriptionUpdate(
        _username, deviceid, diff.toJson());
    return UploadAnswer.fromJson(response.body);
  }

  ///
  /// Episode API
  ///
  Future<EpisodeDiff> getEpisodeActions(
      {Podcast podcast,
      Device device,
      int since = 0,
      bool aggregated = false}) async {
    final response = await _service.getEpisodeActions(
        _username, podcast?.url, device?.id, since, aggregated);
    return EpisodeDiff.fromJson(response.body);
  }

  Future<UploadAnswer> postEpisodeActions(
    List<EpisodeAction> diff,
  ) async {
    final response = await _service.postEpisodeActions(_username, diff);
    return UploadAnswer.fromJson(response.body);
  }

  ///
  /// Client Parametrization
  ///
  Future<ClientParametrization> getClientParametrization() async {
    final json = await _service.getClientParametrization();
    return ClientParametrization.fromJson(json.body);
  }
}
