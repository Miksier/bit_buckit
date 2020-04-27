part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class LoadDashboard extends DashboardEvent {
  final String repositorySlug;
  final String projectId;

  const LoadDashboard({
    this.repositorySlug,
    this.projectId,
  });

  @override
  List<Object> get props => [repositorySlug, projectId ];
}
