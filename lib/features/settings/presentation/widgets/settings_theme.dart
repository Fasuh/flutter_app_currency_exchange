import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/style/text_styles.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/brightness_mode.dart';
import 'package:flutter_app_zal/generated/l10n.dart';

class SettingsTheme extends StatefulWidget {
  const SettingsTheme({
    Key? key,
    required this.onChanged,
    required this.initialValue,
  }) : super(key: key);

  final void Function(BrightnessMode) onChanged;
  final BrightnessMode initialValue;

  @override
  _SettingsThemeState createState() => _SettingsThemeState();
}

class _SettingsThemeState extends State<SettingsTheme> {
  late BrightnessMode value;

  @override
  void initState() {
    this.value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: AutoSizeText(
            S.of(context).settingsTheme,
            style: roboto.s16.bold.colorThemeInversive(context),
            maxLines: 1,
            minFontSize: 5,
            maxFontSize: 40,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Switch(
            onChanged: (value) {
              this.value = value ? BrightnessMode.Light : BrightnessMode.Dark;
              widget.onChanged(this.value);
            },
            value: value == BrightnessMode.Light,
          ),
        )
      ],
    );
  }
}
