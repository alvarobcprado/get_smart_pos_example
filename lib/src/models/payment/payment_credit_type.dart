enum PaymentCreditType {
  creditMerchant,
  creditIssuer;

  String toPigeon() => switch (this) {
        PaymentCreditType.creditMerchant => 'creditMerchant',
        PaymentCreditType.creditIssuer => 'creditIssuer',
      };
}
