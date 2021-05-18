part of 'any_fetch_bloc.dart';

abstract class AnyFetchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialAnyFetchState extends AnyFetchState {}

class LoadingAnyFetchState extends AnyFetchState {}

class DataAnyFetchState<T> extends AnyFetchState {
  DataAnyFetchState({required this.data}) : assert(data != null);

  final T data;

  @override
  List<Object?> get props => [data];
}

class ErrorAnyFetchState extends AnyFetchState {
  ErrorAnyFetchState({required this.error}) : assert(error != null);

  final Failure error;

  @override
  List<Object?> get props => [error];
}
