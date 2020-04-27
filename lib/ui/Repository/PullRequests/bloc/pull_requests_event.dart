part of 'pull_requests_bloc.dart';

abstract class PullRequestsEvent extends Equatable {
  const PullRequestsEvent();
}
class LoadPullRequests extends PullRequestsEvent {
  final String projectKey;
  final String repositorySlug;

  const LoadPullRequests({
    this.projectKey,
    this.repositorySlug
  });

  @override
  List<Object> get props => [projectKey, repositorySlug];
}