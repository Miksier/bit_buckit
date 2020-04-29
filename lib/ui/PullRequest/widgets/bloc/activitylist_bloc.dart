import 'package:bucqit/models/ParentDTO.dart';
import 'package:bucqit/models/commentAnchorDTO.dart';
import 'package:bucqit/models/commentDTO.dart';
import 'package:bucqit/services/pull_request_service.dart';
import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:equatable/equatable.dart';

part 'activitylist_event.dart';
part 'activitylist_state.dart';

class ActivitylistBloc extends BaseBloc<ActivitylistEvent> {
  final PullRequestService _service;

  final String _repositorySlug;
  final String _projectId;
  final String _pullRequestId;

  ActivitylistBloc(
    this._service,
    this._projectId,
    this._repositorySlug,
    this._pullRequestId,
  ) : super();

  @override
  Stream<BlocState> internalMapEventToState(ActivitylistEvent event) async* {
    if (event is LoadActivities && !hasReachedMax(state)) {
      yield* fetchMore(({limit, start}) => _service.getActivities(
          _projectId, _repositorySlug, _pullRequestId, limit, start));
    } else if (event is ReloadActivities) {
      yield BlocLoadingState();
      final data = await _service.getActivities(
          _projectId, _repositorySlug, _pullRequestId, 20, 0);
      yield BlocLoadedState(data: data.values, hasReachedMax: data.isLastPage);
    } else if (event is AddComment) {
      final currentState = state as BlocLoadedState;
      yield BlocLoadingState();
      await addComment(CommentDTO(text: event.message, parent: event.parent));
      yield BlocLoadedState(data: currentState.data);
    }
  }

  Future addComment(CommentDTO comment) async {
    await _service.postComment(
        _projectId, _repositorySlug, _pullRequestId, comment);
  }
}
