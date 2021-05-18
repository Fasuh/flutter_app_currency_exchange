import 'package:equatable/equatable.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency_exchange.dart';
import 'package:flutter_app_zal/features/currency/domain/use_cases/calculate_currency_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_exchange_event.dart';

part 'currency_exchange_state.dart';

class CurrencyExchangeBloc extends Bloc<CurrencyExchangeEvent, CurrencyExchangeState> {
  CurrencyExchangeBloc({required this.calculateCurrencyUseCase}) : super(CurrencyExchangeInitialState());

  final CalculateCurrencyUseCase calculateCurrencyUseCase;

  @override
  Stream<CurrencyExchangeState> mapEventToState(CurrencyExchangeEvent event) async* {
    if (event is CurrencyExchangeDataEvent) {
      yield* _mapCurrencyExchange(event);
    }
  }

  Stream<CurrencyExchangeState> _mapCurrencyExchange(CurrencyExchangeDataEvent event) async* {
    yield CurrencyExchangeLoadingState();
    final result = await calculateCurrencyUseCase(CalculateCurrencyParam(
      polishValue: event.polishValue,
      currency: event.currency,
    ));
    yield* result.fold((failure) async* {
      yield CurrencyExchangeErrorState(failure: failure);
    }, (data) async* {
      yield CurrencyExchangeDataState(currencyExchange: data);
    });
  }
}
