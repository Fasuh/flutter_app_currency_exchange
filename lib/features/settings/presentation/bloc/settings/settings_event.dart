part of 'settings_bloc.dart';

abstract class SettingsBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsInitializeEvent extends SettingsBlocEvent {}

class SettingsChangeEvent extends SettingsBlocEvent {
  SettingsChangeEvent({
    this.brightnessMode,
    this.fontSize,
    this.fontLinesSpacing,
    this.letterSpacing,
  });

  final BrightnessMode? brightnessMode;
  final double? fontSize;
  final double? letterSpacing;
  final double? fontLinesSpacing;

  @override
  List<Object?> get props => [
        fontSize,
        brightnessMode,
        letterSpacing,
        fontLinesSpacing,
      ];
}
