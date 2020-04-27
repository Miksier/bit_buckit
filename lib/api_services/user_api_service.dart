import "dart:async";
import 'package:chopper/chopper.dart';

part "user_api_service.chopper.dart";

@ChopperApi(
  baseUrl: "/plugins/servlet/applinks/whoami",
)
abstract class UserApiService extends ChopperService {
  static UserApiService create([ChopperClient client]) => _$UserApiService(client);

  @Get()
  Future<Response> getUser();
}
