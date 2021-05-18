import 'package:dio/dio.dart';
import 'package:flutter_app_zal/features/currency/data/model/currency_exchange.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency_exchange.dart';
import 'package:flutter_app_zal/features/currency/domain/use_cases/calculate_currency_use_case.dart';

abstract class CurrencyDataSource {
  Future<CurrencyExchange> getCurrencyValue(CalculateCurrencyParam param);
}

class CurrencyDataSourceImpl extends CurrencyDataSource {
  CurrencyDataSourceImpl({required this.source});

  final Dio source;

  @override
  Future<CurrencyExchange> getCurrencyValue(CalculateCurrencyParam param) async {
    final result = await source.get('exchangerates/rates/a/${param.currency.name}?format=json');
    final rate = result.data['rates'].first['mid'];
    return CurrencyExchangeModel(
      otherCurrency: param.currency,
      otherCurrencyRate: rate,
      polishValue: param.polishValue,
    );
  }
}
