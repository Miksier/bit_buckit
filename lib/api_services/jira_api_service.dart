import "dart:async";
import 'package:chopper/chopper.dart';

part "jira_api_service.chopper.dart";

@ChopperApi(baseUrl: "/rest/jira")
abstract class JiraApiService extends ChopperService {
  static JiraApiService create([ChopperClient client]) =>
      _$JiraApiService(client);

   @Get(
      path:
          '/latest/projects/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/issues')
  Future<Response> getPullRequestIssues(@Path() String projectKey,
      @Path() String repositorySlug, @Path() String pullRequestId,
      {@Query("limit") int limit = 25, @Query("start") int start = 0});}
