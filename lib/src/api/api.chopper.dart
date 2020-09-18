// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$GpodderService extends GpodderService {
  _$GpodderService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GpodderService;

  @override
  Future<Response<dynamic>> login(String username) {
    final $url = '/api/2/auth/$username/login.json';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> logout(String username) {
    final $url = '/api/2/auth/$username/logout.json';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> toptags(int count) {
    final $url = '/api/2/tags/$count.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> podcastsForTag(String tag, int count) {
    final $url = '/api/2/tag/$tag/$count.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> podcastData(Uri url) {
    final $url = '/api/2/data/podcast.json';
    final $params = <String, dynamic>{'url': url};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> episodeData(Uri podcast, String url) {
    final $url = '/api/2/data/episode.json';
    final $params = <String, dynamic>{'podcast': podcast, 'url': url};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> topPodcasts(int number, String format,
      {String jsonp, int scale_logo}) {
    final $url = '/api/2/../../toplist/$number.$format';
    final $params = <String, dynamic>{'jsonp': jsonp, 'scale_logo': scale_logo};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> search(String format, String q,
      {String jsonp, int scale_logo}) {
    final $url = '/api/2/../../search.$format';
    final $params = <String, dynamic>{
      'q': q,
      'jsonp': jsonp,
      'scale_logo': scale_logo
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateDeviceData(
      String username, String deviceid, Map<dynamic, dynamic> body) {
    final $url = '/api/2/devices/$username/$deviceid.json';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> listDevices(String username) {
    final $url = '/api/2/devices/$username.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deviceUpdates(
      String username, String deviceid, int since, bool include_actions) {
    final $url = '/api/2/updates/$username/$deviceid.json';
    final $params = <String, dynamic>{
      'since': since,
      'include_actions': include_actions
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getSubscriptionUpdate(
      String username, String deviceid, int since) {
    final $url = '/api/2/subscriptions/$username/$deviceid.json';
    final $params = <String, dynamic>{'since': since};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> postSubscriptionUpdate(
      String username, String deviceid, Map<dynamic, dynamic> body) {
    final $url = '/api/2/subscriptions/$username/$deviceid.json';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getEpisodeActions(
      String username, Uri podcast, String device, int since, bool aggregated) {
    final $url = '/api/2/episodes/$username.json';
    final $params = <String, dynamic>{
      'podcast': podcast,
      'device': device,
      'since': since,
      'aggregated': aggregated
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> postEpisodeActions(
      String username, List<dynamic> body) {
    final $url = '/api/2/episodes/$username.json';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getClientParametrization() {
    final $url = '/api/2/../..//clientconfig.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
