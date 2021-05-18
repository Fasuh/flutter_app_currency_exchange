import 'package:flutter_app_zal/features/settings/domain/entities/brightness_mode.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/settings.dart';
import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: SettingsModel.objectId)
class SettingsModel extends Settings with HiveObjectMixin {
  static const objectId = 0;

  SettingsModel({
    required this.brightnessMode,
    required this.fontSize,
    required this.letterSpacing,
    required this.fontLinesSpacing,
  });

  factory SettingsModel.defaultSettings() {
    return SettingsModel(
      brightnessMode: _defaultBrightnessMode,
      fontSize: _defaultFontSize,
      letterSpacing: _defaultLetterSpacing,
      fontLinesSpacing: _defaultFontLinesSpacing,
    );
  }

  static const BrightnessMode _defaultBrightnessMode = BrightnessMode.Light;
  static const double _defaultFontSize = 1.0;
  static const double _defaultLetterSpacing = 1.0;
  static const double _defaultFontLinesSpacing = 1.0;

  @HiveField(0)
  final BrightnessMode brightnessMode;
  @HiveField(1)
  final double fontSize;
  @HiveField(2)
  final double letterSpacing;
  @HiveField(3)
  final double fontLinesSpacing;

  @override
  Settings copyWith({
    double? fontSize,
    double? letterSpacing,
    double? fontLinesSpacing,
    BrightnessMode? brightnessMode,
  }) {
    return SettingsModel(
      brightnessMode: brightnessMode ?? this.brightnessMode,
      fontSize: fontSize ?? this.fontSize,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      fontLinesSpacing: fontLinesSpacing ?? this.fontLinesSpacing,
    );
  }

  @override
  List<Object?> get props => [
        brightnessMode,
        fontSize,
        letterSpacing,
        fontLinesSpacing,
      ];
}
