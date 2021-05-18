part of 'any_changeable_button_bloc.dart';

abstract class AnyChangeableButtonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DefaultAnyChangeableButtonEvent extends AnyChangeableButtonEvent {}

class CustomAnyChangeableEvent extends AnyChangeableButtonEvent {}

class ResetChangeableButtonEvent extends AnyChangeableButtonEvent {}
