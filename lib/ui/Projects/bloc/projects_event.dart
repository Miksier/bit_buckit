part of 'projects_bloc.dart';

abstract class ProjectsEvent extends Equatable {
  const ProjectsEvent();
}

class LoadProjects extends ProjectsEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoadProjectsEvent';
  const LoadProjects();
}
