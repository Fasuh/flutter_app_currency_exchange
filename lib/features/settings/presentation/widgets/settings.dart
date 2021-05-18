import 'package:flutter/material.dart';
import 'package:flutter_app_zal/features/settings/presentation/bloc/settings/settings_bloc.dart';
import 'package:flutter_app_zal/features/settings/presentation/widgets/settings_slider_with_title.dart';
import 'package:flutter_app_zal/features/settings/presentation/widgets/settings_theme.dart';
import 'package:flutter_app_zal/generated/l10n.dart';
import 'package:flutter_app_zal/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late final SettingsBloc settingsBloc;

  @override
  void initState() {
    settingsBloc = sl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: settingsBloc,
        builder: (context, state) {
          if (state is SettingsBlocDataState) {
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: SettingsTheme(
                    initialValue: state.settings.brightnessMode,
                    onChanged: (value) {
                      settingsBloc.add(SettingsChangeEvent(brightnessMode: value));
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SettingsSliderWithTitle(
                    onChanged: (value) {
                      settingsBloc.add(SettingsChangeEvent(fontSize: value));
                    },
                    title: S.of(context).settingsFontSize,
                    initialValue: state.settings.fontSize,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SettingsSliderWithTitle(
                    onChanged: (value) {
                      settingsBloc.add(SettingsChangeEvent(letterSpacing: value));
                    },
                    title: S.of(context).settingsLetterSpacing,
                    initialValue: state.settings.letterSpacing,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SettingsSliderWithTitle(
                    onChanged: (value) {
                      settingsBloc.add(SettingsChangeEvent(fontLinesSpacing: value));
                    },
                    title: S.of(context).settingsLinesSpacing,
                    initialValue: state.settings.fontLinesSpacing,
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
