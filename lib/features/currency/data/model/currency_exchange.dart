import 'package:flutter_app_zal/features/currency/domain/entities/currency.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency_exchange.dart';

class CurrencyExchangeModel extends CurrencyExchange {
  final Currency otherCurrency;
  final double polishValue;
  final double otherCurrencyRate;

  double get otherValue {
    return polishValue * otherCurrencyRate;
  }

  CurrencyExchangeModel({
    required this.otherCurrency,
    required this.otherCurrencyRate,
    required this.polishValue,
  });

  List<Object?> get props => [
        otherCurrency,
        otherCurrencyRate,
        polishValue,
      ];
}
