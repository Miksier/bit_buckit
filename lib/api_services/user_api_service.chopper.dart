// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$UserApiService extends UserApiService {
  _$UserApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = UserApiService;

  Future<Response> getUser() {
    final $url = '/plugins/servlet/applinks/whoami';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
