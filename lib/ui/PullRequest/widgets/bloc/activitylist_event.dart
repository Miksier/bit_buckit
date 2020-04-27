part of 'activitylist_bloc.dart';

abstract class ActivitylistEvent extends Equatable {
  const ActivitylistEvent();
}

class LoadActivities extends ActivitylistEvent {
  const LoadActivities();

  @override
  List<Object> get props => [];
}
