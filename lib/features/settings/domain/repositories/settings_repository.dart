import 'package:dartz/dartz.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/settings.dart';
import 'package:flutter_app_zal/features/settings/domain/use_cases/save_settings_use_case.dart';

abstract class SettingsRepository {
  Future<Either<Failure, Settings>> getSavedSettings();
  Future<Either<Failure, Settings>> saveSettings(SaveSettingsParams params);
}