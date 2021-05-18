part of 'any_animated_button_bloc.dart';

@immutable
abstract class AnyAnimatedButtonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DefaultAnyAnimatedButtonState extends AnyAnimatedButtonState {
  @override
  List<Object?> get props => [];
}

class ProgressAnyAnimatedButtonState extends AnyAnimatedButtonState {
  @override
  List<Object?> get props => [];
}

class ErrorAnyAnimatedButtonState extends AnyAnimatedButtonState {
  final Failure failure;

  ErrorAnyAnimatedButtonState(this.failure);

  @override
  List<Object?> get props => [failure];
}

class SuccessAnyAnimatedButtonState<G> extends AnyAnimatedButtonState {
  final G object;

  SuccessAnyAnimatedButtonState(this.object);

  @override
  List<Object?> get props => [object];
}
