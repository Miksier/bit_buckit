import 'package:bucqit/api_services/jira_api_service.dart';
import 'package:bucqit/db/credentials.dart';
import 'package:bucqit/db/credentials_box.dart';
import 'package:bucqit/models/ParentDTO.dart';
import 'package:bucqit/models/commentAnchorDTO.dart';
import 'package:bucqit/models/commentDTO.dart';
import 'package:bucqit/models/issueDTO.dart';
import 'package:bucqit/models/pull_requestDTO.dart';
import 'package:bucqit/models/reviewerDTO.dart';
import 'package:bucqit/models/taskDTO.dart';
import 'package:bucqit/models/ui/pr_ownership.dart';
import 'package:bucqit/models/ui/pr_state.dart';
import 'package:bucqit/models/ui/pull_request_model.dart';
import 'package:bucqit/models/userDTO.dart';
import 'package:bucqit/services/jira_service.dart';
import 'package:bucqit/services/pull_request_service.dart';
import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'pullrequest_event.dart';
part 'pullrequest_state.dart';

class PullRequestBloc extends BaseBloc<PullRequestEvent> {
  PullRequestService _service;
  JiraService _jiraService;
  Box<Credentials> _credentialsBox;

  String _repositorySlug;
  String _projectKey;
  String _pullRequestId;

  PullRequestBloc(
      CredentialsBox credentialsBox,
      PullRequestService service,
      JiraService jiraService,
      String projectKey,
      String repositorySlug,
      String pullRequestId)
      : super() {
    _jiraService = jiraService;
    _projectKey = projectKey;
    _repositorySlug = repositorySlug;
    _pullRequestId = pullRequestId;
    _credentialsBox = credentialsBox.box;
    _service = service;
  }

  @override
  internalMapEventToState(PullRequestEvent event) async* {
    if (state is BlocLoadedState) {
      var currentState = state as BlocLoadedState;
    }

    if (event is LoadDataPullRequest) {
      yield BlocLoadingState();
      yield await loadPullRequestData();
    } else if (event is ApprovePullRequest) {
      var currentState = state as BlocLoadedState;
      yield BlocLoadingState();
      yield await approvePullRequest(currentState);
    } else if (event is RemoveApprovePullRequest) {
      var currentState = state as BlocLoadedState;
      yield BlocLoadingState();
      yield await removeApprove(currentState);
    } else if (event is AddReviewerPullRequest) {
      var currentState = state as BlocLoadedState;
      yield BlocLoadingState();
      yield await addReviewer(currentState);
    } else if (event is RemoveReviewerPullRequest) {
      var currentState = state as BlocLoadedState;
      yield BlocLoadingState();
      yield await removeReviewer(currentState);
    } else if (event is AddComment) {
      final comment = CommentDTO(
          text: event.message, anchorDTO: event.anchor, parent: event.parent);
      yield await addComment(comment);
    }
  }

  PullRequestModel buildModel(
    PullRequestDTO content,
    List<TaskDTO> tasks,
    List<IssueDTO> issues,
  ) {
    final model = PullRequestModel();
    final user = _credentialsBox.values.first;

    final isReviewer =
        content.reviewers.any((element) => element.user.name == user.userName);
    final isAuthor = content.author.user.name == user.userName;
    model.ownership = isReviewer
        ? PrOwnership.reviewer
        : isAuthor ? PrOwnership.author : PrOwnership.none;
    model.reviewers = content.reviewers;
    model.description = content.description;
    model.issues = issues;
    model.mergeState = content.properties?.mergeResult?.outcome == "CONFLICTED"
        ? PrMergeState.conflicted
        : PrMergeState.ok;
    model.tasks = tasks;
    model.activeTasks =
        tasks.where((element) => element.state == "OPEN").length;
    model.author = content.author;
    model.hasApproved = content.reviewers.firstWhere(
            (element) => element.user.name == user.userName, orElse: () {
          return null;
        })?.approved ??
        false;
    return model;
  }

  Future<BlocState> loadPullRequestData() async {
    try {
      final content = await _service.getPullRequestData(
          _projectKey, _repositorySlug, _pullRequestId);
      final tasksCount = await _service.getTasksCount(
          _projectKey, _repositorySlug, _pullRequestId);
      final tasks = await _service.getTasks(_projectKey, _repositorySlug,
          _pullRequestId, tasksCount.open + tasksCount.open, 0);
      final issues = await _jiraService.getIssues(
          _projectKey, _repositorySlug, _pullRequestId, 25, 0);

      PullRequestModel model = PullRequestModel();
      model = buildModel(content, tasks.values, issues);
      return BlocLoadedState(data: model);
    } catch (e) {
      return BlocErrorState(errorMessage: e.toString());
    }
  }

  Future<BlocState> removeApprove(BlocLoadedState currentState) async {
    await _service.removeApproval(_projectKey, _repositorySlug, _pullRequestId);
    var participans = await _service.getParticipants(
        _projectKey, _repositorySlug, _pullRequestId, 25, 0);
    var model = currentState.data as PullRequestModel;
    model.reviewers = participans.values;
    return BlocLoadedState(data: model);
  }

  Future<BlocState> approvePullRequest(BlocLoadedState currentState) async {
    await _service.approve(_projectKey, _repositorySlug, _pullRequestId);
    var participans = await _service.getParticipants(
        _projectKey, _repositorySlug, _pullRequestId, 25, 0);
    var model = currentState.data as PullRequestModel;
    model.reviewers = participans.values;
    return BlocLoadedState(data: model);
  }

  Future<BlocState> addReviewer(BlocLoadedState currentState) async {
    try {
      var user = _credentialsBox.values.first;
      var a = await _service.addReviewer(
          _projectKey,
          _repositorySlug,
          _pullRequestId,
          ReviewerDTO(user: UserDTO(name: user.userName), role: "REVIEWER"));
      var participans = await _service.getParticipants(
          _projectKey, _repositorySlug, _pullRequestId, 25, 0);
      var model = currentState.data as PullRequestModel;
      model.reviewers = participans.values;
      return BlocLoadedState(data: model);
    } catch (e) {
      print(e.message);
      return BlocErrorState(errorMessage: e.toString());
    }
  }

  Future<BlocState> removeReviewer(BlocLoadedState currentState) async {
    var user = _credentialsBox.values.first;
    try {
      await _service.removeReviewer(
          _projectKey, _repositorySlug, _pullRequestId, user.userName);
      var participans = await _service.getParticipants(
          _projectKey, _repositorySlug, _pullRequestId, 25, 0);
      var model = currentState.data as PullRequestModel;
      model.reviewers = participans.values;
      return BlocLoadedState(data: model);
    } catch (e) {
      return BlocErrorState(errorMessage: e.toString());
    }
  }

  Future addComment(CommentDTO comment) async {
    await _service.postComment(
        _projectKey, _repositorySlug, _pullRequestId, comment);
  }
}
