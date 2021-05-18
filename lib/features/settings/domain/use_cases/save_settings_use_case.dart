import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/core/usecase/usecase.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/settings.dart';
import '../repositories/settings_repository.dart';

class SaveSettingsUseCase extends UseCase<Settings, SaveSettingsParams> {
  SaveSettingsUseCase({required this.repository});

  final SettingsRepository repository;

  @override
  Future<Either<Failure, Settings>> call(SaveSettingsParams params) {
    return repository.saveSettings(params);
  }
}

class SaveSettingsParams extends Equatable {
  SaveSettingsParams({required this.settings});

  final Settings settings;

  @override
  List<Object?> get props => [settings];
}