import 'package:get_smart_pos/src/models/models.dart';
import 'package:get_smart_pos/src/pigeon/get_smart_pos.pigeon.dart';
import 'package:get_smart_pos/src/utils/extensions.dart';

class RefundResponse {
  RefundResponse({
    required this.result,
    required this.amount,
    this.resultDetails,
    this.gmtDateTime,
    this.nsu,
    this.nsuLocal,
    this.nsuLastSuccessfullMessage,
    this.authorizationCode,
    this.cardBin,
    this.cardLastDigits,
    this.refundTransactionDate,
    this.refundCvNumber,
    this.refundOriginTerminal,
    this.cardholderName,
    this.automationSlip,
  });

  RefundResponse.fromPigeon(PigeonRefundResponse pigeon)
      : result = PaymentResult.fromPigeon(pigeon.result),
        amount = pigeon.amount.toCurrency(),
        resultDetails = pigeon.resultDetails,
        gmtDateTime = pigeon.gmtDateTime?.toGMTDateTimeOrNull(),
        nsu = pigeon.nsu,
        nsuLocal = pigeon.nsuLocal,
        nsuLastSuccessfullMessage = pigeon.nsuLastSuccessfullMessage,
        authorizationCode = pigeon.authorizationCode,
        cardBin = pigeon.cardBin,
        cardLastDigits = pigeon.cardLastDigits,
        refundTransactionDate =
            pigeon.refundTransactionDate?.toDateTimeOrNull(),
        refundCvNumber = pigeon.refundCvNumber,
        refundOriginTerminal = pigeon.refundOriginTerminal,
        cardholderName = pigeon.cardholderName,
        automationSlip = pigeon.automationSlip;

  final PaymentResult result;
  final String? resultDetails;
  final double amount;
  final DateTime? gmtDateTime;
  final String? nsu;
  final String? nsuLocal;
  final String? nsuLastSuccessfullMessage;
  final String? authorizationCode;
  final String? cardBin;
  final String? cardLastDigits;
  final DateTime? refundTransactionDate;
  final String? refundCvNumber;
  final String? refundOriginTerminal;
  final String? cardholderName;
  final String? automationSlip;
}
