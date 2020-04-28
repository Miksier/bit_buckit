import 'package:bucqit/db/credentials.dart';
import 'package:bucqit/db/credentials_box.dart';
import 'package:bucqit/models/ParentDTO.dart';
import 'package:bucqit/models/commentAnchorDTO.dart';
import 'package:bucqit/models/commentDTO.dart';
import 'package:bucqit/models/pull_requestDTO.dart';
import 'package:bucqit/models/taskDTO.dart';
import 'package:bucqit/models/ui/pr_ownership.dart';
import 'package:bucqit/models/ui/pr_state.dart';
import 'package:bucqit/models/ui/pull_request_model.dart';
import 'package:bucqit/services/pull_request_service.dart';
import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'pullrequest_event.dart';
part 'pullrequest_state.dart';

class PullRequestBloc extends BaseBloc<PullRequestEvent> {
  PullRequestService _service;
  Box<Credentials> _credentialsBox;

  String _repositorySlug;
  String _projectKey;
  String _pullRequestId;

  PullRequestBloc(CredentialsBox credentialsBox, PullRequestService service,
      String projectKey, String repositorySlug, String pullRequestId)
      : super() {
    _projectKey = projectKey;
    _repositorySlug = repositorySlug;
    _pullRequestId = pullRequestId;
    _credentialsBox = credentialsBox.box;
    _service = service;
  }

  @override
  internalMapEventToState(PullRequestEvent event) async* {
    if (event is LoadDataPullRequest) {
      yield await loadPullRequestData();
    } else if (event is ApprovePullRequest) {
      yield await approvePullRequest();
    } else if (event is RemoveApprovePullRequest) {
      yield await removeApprove();
    } else if (event is AddReviewerPullRequest) {
      yield await addReviewer();
    } else if (event is RemoveReviewerPullRequest) {
      yield await removeReviewer();
    } else if (event is AddComment) {
      final comment = CommentDTO(
          text: event.message, anchorDTO: event.anchor, parent: event.parent);
      yield await addComment(comment);
    }
  }

  PullRequestModel buildModel(
    PullRequestDTO content,
    List<TaskDTO> tasks,
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
      PullRequestModel model = PullRequestModel();
      model = buildModel(content, tasks.values);
      return BlocLoadedState(data: model);
    } catch (e) {
      return BlocErrorState(errorMessage: e.toString());
    }
  }

  removeApprove() async {
    // await chopperClient.handleReponse(
    //     _service.removeApprove(_projectKey, _repositorySlug, _pullRequestId),
    //     () => PullRequestActionDTO());
    // return BlocLoadedState();
  }

  approvePullRequest() async {
    // await chopperClient.handleReponse(
    //     _service.approve(_projectKey, _repositorySlug, _pullRequestId),
    //     () => PullRequestActionDTO());

    // return BlocLoadedState();
  }

  addReviewer() async {
    // var user = _credentialsBox.values.first;
    // try {
    //   var content =
    //       """{"user": {"name": "${user.userName}"},"role": "REVIEWER"}""";
    //   await chopperClient.handleReponse(
    //       _service.addParticipant(
    //           _projectKey, _repositorySlug, _pullRequestId, content),
    //       () => ReviewerDTO(),
    //       pagedRequest: false);
    //   return BlocLoadedState();
    // } catch (e) {
    //   return BlocErrorState(errorMessage: e.toString());
    // }
  }

  removeReviewer() async {
    // var user = _credentialsBox.values.first;
    // try {
    //   await _service.removeParticipant(
    //       _projectKey, _repositorySlug, _pullRequestId, user.userName);
    //   return BlocLoadedState();
    // } catch (e) {
    //   return BlocErrorState(errorMessage: e.toString());
    // }
  }

  Future addComment(CommentDTO comment) async {
    await _service.postComment(_projectKey, _repositorySlug, _pullRequestId, comment);
  }
}
