part of 'repository_bloc.dart';

abstract class RepositoryEvent extends Equatable {
  const RepositoryEvent();
}

class LoadPullRequest extends RepositoryEvent {
  final String projectKey;
  final String repositorySlug;

  const LoadPullRequest({
    this.projectKey,
    this.repositorySlug
  });

  @override
  List<Object> get props => [projectKey, repositorySlug];
}

