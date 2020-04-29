part of 'activitylist_bloc.dart';

abstract class ActivitylistEvent extends Equatable {
  const ActivitylistEvent();
}

class LoadActivities extends ActivitylistEvent {
  const LoadActivities();

  @override
  List<Object> get props => [];
}

class ReloadActivities extends ActivitylistEvent {
  const ReloadActivities();

  @override
  List<Object> get props => [];
}

class AddComment extends ActivitylistEvent {
  final String message;
  final ParentDTO parent;
  final CommentAnchorDTO anchor;

  const AddComment({
    this.message,
    this.parent,
    this.anchor,
  });

  @override
  List<Object> get props => [message, parent, anchor];
}
