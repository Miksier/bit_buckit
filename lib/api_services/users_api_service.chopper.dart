// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$UsersApiService extends UsersApiService {
  _$UsersApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = UsersApiService;

  Future<Response> getUser(String userSlug) {
    final $url = '/rest/api/1.0/users/${userSlug}?avatarSize=64';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
