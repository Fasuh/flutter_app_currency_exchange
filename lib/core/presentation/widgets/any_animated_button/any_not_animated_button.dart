import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/presentation/widgets/any_animated_button/models/any_animated_button_params.dart';

class AnyNotAnimatedButton extends StatelessWidget {
  final AnyAnimatedButtonParams params;

  const AnyNotAnimatedButton({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: params.key,
      width: params.width,
      height: params.height,
      constraints: params.constraints,
      alignment: params.alignment,
      padding: params.padding,
      margin: params.margin,
      decoration: params.decoration,
      foregroundDecoration: params.foregroundDecoration,
      transform: params.transform,
      color: params.color,
      child: params.child,
    );
  }
}
