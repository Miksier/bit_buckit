// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ProjectsApiService extends ProjectsApiService {
  _$ProjectsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ProjectsApiService;

  Future<Response> getProjects(
      {int limit = 25, int start = 0, int avatarSize = 64}) {
    final $url = '/rest/api/1.0/projects';
    final Map<String, dynamic> $params = {
      'limit': limit,
      'start': start,
      'avatarSize': avatarSize
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
