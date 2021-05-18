part of 'currency_exchange_bloc.dart';

abstract class CurrencyExchangeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurrencyExchangeDataEvent extends CurrencyExchangeEvent {
  CurrencyExchangeDataEvent({
    required this.polishValue,
    required this.currency,
  });

  final double polishValue;
  final Currency currency;

  @override
  List<Object?> get props => [polishValue, currency];
}
