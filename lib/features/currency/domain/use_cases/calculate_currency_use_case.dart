import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/core/usecase/usecase.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency_exchange.dart';
import '../repositories/currency_repository.dart';

class CalculateCurrencyUseCase extends UseCase<CurrencyExchange, CalculateCurrencyParam> {
  CalculateCurrencyUseCase({required this.repository});

  final CurrencyRepository repository;

  @override
  Future<Either<Failure, CurrencyExchange>> call(CalculateCurrencyParam param) {
    return repository.calculateCurrency(param);
  }
}

class CalculateCurrencyParam extends Equatable {
  final double polishValue;
  final Currency currency;

  CalculateCurrencyParam({
    required this.polishValue,
    required this.currency,
  });

  @override
  List<Object?> get props => [polishValue, currency];
}
