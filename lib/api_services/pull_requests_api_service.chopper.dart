// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_requests_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PullRequestsApiService extends PullRequestsApiService {
  _$PullRequestsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PullRequestsApiService;

  Future<Response> getPullRequests(String projectKey, String repositorySlug,
      {int limit = 25, int start = 0, int avatarSize = 64}) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests';
    final Map<String, dynamic> $params = {
      'limit': limit,
      'start': start,
      'avatarSize': avatarSize
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
