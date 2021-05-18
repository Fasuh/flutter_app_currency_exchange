import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_zal/features/settings/presentation/bloc/settings/settings_bloc.dart';
import 'package:flutter_app_zal/injection_container.dart';

import 'colors.dart';

const robotoStyleName = 'Roboto';

CustomTextStyle get roboto => Roboto(settingsBloc: sl());

class Roboto extends CustomTextStyle {
  const Roboto({
    required SettingsBloc settingsBloc,
  }) : super._(
          fontFamily: robotoStyleName,
          settingsBloc: settingsBloc,
        );
}

class CustomTextStyle extends TextStyle {
  final SettingsBloc settingsBloc;

  const CustomTextStyle._({
    required this.settingsBloc,
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
  }) : super(
          inherit: inherit,
          color: color,
          backgroundColor: backgroundColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          height: height,
          locale: locale,
          foreground: foreground,
          background: background,
          shadows: shadows,
          fontFeatures: fontFeatures,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          debugLabel: debugLabel,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          package: package,
        );

  CustomTextStyle get s12 => copyWith(fontSize: 12);

  CustomTextStyle get s10 => copyWith(fontSize: 10);

  CustomTextStyle get s14 => copyWith(fontSize: 14);

  CustomTextStyle get s16 => copyWith(fontSize: 16);

  CustomTextStyle get s18 => copyWith(fontSize: 18);

  CustomTextStyle get s21 => copyWith(fontSize: 21);

  CustomTextStyle get s22 => copyWith(fontSize: 22);

  CustomTextStyle get s23 => copyWith(fontSize: 23);

  CustomTextStyle get s26 => copyWith(fontSize: 26);

  CustomTextStyle get s28 => copyWith(fontSize: 28);

  CustomTextStyle get s32 => copyWith(fontSize: 32);

  CustomTextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  CustomTextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  CustomTextStyle get w800 => copyWith(fontWeight: FontWeight.w800);

  CustomTextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  CustomTextStyle get colorWhite => copyWith(color: whiteColor);

  CustomTextStyle get colorPrimary => copyWith(color: primaryColor);

  CustomTextStyle get colorHintDefault => copyWith(color: whiteColor);

  CustomTextStyle get colorBlack => copyWith(color: blackColor);

  CustomTextStyle colorThemeInversive(BuildContext context) => copyWith(color: Theme.of(context).hintColor);

  CustomTextStyle get h17 => copyWith(height: 1.7);

  CustomTextStyle get h13 => copyWith(height: 1.3);

  CustomTextStyle get ls1 => copyWith(letterSpacing: 1);

  CustomTextStyle copyWith({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
  }) {
    final settingsState = settingsBloc.state;
    final settings = settingsState is SettingsBlocDataState ? settingsState.settings : null;
    return CustomTextStyle._(
      settingsBloc: this.settingsBloc,
      inherit: inherit ?? this.inherit,
      color: this.foreground == null && foreground == null ? color ?? this.color : null,
      backgroundColor: this.background == null && background == null ? backgroundColor ?? this.backgroundColor : null,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: (fontSize ?? this.fontSize ?? 14) * (settings?.fontSize ?? 1.0),
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: (letterSpacing ?? this.letterSpacing ?? 1.0) * (settings?.letterSpacing ?? 1.0),
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: (height ?? this.height ?? 1.0) * (settings?.fontLinesSpacing ?? 1.0),
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }
}
