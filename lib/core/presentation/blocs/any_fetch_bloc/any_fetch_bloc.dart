import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_zal/core/error/failures.dart';

part 'any_fetch_event.dart';

part 'any_fetch_state.dart';

abstract class AnyFetchBloc<T> extends Bloc<AnyFetchEvent, AnyFetchState> {
  AnyFetchBloc({AnyFetchState? initialState}) : super(initialState ?? LoadingAnyFetchState());

  @override
  Stream<AnyFetchState> mapEventToState(AnyFetchEvent event) async* {
    if (event is DefaultAnyFetchEvent) {
      yield* _mapDefaultAnyFetchEvent(event);
    }
  }

  Stream<AnyFetchState> _mapDefaultAnyFetchEvent(DefaultAnyFetchEvent event) async* {
    yield LoadingAnyFetchState();
    final result = await fetchData(event);
    yield* result.fold((error) async* {
      yield ErrorAnyFetchState(error: error);
    }, (data) async* {
      yield DataAnyFetchState<T>(data: data);
    });
  }

  Future<Either<Failure, T>> fetchData(DefaultAnyFetchEvent event);
}
