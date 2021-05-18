part of 'any_changeable_button_bloc.dart';

abstract class AnyChangeableButtonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialAnyChangeableButtonState extends AnyChangeableButtonState {}

class ProgressAnyChangeableButtonState extends AnyChangeableButtonState {}

class SuccessAnyChangeableButtonState<T> extends AnyChangeableButtonState {
  final T? value;

  SuccessAnyChangeableButtonState({this.value});

  @override
  List<Object?> get props => [value];
}

class ErrorAnyChangeableButtonState extends AnyChangeableButtonState {
  final Failure failure;

  ErrorAnyChangeableButtonState(this.failure);
}
