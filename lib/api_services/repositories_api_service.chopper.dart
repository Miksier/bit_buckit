// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$RepositoriesApiService extends RepositoriesApiService {
  _$RepositoriesApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = RepositoriesApiService;

  Future<Response> getRepositories(String projectKey,
      {int limit = 25, int start = 0}) {
    final $url = '/rest/api/1.0/projects/${projectKey}/repos';
    final Map<String, dynamic> $params = {'limit': limit, 'start': start};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
