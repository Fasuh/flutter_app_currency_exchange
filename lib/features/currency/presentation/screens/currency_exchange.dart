import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/app/navigator/navigator.dart';
import 'package:flutter_app_zal/core/style/colors.dart';
import 'package:flutter_app_zal/core/style/text_styles.dart';
import 'package:flutter_app_zal/features/currency/presentation/bloc/currency_exchange/currency_exchange_bloc.dart';
import 'package:flutter_app_zal/features/currency/presentation/widgets/currency_data.dart';
import 'package:flutter_app_zal/features/settings/presentation/bloc/settings/settings_bloc.dart';
import 'package:flutter_app_zal/features/settings/presentation/modal/settings_modal.dart';
import 'package:flutter_app_zal/generated/l10n.dart';
import 'package:flutter_app_zal/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyExchangeScreen extends StatefulWidget with NavigatedScreen {
  @override
  _CurrencyExchangeScreenState createState() => _CurrencyExchangeScreenState();

  @override
  String get routeName => 'currency_exchange';
}

class _CurrencyExchangeScreenState extends State<CurrencyExchangeScreen> {
  late final CurrencyExchangeBloc currencyExchangeBloc;
  late final SettingsBloc settingsBloc;

  @override
  void initState() {
    settingsBloc = sl();
    currencyExchangeBloc = sl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: settingsBloc,
      builder: (context, state) {
        return BlocBuilder(
            bloc: currencyExchangeBloc,
            builder: (context, state) {
              return Scaffold(
                backgroundColor: backgroundColor,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    openSettingsModal(context: context);
                  },
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.settings,
                    color: whiteColor,
                  ),
                ),
                body: SizedBox.expand(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: AutoSizeText(
                            S.of(context).currencyCalculatorName,
                            style: roboto.s21.bold.colorWhite,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 50.0,
                            bottom: 50.0,
                            right: 5.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.only(
                                topRight: const Radius.circular(40.0),
                                bottomRight: const Radius.circular(40.0),
                              ),
                            ),
                            child: CurrencyInputWidget(
                              currencyExchangeBloc: currencyExchangeBloc,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      }
    );
  }
}
