enum PaymentCurrencyPosition {
  beforeAmount,
  afterAmount;

  String toPigeon() => switch (this) {
        PaymentCurrencyPosition.beforeAmount => 'CURRENCY_BEFORE_AMOUNT',
        PaymentCurrencyPosition.afterAmount => 'CURRENCY_AFTER_AMOUNT',
      };
}
