// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_request_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PullRequestApiService extends PullRequestApiService {
  _$PullRequestApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PullRequestApiService;

  Future<Response> getComments(
      String projectKey, String repositorySlug, String pullRequestId,
      {int limit = 25, int start = 0}) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/comments';
    final Map<String, dynamic> $params = {'limit': limit, 'start': start};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> addComment(String projectKey, String repositorySlug,
      String pullRequestId, String commentBody) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/comments';
    final $body = commentBody;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getComment(String projectKey, String repositorySlug,
      String pullRequestId, String commentId) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/comments/${commentId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getTasks(
      String projectKey, String repositorySlug, String pullRequestId,
      {int limit = 25, int start = 0}) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/tasks';
    final Map<String, dynamic> $params = {'limit': limit, 'start': start};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getTasksCount(
      String projectKey, String repositorySlug, String pullRequestId) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/tasks/count';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getParticipants(
      String projectKey, String repositorySlug, String pullRequestId,
      {int limit = 25, int start = 0}) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/participants';
    final Map<String, dynamic> $params = {'limit': limit, 'start': start};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> addParticipant(String projectKey, String repositorySlug,
      String pullRequestId, String content) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/participants';
    final $body = content;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> removeParticipant(String projectKey, String repositorySlug,
      String pullRequestId, String userSlug) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/participants/${userSlug}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getActivities(
      String projectKey, String repositorySlug, String pullRequestId,
      {int limit = 25, int start = 0, int avatarSize = 64}) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/activities';
    final Map<String, dynamic> $params = {
      'limit': limit,
      'start': start,
      'avatarSize': avatarSize
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getCommits(
      String projectKey, String repositorySlug, String pullRequestId,
      {int limit = 25, int start = 0}) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/commits';
    final Map<String, dynamic> $params = {'limit': limit, 'start': start};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> approve(
      String projectKey, String repositorySlug, String pullRequestId) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/approve';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> removeApprove(
      String projectKey, String repositorySlug, String pullRequestId) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}/approve';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getPullRequest(
      String projectKey, String repositorySlug, String pullRequestId) {
    final $url =
        '/rest/api/1.0/projects/${projectKey}/repos/${repositorySlug}/pull-requests/${pullRequestId}?avatarSize=64';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
