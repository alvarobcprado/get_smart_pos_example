enum PaymentResult {
  success(0),
  refused(1),
  cancelled(2),
  failed(3),
  unknown(4),
  pending(5);

  const PaymentResult(this.code);

  static PaymentResult fromPigeon(String resultCode) {
    final code = int.parse(resultCode);
    return PaymentResult.values.firstWhere((result) => result.code == code);
  }

  final int code;
}
