import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/style/text_styles.dart';
import 'package:flutter_app_zal/generated/l10n.dart';

class InitialScreenPersonalDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AutoSizeText(
          S.of(context).authorName,
          style: roboto.s18.bold.colorPrimary,
          maxLines: 1,
          maxFontSize: 18,
          minFontSize: 5,
        ),
        AutoSizeText(
          S.of(context).authorClass,
          style: roboto.s18.bold.colorPrimary,
          maxLines: 1,
          maxFontSize: 18,
          minFontSize: 5,
        ),
        AutoSizeText(
          S.of(context).authorIndexNumber,
          style: roboto.s18.bold.colorPrimary,
          maxLines: 1,
          maxFontSize: 18,
          minFontSize: 5,
        ),
      ],
    );
  }
}
