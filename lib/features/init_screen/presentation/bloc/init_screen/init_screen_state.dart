part of 'init_screen_bloc.dart';

abstract class InitScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitScreenNotInitializedState extends InitScreenState {}

class InitScreenErrorState extends InitScreenState {
  InitScreenErrorState({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class InitScreenDataState extends InitScreenState {
  InitScreenDataState({required this.wasShownAlready});

  final bool wasShownAlready;
  
  @override
  List<Object?> get props => [wasShownAlready];
}
