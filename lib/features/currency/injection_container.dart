import 'package:flutter_app_zal/features/currency/presentation/bloc/currency_exchange/currency_exchange_bloc.dart';
import 'package:flutter_app_zal/injection_container.dart';

import 'data/data_sources/currency_data_source.dart';
import 'data/repositories/currency_repository_impl.dart';
import 'domain/repositories/currency_repository.dart';
import 'domain/use_cases/calculate_currency_use_case.dart';

mixin CurrencyInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    // blocs
    sl.registerFactory(() => CurrencyExchangeBloc(calculateCurrencyUseCase: sl()));

    // use cases
    sl.registerLazySingleton(() => CalculateCurrencyUseCase(repository: sl()));

    // repositories
    sl.registerLazySingleton<CurrencyRepository>(() => CurrencyRepositoryImpl(dataSource: sl()));

    // data sources
    sl.registerLazySingleton<CurrencyDataSource>(() => CurrencyDataSourceImpl(source: sl(instanceName: globalDio)));
  }
}
