import 'package:get_smart_pos/src/pigeon/payment/payment.pigeon.dart';

class PaymentRequest {
  const PaymentRequest({
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

  PaymentRequest.fromPigeon(PigeonPaymentRequest request)
      : type = request.type,
        amount = request.amount,
        callerId = request.callerId,
        currencyPosition = request.currencyPosition,
        currencyCode = request.currencyCode,
        creditType = request.creditType,
        installments = request.installments,
        extraScreens = request.extraScreens,
        extraData = request.extraData,
        disableTypedTransaction = request.disableTypedTransaction,
        disableMagStripe = request.disableMagStripe,
        disableCustomerSlipSpace = request.disableCustomerSlipSpace,
        allowPrintCurrentTransaction = request.allowPrintCurrentTransaction,
        orderId = request.orderId,
        additionalInfo = request.additionalInfo;

  PigeonPaymentRequest toPigeon() {
    return PigeonPaymentRequest(
      type: type,
      amount: amount,
      callerId: callerId,
      currencyPosition: currencyPosition,
      currencyCode: currencyCode,
      creditType: creditType,
      installments: installments,
      extraScreens: extraScreens,
      extraData: extraData,
      disableTypedTransaction: disableTypedTransaction,
      disableMagStripe: disableMagStripe,
      disableCustomerSlipSpace: disableCustomerSlipSpace,
      allowPrintCurrentTransaction: allowPrintCurrentTransaction,
      orderId: orderId,
      additionalInfo: additionalInfo,
    );
  }

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
