import 'package:pigeon/pigeon.dart';

// dart run pigeon --input pigeons/payment.dart

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/pigeon/payment/payment.pigeon.dart',
    // dartTestOut: 'lib/src/pigeon/payment/test_api.dart',
    kotlinOptions: KotlinOptions(package: 'com.example.get_smart_pos'),
    kotlinOut:
        'android/src/main/kotlin/com/example/get_smart_pos/pigeon/payment/GeneratedPayment.kt',
  ),
)
class PigeonPaymentRequest {
  const PigeonPaymentRequest({
    required this.type,
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

  final String type;
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
  PigeonPaymentResponse({
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

@HostApi(dartHostTestHandler: 'TestPaymentHostApi')
abstract class PaymentHostApi {
  @async
  PigeonPaymentResponse paymentV3(PigeonPaymentRequest request);
}
