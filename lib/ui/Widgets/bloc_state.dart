import 'package:equatable/equatable.dart';

abstract class BlocState extends Equatable {
  const BlocState();
}

class BlocInitialState extends BlocState {
  @override
  List<Object> get props => [];
}

class BlocLoadingState extends BlocState {
  @override
  List<Object> get props => [];
}

class BlocLoadedState<T> extends BlocState {
  final T data;
  final bool hasReachedMax;

  const BlocLoadedState({this.data,this.hasReachedMax});

  @override
  List<Object> get props => [data];

  BlocLoadedState copyWith({
    T data,
    bool hasReachedMax,
  }) {
    return BlocLoadedState(
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class BlocErrorState extends BlocState {
  final int errorCode;
  final String errorMessage;

  const BlocErrorState({this.errorCode, this.errorMessage});

  @override
  List<Object> get props => [];
}
