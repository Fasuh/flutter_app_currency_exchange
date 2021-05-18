part of 'any_list_bloc.dart';

abstract class AnyListEvent<Data, Search> extends Equatable {
  @override
  List<Object> get props => [];
}

class AnyListSearchEvent<Search> extends AnyListEvent {
  final Search search;

  AnyListSearchEvent(this.search);
  @override
  String toString() => 'AnyListSearchEvent';
}

class AnyListRefreshEvent extends AnyListEvent {
  @override
  String toString() => 'AnyListRefreshEvent';
}

class AnyListFetchNewPageEvent extends AnyListEvent {
  @override
  String toString() => 'AnyListFetchNewPageEvent';
}

class AnyListRetryEvent extends AnyListEvent {
  @override
  String toString() => 'AnyListRetryEvent';
}

class CleanAnyListEvent extends AnyListEvent {}
