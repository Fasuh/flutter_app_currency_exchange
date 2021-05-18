part of 'init_screen_bloc.dart';

abstract class InitScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitScreenAppStartedEvent extends InitScreenEvent {}
