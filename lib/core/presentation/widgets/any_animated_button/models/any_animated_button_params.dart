import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/style/colors.dart';
import 'package:flutter_app_zal/core/style/dimens.dart';
import 'package:flutter_app_zal/core/presentation/widgets/any_animated_button/any_animated_button_error.dart';
import 'package:flutter_app_zal/core/presentation/widgets/any_animated_button/any_animated_button_progress.dart';
import 'package:flutter_app_zal/core/presentation/widgets/any_animated_button/any_animated_button_success.dart';

class AnyAnimatedButtonParams {
  static double _size = buttonHeight;
  static BorderRadius _borderRadius = const BorderRadius.all(Radius.circular(45.0));

  final Key? key;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final Widget? child;

  AnyAnimatedButtonParams({
    this.key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.child = const SizedBox(),
  })  : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(decoration == null || decoration.debugAssertIsValid()),
        assert(constraints == null || constraints.debugAssertIsValid()),
        assert(
            color == null || decoration == null,
            'Cannot provide both a color and a decoration\n'
            'The color argument is just a shorthand for "decoration: BoxDecoration(color: color)".');

  static AnyAnimatedButtonParams get progressParams => AnyAnimatedButtonParams(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: primaryColor,
        ),
        child: AnyAnimatedButtonProgress(),
      );

  static AnyAnimatedButtonParams get successParams => AnyAnimatedButtonParams(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: Colors.green,
        ),
        child: AnyAnimatedButtonSuccess(),
      );

  static AnyAnimatedButtonParams get errorParams => AnyAnimatedButtonParams(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: redColor,
        ),
        child: AnyAnimatedButtonError(),
      );
}
