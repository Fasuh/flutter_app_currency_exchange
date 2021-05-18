import 'package:equatable/equatable.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/core/usecase/usecase.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/brightness_mode.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/settings.dart';
import 'package:flutter_app_zal/features/settings/domain/use_cases/get_saved_settings_use_case.dart';
import 'package:flutter_app_zal/features/settings/domain/use_cases/save_settings_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsBlocEvent, SettingsBlocState> {
  SettingsBloc({
    required this.getSavedSettingsUseCase,
    required this.saveSettingsUseCase,
  }) : super(SettingsBlocInitialState());

  final GetSavedSettingsUseCase getSavedSettingsUseCase;
  final SaveSettingsUseCase saveSettingsUseCase;

  late Settings _settings;

  @override
  Stream<SettingsBlocState> mapEventToState(SettingsBlocEvent event) async* {
    if (event is SettingsInitializeEvent) {
      yield* _mapSettingsInitializeEvent(event);
    } else if (event is SettingsChangeEvent) {
      yield* _mapSettingsChangeEvent(event);
    }
  }

  Stream<SettingsBlocState> _mapSettingsChangeEvent(SettingsChangeEvent event) async* {
    final result = await saveSettingsUseCase(SaveSettingsParams(
        settings: _settings.copyWith(
      fontSize: event.fontSize,
      fontLinesSpacing: event.fontLinesSpacing,
      letterSpacing: event.letterSpacing,
      brightnessMode: event.brightnessMode,
    )));
    yield* result.fold((failure) async* {
      yield SettingsBlocErrorSavingState(failure: failure, settings: _settings.copyWith());
    }, (data) async* {
      _settings = data.copyWith();
      yield SettingsBlocDataState(settings: data.copyWith());
    });
  }

  Stream<SettingsBlocState> _mapSettingsInitializeEvent(SettingsInitializeEvent event) async* {
    final result = await getSavedSettingsUseCase(NoParams());
    yield* result.fold((failure) async* {
      yield SettingsBlocInitialErrorState(failure: failure);
    }, (data) async* {
      _settings = data.copyWith();
      yield SettingsBlocDataState(settings: data.copyWith());
    });
  }
}
