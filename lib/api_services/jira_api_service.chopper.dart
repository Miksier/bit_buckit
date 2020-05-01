// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jira_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$JiraApiService extends JiraApiService {
  _$JiraApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = JiraApiService;

  Future<Response> getPullRequestIssues(
      String projectKey, String repositorySlug, String pullRequestId,
      {int limit = 25, int start = 0}) {
    final $url =
        '/rest/jira/latest/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/issues';
    final Map<String, dynamic> $params = {'limit': limit, 'start': start};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
