import 'package:bucqit/services/project_service.dart';
import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:equatable/equatable.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends BaseBloc<ProjectsEvent> {
  final ProjectService _service;
  
  ProjectsBloc(this._service) : super();

  @override
  Stream<BlocState> internalMapEventToState(ProjectsEvent event) async* {
    if (event is LoadProjects && !hasReachedMax(state)) {
      yield* fetchMore(({limit, start}) => _service.getProjects(limit, start));
    }
  }
}
