import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/style/text_styles.dart';
import 'package:flutter_app_zal/generated/l10n.dart';

class InitialScreenThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          S.of(context).appThemeName,
          style: roboto.s21.bold.colorPrimary,
          maxLines: 1,
          maxFontSize: 18,
          minFontSize: 5,
        ),
        AutoSizeText(
          S.of(context).appThemeDesc,
          style: roboto.s14.colorPrimary.h17,
          maxLines: 10,
          maxFontSize: 18,
          minFontSize: 5,
        ),
      ],
    );
  }
}
