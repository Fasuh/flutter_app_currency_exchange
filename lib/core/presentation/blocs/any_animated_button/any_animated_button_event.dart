part of 'any_animated_button_bloc.dart';

@immutable
abstract class AnyAnimatedButtonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TriggerAnyAnimatedButtonEvent<T> extends AnyAnimatedButtonEvent {
  final T object;

  TriggerAnyAnimatedButtonEvent(this.object);

  @override
  List<Object?> get props => [object];
}
