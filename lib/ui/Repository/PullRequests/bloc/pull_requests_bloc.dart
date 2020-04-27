import 'package:bucqit/services/pull_request_service.dart';
import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:equatable/equatable.dart';

part 'pull_requests_event.dart';
part 'pull_requests_state.dart';

class PullRequestsBloc extends BaseBloc<PullRequestsEvent> {
  PullRequestService _service;

  PullRequestsBloc(PullRequestService service) : super() {
    _service = service;
  }

  @override
  internalMapEventToState(PullRequestsEvent event) async* {
    if (event is LoadPullRequests && !hasReachedMax(state)) {
      yield* fetchMore(({limit, start}) => _service.getPullRequests(event.projectKey, event.repositorySlug, limit, start));
    }
  }
}