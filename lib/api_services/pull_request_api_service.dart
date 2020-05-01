import "dart:async";
import 'package:chopper/chopper.dart';

part "pull_request_api_service.chopper.dart";

@ChopperApi(baseUrl: "/rest/api/1.0/projects")
abstract class PullRequestApiService extends ChopperService {
  static PullRequestApiService create([ChopperClient client]) =>
      _$PullRequestApiService(client);

  @Get(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/comments')
  Future<Response> getComments(@Path() String projectKey,
      @Path() String repositorySlug, @Path() String pullRequestId,
      {@Query("limit") int limit = 25, @Query("start") int start = 0});

  @Post(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/comments')
  Future<Response> addComment(
      @Path() String projectKey,
      @Path() String repositorySlug,
      @Path() String pullRequestId,
      @Body() String commentBody);

  @Get(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/comments/{commentId}')
  Future<Response> getComment(
      @Path() String projectKey,
      @Path() String repositorySlug,
      @Path() String pullRequestId,
      @Path() String commentId);

  // @Put(
  //     path:
  //         '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/comments/{commentId}?version')
  // Future<Response> editComment(
  //     @Path() String projectKey,
  //     @Path() String repositorySlug,
  //     @Path() String pullRequestId,
  //     @Path() String commentId,
  //     @Body() commentBody);

  // @Delete(
  //     path:
  //         '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/comments/{commentId}?version')
  // Future<Response> removeComment(
  //     @Path() String projectKey,
  //     @Path() String repositorySlug,
  //     @Path() String pullRequestId,
  //     @Path() String commentId,
  //     @Body() commentBody);

  @Get(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/tasks')
  Future<Response> getTasks(@Path() String projectKey,
      @Path() String repositorySlug, @Path() String pullRequestId,
      {@Query("limit") int limit = 25, @Query("start") int start = 0});

      @Get(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/participants')
  Future<Response> getParticipants(@Path() String projectKey,
      @Path() String repositorySlug, @Path() String pullRequestId,
      {@Query("limit") int limit = 25, @Query("start") int start = 0});

  @Get(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/tasks/count')
  Future<Response> getTasksCount(@Path() String projectKey,
      @Path() String repositorySlug, @Path() String pullRequestId);

  @Post(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/participants')
  Future<Response> addParticipant(
      @Path() String projectKey,
      @Path() String repositorySlug,
      @Path() String pullRequestId,
      @Body() String content);

  @Get(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/activities')
  Future<Response> getActivities(@Path() String projectKey,
      @Path() String repositorySlug, @Path() String pullRequestId,
      {@Query("limit") int limit = 25, @Query("start") int start = 0,
      @Query("avatarSize") int avatarSize = 64});

  @Post(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/approve')
  Future<Response> approve(@Path() String projectKey,
      @Path() String repositorySlug, @Path() String pullRequestId);

  @Get(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}?avatarSize=64')
  Future<Response> getPullRequest(@Path() String projectKey,
      @Path() String repositorySlug, @Path() String pullRequestId);

  @Delete(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/approve')
  Future<Response> removeApprove(@Path() String projectKey,
      @Path() String repositorySlug, @Path() String pullRequestId);

  @Delete(
      path:
          '/{projectKey}/repos/{repositorySlug}/pull-requests/{pullRequestId}/participants/{userSlug}')
  Future<Response> removeParticipant(
      @Path() String projectKey,
      @Path() String repositorySlug,
      @Path() String pullRequestId,
      @Path() String userSlug);
}
