import 'package:flutter/material.dart';

extension DoubleExtension on double {
  String get decimalZeroFormat {
    return this.toStringAsFixed(this.truncateToDouble() == this ? 0 : 1);
  }
}

extension CapExtension on String {
  String get capitalize => isEmpty ? "" : "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";

  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';

  String get capitalizeFirstOfEach => this.split(" ").map((str) => str.capitalize).join(" ");
}

extension conversionExt on String {
  double toDoubleIncludingInt() {
    return (double.tryParse(this) ?? int.tryParse(this)?.toDouble() ?? 0);
  }
}

extension LinearGradientExtension on LinearGradient {
  LinearGradient copyWith({
    Alignment? begin,
    Alignment? end,
  }) {
    return LinearGradient(begin: begin ?? this.begin, end: end ?? this.end, colors: this.colors, stops: this.stops, tileMode: this.tileMode);
  }

  LinearGradient get rotation90 {
    return LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: this.colors,
      stops: this.stops,
      tileMode: this.tileMode,
    );
  }

  LinearGradient get rotation180 {
    return LinearGradient(
      begin: end,
      end: begin,
      colors: this.colors,
      stops: this.stops,
      tileMode: this.tileMode,
    );
  }

  LinearGradient get rotation270 {
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: this.colors,
      stops: this.stops,
      tileMode: this.tileMode,
    );
  }
}
