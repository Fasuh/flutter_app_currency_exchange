part of 'currency_exchange_bloc.dart';

abstract class CurrencyExchangeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurrencyExchangeInitialState extends CurrencyExchangeState {}

class CurrencyExchangeLoadingState extends CurrencyExchangeState {}

class CurrencyExchangeErrorState extends CurrencyExchangeState {
  CurrencyExchangeErrorState({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class CurrencyExchangeDataState extends CurrencyExchangeState {
  CurrencyExchangeDataState({required this.currencyExchange});

  final CurrencyExchange currencyExchange;

  @override
  List<Object?> get props => [currencyExchange];
}
