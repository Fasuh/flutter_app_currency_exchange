// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `There was an error`
  String get defaultError {
    return Intl.message(
      'There was an error',
      name: 'defaultError',
      desc: '',
      args: [],
    );
  }

  /// `Bartłomiej Szmajda`
  String get authorName {
    return Intl.message(
      'Bartłomiej Szmajda',
      name: 'authorName',
      desc: '',
      args: [],
    );
  }

  /// `Systemy Urządzeń Mobilnych`
  String get authorClass {
    return Intl.message(
      'Systemy Urządzeń Mobilnych',
      name: 'authorClass',
      desc: '',
      args: [],
    );
  }

  /// `97363`
  String get authorIndexNumber {
    return Intl.message(
      '97363',
      name: 'authorIndexNumber',
      desc: '',
      args: [],
    );
  }

  /// `PLN`
  String get polishCurrency {
    return Intl.message(
      'PLN',
      name: 'polishCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Wynik:`
  String get resultText {
    return Intl.message(
      'Wynik:',
      name: 'resultText',
      desc: '',
      args: [],
    );
  }

  /// `Kalkulator kursu walut`
  String get currencyCalculatorName {
    return Intl.message(
      'Kalkulator kursu walut',
      name: 'currencyCalculatorName',
      desc: '',
      args: [],
    );
  }

  /// `Dowolny tematyczny`
  String get appThemeName {
    return Intl.message(
      'Dowolny tematyczny',
      name: 'appThemeName',
      desc: '',
      args: [],
    );
  }

  /// `Brak`
  String get none {
    return Intl.message(
      'Brak',
      name: 'none',
      desc: '',
      args: [],
    );
  }

  /// `Ustawienia`
  String get settingsTitle {
    return Intl.message(
      'Ustawienia',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Wielkość liter`
  String get settingsFontSize {
    return Intl.message(
      'Wielkość liter',
      name: 'settingsFontSize',
      desc: '',
      args: [],
    );
  }

  /// `Odległość między literami`
  String get settingsLetterSpacing {
    return Intl.message(
      'Odległość między literami',
      name: 'settingsLetterSpacing',
      desc: '',
      args: [],
    );
  }

  /// `Odległość między liniami`
  String get settingsLinesSpacing {
    return Intl.message(
      'Odległość między liniami',
      name: 'settingsLinesSpacing',
      desc: '',
      args: [],
    );
  }

  /// `Motyw`
  String get settingsTheme {
    return Intl.message(
      'Motyw',
      name: 'settingsTheme',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum a finibus quam. In mauris mi, dapibus vel lacus sit amet, iaculis scelerisque ipsum. Curabitur eget leo ac nibh condimentum porttitor. Nunc ut orci interdum, fermentum sem suscipit, vestibulum sem. Nam vehicula orci nisl, in mattis lectus pellentesque semper. Nullam euismod felis sed velit congue, id tempus tortor interdum. Sed mauris sapien, varius in massa a, malesuada finibus dui. Ut quis neque turpis. Mauris semper tincidunt nisi eget interdum. Aenean urna erat, commodo non nisl malesuada, molestie rutrum ante. Mauris id leo at elit pretium hendrerit. Vivamus sollicitudin lobortis nisl, a eleifend libero mattis in. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque non tellus et enim viverra bibendum. Suspendisse convallis lacinia odio eu vulputate.`
  String get appThemeDesc {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum a finibus quam. In mauris mi, dapibus vel lacus sit amet, iaculis scelerisque ipsum. Curabitur eget leo ac nibh condimentum porttitor. Nunc ut orci interdum, fermentum sem suscipit, vestibulum sem. Nam vehicula orci nisl, in mattis lectus pellentesque semper. Nullam euismod felis sed velit congue, id tempus tortor interdum. Sed mauris sapien, varius in massa a, malesuada finibus dui. Ut quis neque turpis. Mauris semper tincidunt nisi eget interdum. Aenean urna erat, commodo non nisl malesuada, molestie rutrum ante. Mauris id leo at elit pretium hendrerit. Vivamus sollicitudin lobortis nisl, a eleifend libero mattis in. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque non tellus et enim viverra bibendum. Suspendisse convallis lacinia odio eu vulputate.',
      name: 'appThemeDesc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}