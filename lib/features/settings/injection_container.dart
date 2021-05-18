import 'package:flutter_app_zal/features/settings/data/model/settings.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/brightness_mode.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/settings.dart';
import 'package:flutter_app_zal/features/settings/domain/use_cases/save_settings_use_case.dart';
import 'package:flutter_app_zal/features/settings/presentation/bloc/settings/settings_bloc.dart';
import 'package:flutter_app_zal/injection_container.dart';
import 'package:hive/hive.dart';

import 'data/data_sources/settings_data_source.dart';
import 'data/repositories/settings_repository_impl.dart';
import 'domain/repositories/settings_repository.dart';
import 'domain/use_cases/get_saved_settings_use_case.dart';

mixin SettingsInjector on Injector {
  static const settingsBoxId = 'SETTINGS_BOX';

  @override
  Future<void> init() async {
    await super.init();

    // misc
    Hive.registerAdapter(BrightnessModeAdapter());
    Hive.registerAdapter(SettingsModelAdapter());
    final box = await Hive.openBox<SettingsModel>(settingsBoxId);
    sl.registerLazySingleton<Box<SettingsModel>>(() => box, instanceName: settingsBoxId);

    // bloc
    sl.registerLazySingleton(() => SettingsBloc(getSavedSettingsUseCase: sl(), saveSettingsUseCase: sl()));

    // use cases
    sl.registerLazySingleton(() => GetSavedSettingsUseCase(repository: sl()));
    sl.registerLazySingleton(() => SaveSettingsUseCase(repository: sl()));

    // repositories
    sl.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(dataSource: sl()));

    // data sources
    sl.registerLazySingleton<SettingsDataSource>(() => SettingsDataSourceImpl(source: sl(instanceName: settingsBoxId)));
  }
}
