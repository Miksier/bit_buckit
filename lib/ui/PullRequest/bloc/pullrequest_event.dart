part of 'pullrequest_bloc.dart';

abstract class PullRequestEvent extends Equatable {
  const PullRequestEvent();
}

class LoadActivitiesPullRequest extends PullRequestEvent {
  const LoadActivitiesPullRequest();

  @override
  List<Object> get props => [];
}

class LoadDataPullRequest extends PullRequestEvent {
  const LoadDataPullRequest();

  @override
  List<Object> get props => [];
}

class ApprovePullRequest extends PullRequestEvent {
  const ApprovePullRequest();

  @override
  List<Object> get props => [];
}

class RemoveApprovePullRequest extends PullRequestEvent {
  const RemoveApprovePullRequest();

  @override
  List<Object> get props => [];
}

class AddReviewerPullRequest extends PullRequestEvent {
  const AddReviewerPullRequest();

  @override
  List<Object> get props => [];
}

class RemoveReviewerPullRequest extends PullRequestEvent {
  const RemoveReviewerPullRequest();

  @override
  List<Object> get props => [];
}

class AddComment extends PullRequestEvent {
  final String message;
  final ParentDTO parent;
  final CommentAnchorDTO anchor;

  const AddComment({
    this.message,
    this.parent,
    this.anchor,
  });

  @override
  List<Object> get props => [message, parent, anchor];
}
