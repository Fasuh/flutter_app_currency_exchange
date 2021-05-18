import 'package:flutter_app_zal/features/settings/data/model/settings.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/settings.dart';
import 'package:flutter_app_zal/features/settings/domain/use_cases/save_settings_use_case.dart';
import 'package:hive/hive.dart';

abstract class SettingsDataSource {
  Future<Settings> getSavedSettings();

  Future<Settings> saveSettings(SaveSettingsParams params);
}

class SettingsDataSourceImpl extends SettingsDataSource {
  SettingsDataSourceImpl({required this.source});

  static const String settingsKey = 'SETTINGS_KEY';

  final Box<SettingsModel> source;

  @override
  Future<Settings> getSavedSettings() async {
    final settings = source.get(settingsKey);
    if (settings != null) {
      return settings;
    } else {
      final defaultSettings = SettingsModel.defaultSettings();
      await source.put(settingsKey, defaultSettings);
      return defaultSettings;
    }
  }

  @override
  Future<Settings> saveSettings(SaveSettingsParams params) async {
    await source.put(settingsKey, params.settings as SettingsModel);
    return params.settings;
  }
}
