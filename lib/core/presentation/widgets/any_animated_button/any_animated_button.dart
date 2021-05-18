import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_zal/core/presentation/widgets/any_animated_button/models/any_animated_button_params.dart';
import 'package:flutter_app_zal/core/presentation/blocs/any_animated_button/any_animated_button_bloc.dart';

class AnyAnimatedButton extends StatefulWidget {
  final AnyAnimatedButtonBloc bloc;
  final AnyAnimatedButtonParams defaultButtonParams;
  final AnyAnimatedButtonParams? progressButtonParams;
  final AnyAnimatedButtonParams? successButtonParams;
  final AnyAnimatedButtonParams? errorButtonParams;

  AnyAnimatedButton({
    Key? key,
    required this.bloc,
    required this.defaultButtonParams,
    this.progressButtonParams,
    this.successButtonParams,
    this.errorButtonParams,
  }) : super(key: key);

  @override
  _AnyAnimatedButtonState createState() => _AnyAnimatedButtonState();
}

class _AnyAnimatedButtonState extends State<AnyAnimatedButton> {
  late AnyAnimatedButtonParams _defaultParams;
  late AnyAnimatedButtonParams _progressParams;
  late AnyAnimatedButtonParams _successParams;
  late AnyAnimatedButtonParams _errorParams;

  late double _maxHeight;
  late AnyAnimatedButtonParams _params;

  @override
  void initState() {
    _defaultParams = widget.defaultButtonParams;
    _progressParams = widget.progressButtonParams ?? AnyAnimatedButtonParams.progressParams;
    _successParams = widget.successButtonParams ?? AnyAnimatedButtonParams.successParams;
    _errorParams = widget.errorButtonParams ?? AnyAnimatedButtonParams.errorParams;

    _maxHeight = _getMaxHeight();
    _params = widget.defaultButtonParams;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: _maxHeight,
          child: Center(
            child: BlocBuilder(
              bloc: widget.bloc,
              builder: (BuildContext context, AnyAnimatedButtonState state) {
                _params = _getParamsFromState(state);

                return AnimatedContainer(
                  key: _params.key,
                  duration: Duration(milliseconds: 300),
                  width: _params.width == 1.0 / 0.0 ? constraints.maxWidth : _params.width,
                  height: _params.height,
                  constraints: _params.constraints,
                  alignment: _params.alignment,
                  padding: _params.padding,
                  margin: _params.margin,
                  decoration: _params.decoration,
                  foregroundDecoration: _params.foregroundDecoration,
                  transform: _params.transform,
                  color: _params.color,
                  child: _params.child,
                );
              },
            ),
          ),
        );
      },
    );
  }

  double _getMaxHeight() {
    double max = _defaultParams.height!;
    if (max < _progressParams.height!) max = _progressParams.height!;
    if (max < _successParams.height!) max = _successParams.height!;
    if (max < _errorParams.height!) max = _errorParams.height!;
    return max;
  }

  AnyAnimatedButtonParams _getParamsFromState(AnyAnimatedButtonState state) {
    if (state is DefaultAnyAnimatedButtonState)
      return _defaultParams;
    else if (state is ProgressAnyAnimatedButtonState)
      return _progressParams;
    else if (state is SuccessAnyAnimatedButtonState)
      return _successParams;
    else
      return _errorParams;
  }
}
