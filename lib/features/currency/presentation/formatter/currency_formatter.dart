import 'package:flutter/services.dart';

class CurrencyFormatter extends FilteringTextInputFormatter {
  CurrencyFormatter() : super.allow('', replacementString: '');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final parsed = double.tryParse(newValue.text);
    final dot = newValue.text.indexOf('.');
    if ((parsed != null || newValue.text.isEmpty) && (dot == -1 || dot > newValue.text.length - 4)) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}
