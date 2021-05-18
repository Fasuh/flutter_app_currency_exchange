part of 'stream_list_bloc.dart';

abstract class StreamListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializeStreamListEvent extends StreamListEvent {}

class AddElementStreamListEvent<T> extends StreamListEvent {
  AddElementStreamListEvent({required this.data}) : assert(data != null);

  final T data;

  @override
  List<Object?> get props => [data];
}