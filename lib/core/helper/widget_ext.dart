import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget extPadding({double horizontal = 0.0, double vertical = 0.0}) => Padding(
        child: this,
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      );
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
