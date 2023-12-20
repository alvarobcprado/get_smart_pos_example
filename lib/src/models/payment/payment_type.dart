enum PaymentType {
  credit,
  debit,
  voucher,
  pix;

  String toPigeon() => switch (this) {
        PaymentType.credit => 'credit',
        PaymentType.debit => 'debit',
        PaymentType.voucher => 'voucher',
        PaymentType.pix => 'pix',
      };
}
