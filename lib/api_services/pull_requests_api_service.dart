import "dart:async";
import 'package:chopper/chopper.dart';

part "pull_requests_api_service.chopper.dart";

@ChopperApi(baseUrl: "/rest/api/1.0/projects")
abstract class PullRequestsApiService extends ChopperService {
  static PullRequestsApiService create([ChopperClient client]) =>
      _$PullRequestsApiService(client);

  @Get(path: '/{projectKey}/repos/{repositorySlug}/pull-requests')
  Future<Response> getPullRequests(
      @Path() String projectKey, @Path() String repositorySlug,
      {@Query("limit") int limit = 25,
      @Query("start") int start = 0,
      @Query("avatarSize") int avatarSize = 64});
}
