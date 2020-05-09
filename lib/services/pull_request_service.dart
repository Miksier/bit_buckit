import 'dart:convert';

import 'package:bucqit/api_services/pull_request_api_service.dart';
import 'package:bucqit/api_services/pull_requests_api_service.dart';
import 'package:bucqit/models/commentDTO.dart';
import 'package:bucqit/models/pullRequestActionDTO.dart';
import 'package:bucqit/models/pull_requestDTO.dart';
import 'package:bucqit/models/responseDTO.dart';
import 'package:bucqit/models/reviewerDTO.dart';
import 'package:bucqit/models/taskCountDTO.dart';
import 'package:bucqit/models/taskDTO.dart';
import 'package:bucqit/utils/request_utils.dart';

class PullRequestService {
  final PullRequestsApiService _pullRequestsService;
  final PullRequestApiService _pullRequestService;

  PullRequestService(this._pullRequestService, this._pullRequestsService);

  Future<ResponseDTO> getPullRequests(
      String projectKey, String repositorylug, int limit, int start) async {
    try {
      return RequestUtils.pagedRequest<PullRequestDTO>(
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
      return RequestUtils.request<PullRequestDTO>(
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
      return RequestUtils.pagedRequest<PullRequestActionDTO>(
          _pullRequestService.getActivities(
              projectKey, repositorylug, pullRequestId,
              limit: limit, start: start),
          () => PullRequestActionDTO());
    } catch (e) {
      print(e);
      return ResponseDTO();
    }
  }

  Future<ResponseDTO> getParticipants(String projectKey, String repositorylug,
      String pullRequestId, int limit, int start) async {
    try {
      return RequestUtils.pagedRequest<ReviewerDTO>(
          _pullRequestService.getParticipants(
              projectKey, repositorylug, pullRequestId,
              limit: limit, start: start),
          () => ReviewerDTO());
    } catch (e) {
      print(e);
      return ResponseDTO();
    }
  }

  Future<ResponseDTO> getTasks(String projectKey, String repositorylug,
      String pullRequestId, int limit, int start) async {
    try {
      return RequestUtils.pagedRequest<TaskDTO>(
          _pullRequestService.getTasks(projectKey, repositorylug, pullRequestId,
              limit: limit, start: start),
          () => TaskDTO());
    } catch (e) {
      print(e);
      return ResponseDTO();
    }
  }

  Future<TaskCountDTO> getTasksCount(
      String projectKey, String repositorylug, String pullRequestId) async {
    try {
      return RequestUtils.request<TaskCountDTO>(
          _pullRequestService.getTasksCount(
              projectKey, repositorylug, pullRequestId),
          () => TaskCountDTO());
    } catch (e) {
      print(e);
      return TaskCountDTO();
    }
  }

  Future<CommentDTO> postComment(String projectKey, String repositorylug,
      String pullRequestId, CommentDTO comment) async {
    try {
      return RequestUtils.request<CommentDTO>(
          _pullRequestService.addComment(projectKey, repositorylug,
              pullRequestId, jsonEncode(comment.toJson())),
          () => CommentDTO());
    } catch (e) {
      print(e);
      return CommentDTO();
    }
  }

  Future<PullRequestActionDTO> approve(
      String projectKey, String repositorylug, String pullRequestId) async {
    try {
      return RequestUtils.request<PullRequestActionDTO>(
          _pullRequestService.approve(projectKey, repositorylug, pullRequestId),
          () => PullRequestActionDTO());
    } catch (e) {
      print(e);
      return PullRequestActionDTO();
    }
  }

  Future<PullRequestActionDTO> removeApproval(
      String projectKey, String repositorylug, String pullRequestId) async {
    try {
      return RequestUtils.request<PullRequestActionDTO>(
          _pullRequestService.removeApprove(projectKey, repositorylug, pullRequestId),
          () => PullRequestActionDTO());
    } catch (e) {
      print(e);
      return PullRequestActionDTO();
    }
  }

  Future<ReviewerDTO> addReviewer(String projectKey, String repositorylug,
      String pullRequestId, ReviewerDTO reviewer) async {
    try {
      return RequestUtils.request<ReviewerDTO>(
          _pullRequestService.addParticipant(
              projectKey, repositorylug, pullRequestId,jsonEncode(reviewer.toJson())),
          () => ReviewerDTO());
    } catch (e) {
      print(e);
      return ReviewerDTO();
    }
  }

   Future<ReviewerDTO> removeReviewer(String projectKey, String repositorylug,
      String pullRequestId, String userSlug) async {
    try {
      return RequestUtils.request<ReviewerDTO>(
          _pullRequestService.removeParticipant(
              projectKey, repositorylug, pullRequestId,userSlug),
          () => ReviewerDTO());
    } catch (e) {
      print(e);
      return ReviewerDTO();
    }
  }
}
