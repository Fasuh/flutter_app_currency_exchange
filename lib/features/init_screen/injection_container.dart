import 'package:flutter_app_zal/features/init_screen/domain/use_cases/set_is_already_shown_use_case.dart';
import 'package:flutter_app_zal/features/init_screen/presentation/bloc/init_screen/init_screen_bloc.dart';
import 'package:flutter_app_zal/injection_container.dart';
import 'package:hive/hive.dart';

import 'data/data_sources/init_screen_data_source.dart';
import 'data/repositories/init_screen_repository_impl.dart';
import 'domain/repositories/init_screen_repository.dart';
import 'domain/use_cases/check_is_already_shown_use_case.dart';

mixin InitScreenInjector on Injector {
  static const initScreenBoxId = 'INIT_SCREEN_BOX';

  @override
  Future<void> init() async {
    await super.init();

    //misc
    final box = await Hive.openBox<bool>(initScreenBoxId);
    sl.registerLazySingleton<Box<bool>>(() => box, instanceName: initScreenBoxId);

    // blocs
    sl.registerLazySingleton(() => InitScreenBloc(
          checkIsAlreadyShownUseCase: sl(),
          setIsAlreadyShownUseCase: sl(),
        ));

    // use cases
    sl.registerLazySingleton(() => CheckIsAlreadyShownUseCase(repository: sl()));
    sl.registerLazySingleton(() => SetIsAlreadyShownUseCase(repository: sl()));

    // repositories
    sl.registerLazySingleton<InitScreenRepository>(() => InitScreenRepositoryImpl(dataSource: sl()));

    // data sources
    sl.registerLazySingleton<InitScreenDataSource>(() => InitScreenDataSourceImpl(source: sl(instanceName: initScreenBoxId)));
  }
}
