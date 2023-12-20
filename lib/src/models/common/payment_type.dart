enum PaymentTypeRequest {
  credit,
  debit,
  voucher,
  pix;

  String toPigeon() => switch (this) {
        PaymentTypeRequest.credit => 'credit',
        PaymentTypeRequest.debit => 'debit',
        PaymentTypeRequest.voucher => 'voucher',
        PaymentTypeRequest.pix => 'pix',
      };
}

enum PaymentTypeResponse {
  debit,
  creditInFull,
  creditMerchantInstallment,
  creditIssuerInstallment,
  voucher,
  pix;

  static PaymentTypeResponse? fromPigeon(String? typeCode) =>
      switch (typeCode) {
        '02' => PaymentTypeResponse.debit,
        '11' => PaymentTypeResponse.creditInFull,
        '12' => PaymentTypeResponse.creditMerchantInstallment,
        '13' => PaymentTypeResponse.creditIssuerInstallment,
        '03' => PaymentTypeResponse.voucher,
        '30' => PaymentTypeResponse.pix,
        _ => null,
      };
}
