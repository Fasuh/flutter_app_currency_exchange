import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/style/text_styles.dart';
import 'package:flutter_app_zal/features/currency/presentation/formatter/currency_formatter.dart';
import 'package:flutter_app_zal/generated/l10n.dart';

class CurrencyTextField extends StatelessWidget {
  const CurrencyTextField({
    Key? key,
    this.enabled = true,
    this.onChanged,
    required this.controller,
  })   : assert(onChanged != null || !enabled),
        super(key: key);

  final TextEditingController controller;
  final void Function()? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AutoSizeTextField(
      enabled: enabled,
      controller: controller,
      maxLines: 1,
      maxLength: 30,
      decoration: InputDecoration(
        suffix: enabled ? Text(
          S.of(context).polishCurrency,
        ) : null,
      ),
      style: roboto.s14.bold.colorThemeInversive(context),
      textAlign: TextAlign.center,
      inputFormatters: [
        CurrencyFormatter(),
      ],
      onChanged: (_) {
        onChanged?.call();
      },
    );
  }
}
