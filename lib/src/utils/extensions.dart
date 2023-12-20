extension CurrencyToCentsString on double {
  String toCurrencyString() {
    final totalCents = double.parse(toStringAsFixed(2)) * 100;

    final totalCentsString = totalCents.toStringAsFixed(0).padLeft(12, '0');

    return totalCentsString;
  }
}

extension CentStringToCurrency on String {
  double toCurrency() {
    if (isEmpty) {
      return 0.0;
    }

    final totalCents = int.parse(this);

    final totalCurrency = double.parse((totalCents / 100).toStringAsFixed(2));

    return totalCurrency;
  }
}
