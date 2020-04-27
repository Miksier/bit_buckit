import 'dart:async';

import 'package:bucqit/services/repository_service.dart';
import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:equatable/equatable.dart';

part 'repositories_event.dart';
part 'repositories_state.dart';

class RepositoriesBloc extends BaseBloc<RepositoriesEvent> {
  final RepositoryService _service;

  RepositoriesBloc(this._service);

  @override
  Stream<BlocState> internalMapEventToState(
    RepositoriesEvent event,
  ) async* {
    if (event is LoadRepositories && !hasReachedMax(state)) {
      yield* fetchMore(({limit, start}) => _service
          .getRepositories(event.projectKey, limit: limit, start: start));
    }
  }
}
