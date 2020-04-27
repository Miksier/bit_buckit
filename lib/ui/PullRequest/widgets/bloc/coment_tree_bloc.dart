import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'coment_tree_event.dart';
part 'coment_tree_state.dart';

class ComentTreeBloc extends Bloc<ComentTreeEvent, ComentTreeState> {
  @override
  ComentTreeState get initialState => ComentTreeInitial();

  @override
  Stream<ComentTreeState> mapEventToState(
    ComentTreeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
