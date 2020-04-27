import 'package:bucqit/api_services/chopper_client_service.dart';
import 'package:bucqit/models/responseDTO.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_state.dart';

abstract class BaseBloc<E> extends Bloc<E, BlocState> {
  BaseBloc();

  @override
  BlocState get initialState => BlocInitialState();

  @override
  Stream<BlocState> mapEventToState(E event) async* {
    try {
      //yield BlocLoadingState();
      yield* await internalMapEventToState(event);
    } catch (e) {
      yield BlocErrorState(errorMessage: e);
    }
  }

  Stream<BlocState> internalMapEventToState(E event) async* {
    yield const BlocErrorState(
        errorMessage: "internalMapEventToState not implemented");
  }

  bool hasReachedMax(BlocState state) =>
      state is BlocLoadedState && state.hasReachedMax;

  Stream<BlocState> fetchMore(Future<ResponseDTO> Function({int limit,int start}) request) async* {
    if (state is BlocInitialState) {
      yield BlocLoadingState();
      final response = await request(limit: 20,start: 0);
      yield BlocLoadedState(
          data: response.values, hasReachedMax: response.isLastPage);
    }
    if (state is BlocLoadedState) {
      final currentState = state as BlocLoadedState;
      final response = await request(
          limit: (currentState.data as List).length + 20,
          start: (currentState.data as List).length);
      yield response.values.isEmpty
          ? currentState.copyWith(hasReachedMax: true)
          : BlocLoadedState(
              data: currentState.data + response.values,
              hasReachedMax: response.isLastPage);
    }
  }
}
