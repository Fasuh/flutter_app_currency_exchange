import 'package:equatable/equatable.dart';
import 'package:flutter_app_zal/generated/l10n.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [errorMessage];

  String get errorMessage => S.current.defaultError;
}

class DefaultInitScreenDataFailure extends Failure {}

class DefaultCurrencyExchangeError extends Failure {}

class DefaultSaveSettingsError extends Failure {}

class DefaultGetSavedSettingsError extends Failure {}