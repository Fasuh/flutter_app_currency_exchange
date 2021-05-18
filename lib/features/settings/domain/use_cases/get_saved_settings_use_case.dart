import 'package:dartz/dartz.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/core/usecase/usecase.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/settings.dart';
import '../repositories/settings_repository.dart';

class GetSavedSettingsUseCase extends UseCase<Settings, NoParams> {
  GetSavedSettingsUseCase({required this.repository});

  final SettingsRepository repository;

  @override
  Future<Either<Failure, Settings>> call(NoParams params) {
    return repository.getSavedSettings();
  }
}