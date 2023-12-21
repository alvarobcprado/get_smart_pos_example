// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pigeon/pigeon.dart';

// dart run pigeon --input pigeons/messages.dart

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/pigeon/get_smart_pos.pigeon.dart',
    // dartTestOut: 'lib/src/pigeon/payment/test_api.dart',
    kotlinOptions: KotlinOptions(package: 'com.example.get_smart_pos'),
    kotlinOut:
        'android/src/main/kotlin/com/example/get_smart_pos/pigeon/GeneratedGetSmartPos.kt',
  ),
)
class PigeonPaymentRequest {
  const PigeonPaymentRequest({
    required this.paymentType,
    required this.amount,
    required this.callerId,
    this.currencyPosition,
    this.currencyCode,
    this.creditType,
    this.installments,
    this.extraScreens,
    this.extraData,
    this.disableTypedTransaction,
    this.disableMagStripe,
    this.disableCustomerSlipSpace,
    this.allowPrintCurrentTransaction,
    this.orderId,
    this.additionalInfo,
  });

  final String paymentType;
  final String amount;
  final String callerId;
  final String? creditType;
  final String? currencyPosition;
  final String? currencyCode;
  final String? installments;
  final String? extraScreens;
  final String? extraData;
  final bool? disableTypedTransaction;
  final bool? disableMagStripe;
  final bool? disableCustomerSlipSpace;
  final bool? allowPrintCurrentTransaction;
  final String? orderId;
  final String? additionalInfo;
}

class PigeonPaymentResponse {
  const PigeonPaymentResponse({
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

  final String result;
  final String amount;
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

class PigeonCheckStatusRequest {
  const PigeonCheckStatusRequest({
    required this.callerId,
    required this.allowPrintCurrentTransaction,
  });

  final String callerId;
  final bool? allowPrintCurrentTransaction;
}

class PigeonCheckStatusResponse {
  const PigeonCheckStatusResponse({
    required this.result,
    this.resultDetails,
    this.amount,
    this.callerId,
    this.nsu,
    this.type,
    this.nsuLastSuccessfullMessage,
    this.cvNumber,
    this.brand,
    this.inputType,
    this.installments,
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
    this.refunded,
  });

  final String result;
  final String? resultDetails;
  final String? amount;
  final String? callerId;
  final String? nsu;
  final String? nsuLastSuccessfullMessage;
  final String? cvNumber;
  final String? type;
  final String? brand;
  final String? inputType;
  final String? installments;
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
  final String? refunded;
}

class PigeonRefundRequest {
  const PigeonRefundRequest({
    this.amount,
    this.transactionDate,
    this.cvNumber,
    this.originTerminal,
    this.allowPrintCurrentTransaction,
  });

  final String? amount;
  final String? transactionDate;
  final String? cvNumber;
  final String? originTerminal;
  final bool? allowPrintCurrentTransaction;
}

class PigeonRefundResponse {
  const PigeonRefundResponse({
    required this.result,
    required this.amount,
    this.resultDetails,
    this.nsu,
    this.nsuLastSuccessfullMessage,
    this.gmtDateTime,
    this.nsuLocal,
    this.authorizationCode,
    this.cardBin,
    this.cardLastDigits,
    this.refundTransactionDate,
    this.refundCvNumber,
    this.refundOriginTerminal,
    this.cardholderName,
    this.automationSlip,
  });

  final String result;
  final String? resultDetails;
  final String amount;
  final String? gmtDateTime;
  final String? nsu;
  final String? nsuLocal;
  final String? nsuLastSuccessfullMessage;
  final String? authorizationCode;
  final String? cardBin;
  final String? cardLastDigits;
  final String? refundTransactionDate;
  final String? refundCvNumber;
  final String? refundOriginTerminal;
  final String? cardholderName;
  final String? automationSlip;
}

@HostApi(dartHostTestHandler: 'TestGetSmartPosHostApi')
abstract class GetSmartPosHostApi {
  @async
  PigeonPaymentResponse paymentV3(PigeonPaymentRequest request);

  @async
  PigeonCheckStatusResponse checkStatus(PigeonCheckStatusRequest request);

  @async
  PigeonRefundResponse refund(PigeonRefundRequest request);
}
