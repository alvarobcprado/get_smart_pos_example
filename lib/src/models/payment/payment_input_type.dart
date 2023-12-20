enum PaymentInputType {
  magneticStripe,
  chip,
  contactlessChip,
  magneticStripeFallback;

  static PaymentInputType fromPigeon(String inputTypeCode) =>
      switch (inputTypeCode) {
        '021' => PaymentInputType.magneticStripe,
        '051' => PaymentInputType.chip,
        '071' => PaymentInputType.contactlessChip,
        '801' => PaymentInputType.magneticStripeFallback,
        _ => throw Exception('Invalid PaymentInputType'),
      };
}
