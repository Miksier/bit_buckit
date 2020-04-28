import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activity_comment_event.dart';
part 'activity_comment_state.dart';

class ActivityCommentBloc extends Bloc<ActivityCommentEvent, ActivityCommentState> {
  @override
  ActivityCommentState get initialState => ActivityCommentInitial();

  @override
  Stream<ActivityCommentState> mapEventToState(
    ActivityCommentEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
