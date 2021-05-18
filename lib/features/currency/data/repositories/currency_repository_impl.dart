import 'package:dartz/dartz.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/core/error/form_decoder.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency_exchange.dart';
import 'package:flutter_app_zal/features/currency/domain/repositories/currency_repository.dart';
import 'package:flutter_app_zal/features/currency/domain/use_cases/calculate_currency_use_case.dart';
import '../data_sources/currency_data_source.dart';

class CurrencyRepositoryImpl extends CurrencyRepository {
  CurrencyRepositoryImpl({required this.dataSource});

  final CurrencyDataSource dataSource;

  Future<Either<Failure, CurrencyExchange>> calculateCurrency(CalculateCurrencyParam param) async {
    try {
      final result = await dataSource.getCurrencyValue(param);
      return Right(result);
    } catch(error) {
      return Left(handleError(error, defaultFailure: DefaultCurrencyExchangeError()));
    }
  }
}
