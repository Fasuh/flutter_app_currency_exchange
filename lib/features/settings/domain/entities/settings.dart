import 'package:equatable/equatable.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/brightness_mode.dart';

abstract class Settings extends Equatable {
  double get fontSize;
  double get letterSpacing;
  double get fontLinesSpacing;

  BrightnessMode get brightnessMode;

  Settings copyWith({
    double? fontSize,
    double? letterSpacing,
    double? fontLinesSpacing,
    BrightnessMode? brightnessMode,
  });
}
