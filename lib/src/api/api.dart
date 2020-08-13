import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:gpodder_client/src/models/episode.dart';

part 'api.chopper.dart';

@ChopperApi(baseUrl: "/api/2")
abstract class GpodderService extends ChopperService {
  // helper methods that help you instanciate your service
  static GpodderService create([ChopperClient client]) =>
      _$GpodderService(client);

  ///
  /// Authentification
  ///
  @Post(path: '/auth/{username}/login.json')
  Future<Response> login(@Path() String username);

  @Post(path: '/auth/{username}/logout.json')
  Future<Response> logout(@Path() String username);

  ///
  /// Directory API
  ///
  @Get(path: '/tags/{count}.json')
  Future<Response> toptags(@Path() int count);

  @Get(path: '/tag/{tag}/{count}.json')
  Future<Response> podcastsForTag(
    @Path() String tag,
    @Path() int count,
  );

  @Get(path: '/data/podcast.json')
  Future<Response> podcastData(@Query() Uri url);

  @Get(path: '/data/episode.json')
  Future<Response> episodeData(
    @Query() Uri podcast,
    @Query() String url,
  );

  @Get(path: '../../toplist/{number}.{format}')
  Future<Response> topPodcasts(
    @Path() int number,
    @Path() String format, {
    @Query() String jsonp,
    @Query() int scale_logo,
  });

  @Get(path: '../../search.{format}')
  Future<Response> search(
    @Path() String format,
    @Query() String q, {
    @Query() String jsonp,
    @Query() int scale_logo,
  });

  ///
  /// Device API
  ///
  @Post(path: '/devices/{username}/{deviceid}.json')
  Future<Response> updateDeviceData(
    @Path() String username,
    @Path() String deviceid,
    @Body() body,
  );

  @Get(path: '/devices/{username}.json')
  Future<Response> listDevices(@Path() String username);

  @Get(path: '/updates/{username}/{deviceid}.json')
  Future<Response> deviceUpdates(
    @Path() String username,
    @Path() String deviceid,
    @Query() int since,
    @Query() bool include_actions,
  );

  ///
  /// Subscription API
  ///
  @Get(path: '/subscriptions/{username}/{devideid}.json')
  Future<Response> getSubscriptionUpdate(
    @Path() String username,
    @Path() String deviceid,
    @Query() int since,
  );

  @Post(path: '/subscriptions/{username}/{deviceid}/.json')
  Future<Response> postSubscriptionUpdate(
    @Path() String username,
    @Path() String devideid,
    @Body() body,
  );


}
