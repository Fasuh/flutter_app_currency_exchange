enum Currency {
  USD,
  EUR,
  CHF
}

extension CurrencyExt on Currency {
  String get name {
    switch(this) {
      case Currency.USD:
        return 'usd';
      case Currency.EUR:
        return 'eur';
      case Currency.CHF:
        return 'chf';
    }
  }
}