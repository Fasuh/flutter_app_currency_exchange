import 'package:bot_toast/bot_toast.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/app/navigator/navigator.dart';
import 'package:flutter_app_zal/core/style/colors.dart';
import 'package:flutter_app_zal/features/currency/presentation/screens/currency_exchange.dart';
import 'package:flutter_app_zal/features/init_screen/presentation/bloc/init_screen/init_screen_bloc.dart';
import 'package:flutter_app_zal/features/init_screen/presentation/screens/initial_screen.dart';
import 'package:flutter_app_zal/features/settings/domain/entities/brightness_mode.dart';
import 'package:flutter_app_zal/features/settings/presentation/bloc/settings/settings_bloc.dart';
import 'package:flutter_app_zal/injection_container.dart';
import 'package:flutter_app_zal/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer().init();
  AppConfig.init;
  runApp(EasyDynamicThemeWidget(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final InitScreenBloc initScreenBloc;
  late final SettingsBloc settingsBloc;

  @override
  void initState() {
    settingsBloc = sl();
    initScreenBloc = sl();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      settingsBloc.add(SettingsInitializeEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: settingsBloc,
        builder: (context, state) {
          if (state is SettingsBlocDataState && initScreenBloc.state is InitScreenNotInitializedState) {
            initScreenBloc.add(InitScreenAppStartedEvent());
          }
          if (state is SettingsBlocDataState) {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              EasyDynamicTheme.of(context).changeTheme(dark: state.settings.brightnessMode == BrightnessMode.Dark);
            });
          }
          return MultiBlocListener(
            listeners: [
              BlocListener(
                bloc: initScreenBloc,
                listener: (context, state) {
                  if (state is InitScreenDataState) {
                    if (state.wasShownAlready) {
                      CurrencyExchangeScreen().setAsBaseScreen();
                    } else {
                      InitialScreen().setAsBaseScreen();
                    }
                  }
                },
              ),
            ],
            child: MaterialApp(
              onGenerateRoute: (routeSettings) => CustomNavigator.router.generator(routeSettings),
              navigatorKey: CustomNavigator.navigatorKey,
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: whiteColor,
              ),
              darkTheme: ThemeData.dark(),
              themeMode: EasyDynamicTheme.of(context).themeMode,
              localizationsDelegates: [S.delegate],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Flutter Zal',
              navigatorObservers: [BotToastNavigatorObserver()],
              builder: BotToastInit(),
              home: Scaffold(body: Container()),
            ),
          );
        });
  }
}
