part of '../any_changeable_button_bloc.dart';

mixin AnyChangeableButtonManager<T> {
  Map<T, AnyChangeableButtonBloc> _blocTypes = {};

  bool get _isNotWorkingAlready => !_blocTypes.values.any((bloc) => bloc.state is! InitialAnyChangeableButtonState);

  void addEventForBloc(AnyChangeableButtonEvent event, T type) async {
    if (_isNotWorkingAlready) {
      // ignore: close_sinks
      final bloc = getBlocForMethod(type);
      bloc.add(event);
    }
  }

  void resetAnyChangeableButton(T type) {
    // ignore: close_sinks
    final bloc = getBlocForMethod(type);
    bloc.add(ResetChangeableButtonEvent());
  }

  AnyChangeableButtonBloc getBlocForMethod(T type) => _blocTypes.putIfAbsent(type, () => _addBloc(type));

  AnyChangeableButtonBloc blocGenerator(T type);

  AnyChangeableButtonBloc _addBloc(T type) {
    final bloc = blocGenerator(type);
    if (bloc != null) {
      return bloc;
    } else {
      throw Exception('Unrecognized method.');
    }
  }

  void dispose() {
    _blocTypes.forEach((key, value) {
      value.close();
    });
  }
}
