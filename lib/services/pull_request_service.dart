import 'package:bucqit/api_services/pull_request_api_service.dart';
import 'package:bucqit/api_services/pull_requests_api_service.dart';
import 'package:bucqit/models/pullRequestActionDTO.dart';
import 'package:bucqit/models/pull_requestDTO.dart';
import 'package:bucqit/models/responseDTO.dart';
import 'package:bucqit/models/taskDTO.dart';
import 'package:bucqit/utils/convert_utils.dart';

class PullRequestService {
  final PullRequestsApiService _pullRequestsService;
  final PullRequestApiService _pullRequestService;

  PullRequestService(this._pullRequestService, this._pullRequestsService);

  Future<ResponseDTO> getPullRequests(
      String projectKey, String repositorylug, int limit, int start) async {
    try {
      return ConvertUtil.pagedRequest<PullRequestDTO>(
          _pullRequestsService.getPullRequests(projectKey, repositorylug,
              limit: limit, start: start),
          () => PullRequestDTO());
    } catch (e) {
      print(e);
      return ResponseDTO();
    }
  }

  Future<PullRequestDTO> getPullRequestData(
      String projectKey, String repositorylug, String pullRequestId) async {
    try {
      return ConvertUtil.request<PullRequestDTO>(
          _pullRequestService.getPullRequest(
              projectKey, repositorylug, pullRequestId),
          () => PullRequestDTO());
    } catch (e) {
      print(e);
      return PullRequestDTO();
    }
  }

  Future<ResponseDTO> getActivities(String projectKey, String repositorylug,
      String pullRequestId, int limit, int start) async {
    try {
      return ConvertUtil.pagedRequest<PullRequestActionDTO>(
          _pullRequestService.getActivities(
              projectKey, repositorylug, pullRequestId,
              limit: limit, start: start),
          () => PullRequestActionDTO());
    } catch (e) {
      print(e);
      return ResponseDTO();
    }
  }
  Future<ResponseDTO> getTasks(String projectKey, String repositorylug,
      String pullRequestId) async {
    try {
      return ConvertUtil.pagedRequest<TaskDTO>(
          _pullRequestService.getTasks(
              projectKey, repositorylug, pullRequestId,
              limit: 100, start: 0),
          () => TaskDTO());
    } catch (e) {
      print(e);
      return ResponseDTO();
    }
  }
  // Future<ResponseDTO> getTasksCount(String projectKey, String repositorylug,
  //     String pullRequestId, int limit, int start) async {
  //   try {
  //     return ConvertUtil.request(request, () => null)<PullRequestActionDTO>(
  //         _pullRequestService.getTask(
  //             projectKey, repositorylug, pullRequestId,
  //             limit: limit, start: start),
  //         () => PullRequestActionDTO());
  //   } catch (e) {
  //     print(e);
  //     return ResponseDTO();
  //   }
  //}
}
