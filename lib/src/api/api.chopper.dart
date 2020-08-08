// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$GpodderService extends GpodderService {
  _$GpodderService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = GpodderService;

  Future<Response> login(String username) {
    final $url = '/api/2/auth/${username}/login.json';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> logout(String username) {
    final $url = '/api/2/auth/${username}/logout.json';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> toptags(int count) {
    final $url = '/api/2/tags/${count}.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> podcastsForTag(String tag, int count) {
    final $url = '/api/2/tag/${tag}/${count}.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> podcastData(Uri url) {
    final $url = '/api/2/data/podcast.json';
    final Map<String, dynamic> $params = {'url': url};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> episodeData(Uri podcast, String url) {
    final $url = '/api/2/data/episode.json';
    final Map<String, dynamic> $params = {'podcast': podcast, 'url': url};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> topPodcasts(int number, String format,
      {String jsonp, int scale_logo}) {
    final $url = '/api/2/../../toplist/${number}.${format}';
    final Map<String, dynamic> $params = {
      'jsonp': jsonp,
      'scale_logo': scale_logo
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> search(String format, String q,
      {String jsonp, int scale_logo}) {
    final $url = '/api/2/../../search.${format}';
    final Map<String, dynamic> $params = {
      'q': q,
      'jsonp': jsonp,
      'scale_logo': scale_logo
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
