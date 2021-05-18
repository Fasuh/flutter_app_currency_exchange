part of 'stream_list_bloc.dart';

abstract class StreamListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingStreamListState extends StreamListState {}

class DataStreamListState<T> extends StreamListState {
  DataStreamListState({required this.data});

  final List<T> data;

  @override
  List<Object?> get props => [data];
}

class ErrorStreamListState extends StreamListState {}
