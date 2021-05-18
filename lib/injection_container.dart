import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zal/features/currency/injection_container.dart';
import 'package:flutter_app_zal/features/init_screen/injection_container.dart';
import 'package:flutter_app_zal/features/settings/injection_container.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_app_zal/app_config.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

const globalDio = 'global';

class InjectionContainer extends Injector with InitScreenInjector, CurrencyInjector, SettingsInjector {}

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    await Hive.initFlutter();

    sl.registerLazySingleton<AppConfig>(() => AppConfig.init);
    sl.registerLazySingleton<Dio>(
      () {
        final dio = Dio(BaseOptions(
          baseUrl: sl<AppConfig>().api,
          connectTimeout: 15000,
          receiveTimeout: 15000,
        ));
        dio
          ..options.headers = {"content-type": "application/json", "Accept": "application/json"}
          ..interceptors.add(PrettyDioLogger(
            responseBody: true,
            requestBody: true,
            requestHeader: true,
            responseHeader: true,
            request: true,
          ));
        return dio;
      },
      instanceName: globalDio,
    );
  }
}
