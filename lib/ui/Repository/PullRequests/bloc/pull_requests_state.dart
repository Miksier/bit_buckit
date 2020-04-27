part of 'pull_requests_bloc.dart';

abstract class PullRequestsState extends Equatable {
  const PullRequestsState();
}

class PullRequestsInitial extends PullRequestsState {
  @override
  List<Object> get props => [];
}
