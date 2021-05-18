import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/style/text_styles.dart';
import 'package:flutter_app_zal/features/currency/domain/entities/currency.dart';
import 'package:flutter_app_zal/features/currency/presentation/bloc/currency_exchange/currency_exchange_bloc.dart';
import 'package:flutter_app_zal/features/currency/presentation/picker/currency_picker.dart';
import 'package:flutter_app_zal/features/currency/presentation/widgets/currency_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyInputWidget extends StatefulWidget {
  const CurrencyInputWidget({
    Key? key,
    required this.currencyExchangeBloc,
  }) : super(key: key);

  final CurrencyExchangeBloc currencyExchangeBloc;

  @override
  _CurrencyInputWidgetState createState() => _CurrencyInputWidgetState();
}

class _CurrencyInputWidgetState extends State<CurrencyInputWidget> {
  final TextEditingController userInputController = TextEditingController(text: '0.00');

  Currency selectedCurrency = Currency.USD;
  String otherText = '0.00';
  Timer? debouncer;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget.currencyExchangeBloc,
      listener: (context, state) {
        if (state is CurrencyExchangeDataState) {
          otherText = state.currencyExchange.otherValue.toStringAsFixed(2);
        }
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: CurrencyTextField(
                controller: userInputController,
                onChanged: onChangedDebouncer,
              ),
            ),
          ),
          Text(
            '=',
            style: roboto.s21.bold.colorPrimary,
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                openCurrencyPicker(
                  selected: selectedCurrency,
                  context: context,
                  onSubmit: (currency) {
                    setState(() {
                      selectedCurrency = currency;
                      onChangedDebouncer();
                    });
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      otherText,
                      style: roboto.s14.bold.colorThemeInversive(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    selectedCurrency.name.toUpperCase(),
                    style: roboto.s14.bold.colorThemeInversive(context),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onChangedDebouncer() {
    debouncer?.cancel();
    debouncer = Timer(Duration(milliseconds: 300), () {
      final value = userInputController.text;
      if (value.isNotEmpty) {
        widget.currencyExchangeBloc.add(CurrencyExchangeDataEvent(
          polishValue: double.parse(value),
          currency: selectedCurrency,
        ));
      }
    });
  }
}
