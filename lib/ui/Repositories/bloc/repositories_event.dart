part of 'repositories_bloc.dart';

abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();
}
class LoadRepositories extends RepositoriesEvent {
  final String projectKey;

  const LoadRepositories({
    this.projectKey,
  });

  @override
  List<Object> get props => [projectKey];
}
