import 'package:equatable/equatable.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency.dart';

abstract class CurrencyExchange extends Equatable {
  double get polishValue;

  double get otherValue;

  Currency get otherCurrency;
}
