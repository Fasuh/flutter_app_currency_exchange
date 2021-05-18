import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zal/core/app/navigator/navigator.dart';
import 'package:flutter_app_zal/core/style/colors.dart';
import 'package:flutter_app_zal/features/currency/presentation/screens/currency_exchange.dart';
import 'package:flutter_app_zal/features/init_screen/presentation/widgets/init_screen_logo.dart';
import 'package:flutter_app_zal/features/init_screen/presentation/widgets/init_screen_personal_data.dart';
import 'package:flutter_app_zal/features/init_screen/presentation/widgets/init_screen_theme.dart';

class InitialScreen extends StatefulWidget with NavigatedScreen {
  @override
  _InitialScreenState createState() => _InitialScreenState();

  @override
  String get routeName => 'initial_screen';
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.check,
          color: whiteColor,
        ),
        backgroundColor: primaryColor,
        onPressed: () {
          CurrencyExchangeScreen().setAsBaseScreen();
        },
      ),
      body: SizedBox.expand(
        child: CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
            ),
            items: [
              InitialScreenLogoWidget(),
              InitialScreenPersonalDataWidget(),
              InitialScreenThemeWidget(),
            ]),
      ),
    );
  }
}
