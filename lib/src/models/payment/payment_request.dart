import 'package:get_smart_pos/src/models/payment/payment_credit_type.dart';
import 'package:get_smart_pos/src/models/payment/payment_type.dart';
import 'package:get_smart_pos/src/pigeon/get_smart_pos.pigeon.dart';
import 'package:get_smart_pos/src/utils/extensions.dart';

class PaymentRequest {
  const PaymentRequest({
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

  PigeonPaymentRequest toPigeon() {
    return PigeonPaymentRequest(
      paymentType: paymentType.toPigeon(),
      amount: amount.toPigeon(),
      callerId: callerId,
      currencyPosition: currencyPosition,
      currencyCode: currencyCode,
      creditType: creditType?.toPigeon(),
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

  final PaymentType paymentType;
  final double amount;
  final String callerId;
  final PaymentCreditType? creditType;
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
