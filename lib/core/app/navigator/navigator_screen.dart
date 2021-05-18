part of 'navigator.dart';

mixin NavigatedScreen on StatefulWidget {
  String get routeName;

  Future? setAsBaseScreen({TransitionType? transition}) =>
      CustomNavigator._setAsBaseScreen(widget: this, path: routeName, transition: transition);

  Future? addScreen(BuildContext context, {TransitionType? transition}) =>
      CustomNavigator._post(context: context, widget: this, path: routeName, transition: transition);

  Future? replaceTopScreen(BuildContext context, {TransitionType? transition}) =>
      CustomNavigator._replace(context: context, widget: this, path: routeName, transition: transition);
}
