import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/style/text_styles.dart';

class SettingsSliderWithTitle extends StatefulWidget {
  SettingsSliderWithTitle({
    Key? key,
    required this.onChanged,
    required this.title,
    required this.initialValue,
  }) : super(key: key);

  final void Function(double) onChanged;
  final String title;
  final double initialValue;

  @override
  _SettingsSliderWithTitleState createState() => _SettingsSliderWithTitleState();
}

class _SettingsSliderWithTitleState extends State<SettingsSliderWithTitle> {
  Timer? limiter;

  late double value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: AutoSizeText(
              widget.title,
              style: roboto.s16.colorThemeInversive(context).bold,
              maxFontSize: 40,
              minFontSize: 5,
              maxLines: 1,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Slider(
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value;
              });
              limiter ??= Timer(Duration(milliseconds: 100), () {
                widget.onChanged(this.value);
                limiter = null;
              });
            },
            min: 0.8,
            max: 1.4,
          ),
        ),
      ],
    );
  }
}
