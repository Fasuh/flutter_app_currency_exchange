import 'package:dartz/dartz.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/core/error/form_decoder.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/settings.dart';
import 'package:flutter_app_zal/features/settings/domain/repositories/settings_repository.dart';
import 'package:flutter_app_zal/features/settings/domain/use_cases/save_settings_use_case.dart';
import '../data_sources/settings_data_source.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  SettingsRepositoryImpl({required this.dataSource});

  final SettingsDataSource dataSource;

  @override
  Future<Either<Failure, Settings>> getSavedSettings() async {
    try {
      final result = await dataSource.getSavedSettings();
      return Right(result);
    } catch (error) {
      return Left(handleError(error, defaultFailure: DefaultGetSavedSettingsError()));
    }
  }

  @override
  Future<Either<Failure, Settings>> saveSettings(SaveSettingsParams params) async {
    try {
      final result = await dataSource.saveSettings(params);
      return Right(result);
    } catch (error) {
      return Left(handleError(error, defaultFailure: DefaultSaveSettingsError()));
    }
  }
}
