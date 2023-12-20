import 'package:get_smart_pos/src/pigeon/get_smart_pos.pigeon.dart';
import 'package:get_smart_pos/src/utils/extensions.dart';

class PaymentResponse {
  PaymentResponse({
    required this.result,
    required this.amount,
    required this.callerId,
    required this.type,
    required this.inputType,
    required this.installments,
    this.resultDetails,
    this.nsu,
    this.nsuLastSuccessfullMessage,
    this.cvNumber,
    this.brand,
    this.gmtDateTime,
    this.nsuLocal,
    this.authorizationCode,
    this.cardBin,
    this.cardLastDigits,
    this.extraScreensResult,
    this.cardholderName,
    this.automationSlip,
    this.printMerchantPreference,
    this.orderId,
    this.pixPayloadResponse,
  });

  PaymentResponse.fromPigeon(PigeonPaymentResponse pigeon)
      : result = pigeon.result,
        amount = pigeon.amount.toCurrency(),
        callerId = pigeon.callerId,
        type = pigeon.type,
        inputType = pigeon.inputType,
        installments = pigeon.installments,
        resultDetails = pigeon.resultDetails,
        nsu = pigeon.nsu,
        nsuLastSuccessfullMessage = pigeon.nsuLastSuccessfullMessage,
        cvNumber = pigeon.cvNumber,
        brand = pigeon.brand,
        gmtDateTime = pigeon.gmtDateTime,
        nsuLocal = pigeon.nsuLocal,
        authorizationCode = pigeon.authorizationCode,
        cardBin = pigeon.cardBin,
        cardLastDigits = pigeon.cardLastDigits,
        extraScreensResult = pigeon.extraScreensResult,
        cardholderName = pigeon.cardholderName,
        automationSlip = pigeon.automationSlip,
        printMerchantPreference = pigeon.printMerchantPreference,
        orderId = pigeon.orderId,
        pixPayloadResponse = pigeon.pixPayloadResponse;

  final String result;
  final double amount;
  final String callerId;
  final String type;
  final String inputType;
  final String installments;
  final String? resultDetails;
  final String? nsu;
  final String? nsuLastSuccessfullMessage;
  final String? cvNumber;
  final String? brand;
  final String? gmtDateTime;
  final String? nsuLocal;
  final String? authorizationCode;
  final String? cardBin;
  final String? cardLastDigits;
  final String? extraScreensResult;
  final String? cardholderName;
  final String? automationSlip;
  final bool? printMerchantPreference;
  final String? orderId;
  final String? pixPayloadResponse;
}
