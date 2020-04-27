import "dart:async";
import 'package:chopper/chopper.dart';

part "users_api_service.chopper.dart";

@ChopperApi(baseUrl: "/rest/api/1.0/users")
abstract class UsersApiService extends ChopperService {
  static UsersApiService create([ChopperClient client]) => _$UsersApiService(client);

  @Get(path: '/{userSlug}?avatarSize=64')
  Future<Response> getUser(@Path() String userSlug);
}
