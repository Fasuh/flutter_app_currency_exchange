import 'package:dartz/dartz.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency_exchange.dart';
import 'package:flutter_app_zal/features/currency/domain/use_cases/calculate_currency_use_case.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, CurrencyExchange>> calculateCurrency(CalculateCurrencyParam param);
}