import 'package:get_smart_pos/src/pigeon/get_smart_pos.pigeon.dart';
import 'package:get_smart_pos/src/utils/extensions.dart';

class RefundRequest {
  RefundRequest({
    this.amount,
    this.transactionDate,
    this.cvNumber,
    this.originTerminal,
    this.allowPrintCurrentTransaction,
  });

  PigeonRefundRequest toPigeon() {
    return PigeonRefundRequest(
      amount: amount?.toPigeonCurrency(),
      transactionDate: transactionDate?.toFormattedString(),
      cvNumber: cvNumber,
      originTerminal: originTerminal,
      allowPrintCurrentTransaction: allowPrintCurrentTransaction,
    );
  }

  final double? amount;
  final DateTime? transactionDate;
  final String? cvNumber;
  final String? originTerminal;
  final bool? allowPrintCurrentTransaction;
}
