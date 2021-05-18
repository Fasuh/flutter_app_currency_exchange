import 'package:flutter/cupertino.dart';
import 'package:flutter_app_zal/core/style/text_styles.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency.dart';
import 'package:flutter_picker/flutter_picker.dart';

Future openCurrencyPicker({
  required BuildContext context,
  required void Function(Currency) onSubmit,
  required Currency selected,
}) {
  return Picker(
    onConfirm: (picker, selected) {
      onSubmit(picker.getSelectedValues().first as Currency);
    },
    selecteds: [selected.index],
    adapter: PickerDataAdapter<Currency>(
        data: Currency.values.map((currency) {
      return PickerItem(
          text: Text(
            currency.name.toUpperCase(),
            style: roboto.s18.bold.colorPrimary,
          ),
          value: currency);
    }).toList()),
  ).showModal(context);
}
