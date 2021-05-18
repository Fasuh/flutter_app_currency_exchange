import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_zal/core/error/failures.dart';

part 'any_changeable_button_event.dart';
part 'any_changeable_button_state.dart';
part 'manager/any_changeable_button_manager.dart';

abstract class AnyChangeableButtonBloc<T> extends Bloc<AnyChangeableButtonEvent, AnyChangeableButtonState> {
  ProgressAnyChangeableButtonState progress() => ProgressAnyChangeableButtonState();
  SuccessAnyChangeableButtonState success(T data) => SuccessAnyChangeableButtonState<T>(value: data);
  ErrorAnyChangeableButtonState failure(Failure error) => ErrorAnyChangeableButtonState(error);
  InitialAnyChangeableButtonState initial() => InitialAnyChangeableButtonState();

  AnyChangeableButtonBloc({AnyChangeableButtonState? initialState})
      : super(initialState ?? InitialAnyChangeableButtonState());

  @override
  Stream<AnyChangeableButtonState> mapEventToState(
    AnyChangeableButtonEvent event,
  ) async* {
    if (event is DefaultAnyChangeableButtonEvent) {
      yield* _mapAsyncAction(event);
    } else if (event is CustomAnyChangeableEvent) {
      yield* customEventHandler(event);
    } else if (event is ResetChangeableButtonEvent) {
      yield initial();
    }
  }

  Stream<AnyChangeableButtonState> _mapAsyncAction(DefaultAnyChangeableButtonEvent event) async* {
    yield progress();
    final result = await asyncAction(event);
    yield* result.fold((error) async* {
      yield failure(error);
    }, (r) async* {
      yield success(r);
    });
  }

  @mustCallSuper
  Stream<AnyChangeableButtonState> customEventHandler(CustomAnyChangeableEvent event) {
    throw UnimplementedError('this event is not implemented');
  }

  Future<Either<Failure, T>> asyncAction(AnyChangeableButtonEvent event) {
    throw UnimplementedError();
  }
}
