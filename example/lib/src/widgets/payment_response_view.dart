import 'package:flutter/material.dart';
import 'package:get_smart_pos/get_smart_pos.dart';
import 'package:get_smart_pos_example/src/widgets/info_line.dart';

class PaymentResponseView extends StatelessWidget {
  const PaymentResponseView({super.key, required this.paymentResponse});

  final PaymentResponse paymentResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoLine(
          label: 'Result',
          value: paymentResponse.result.toString(),
        ),
        InfoLine(
          label: 'ResultDetails',
          value: paymentResponse.resultDetails.toString(),
        ),
        InfoLine(
          label: 'gmtDateTime',
          value: paymentResponse.gmtDateTime.toString(),
        ),
        InfoLine(
          label: 'Amount',
          value: paymentResponse.amount.toString(),
        ),
        InfoLine(
          label: 'CallerId',
          value: paymentResponse.callerId,
        ),
        InfoLine(
          label: 'Type',
          value: paymentResponse.type.toString(),
        ),
        InfoLine(
          label: 'InputType',
          value: paymentResponse.inputType.toString(),
        ),
        InfoLine(
          label: 'Installments',
          value: paymentResponse.installments.toString(),
        ),
        InfoLine(
          label: 'Nsu',
          value: paymentResponse.nsu.toString(),
        ),
        InfoLine(
          label: 'NsuLastSuccessfullMessage',
          value: paymentResponse.nsuLastSuccessfullMessage.toString(),
        ),
        InfoLine(
          label: 'CvNumber',
          value: paymentResponse.cvNumber.toString(),
        ),
        InfoLine(
          label: 'Brand',
          value: paymentResponse.brand.toString(),
        ),
        InfoLine(
          label: 'NsuLocal',
          value: paymentResponse.nsuLocal.toString(),
        ),
        InfoLine(
          label: 'AuthorizationCode',
          value: paymentResponse.authorizationCode.toString(),
        ),
        InfoLine(
          label: 'CardBin',
          value: paymentResponse.cardBin.toString(),
        ),
        InfoLine(
          label: 'CardLastDigits',
          value: paymentResponse.cardLastDigits.toString(),
        ),
        InfoLine(
          label: 'ExtraScreensResult',
          value: paymentResponse.extraScreensResult.toString(),
        ),
        InfoLine(
          label: 'CardholderName',
          value: paymentResponse.cardholderName.toString(),
        ),
        // InfoLine(label:
        //   'AutomationSlipvalue:',
        //   paymentResponse.automationSlip.toString(),
        // ),
        InfoLine(
          label: 'PrintMerchantPreference',
          value: paymentResponse.printMerchantPreference.toString(),
        ),
        InfoLine(
          label: 'OrderId',
          value: paymentResponse.orderId.toString(),
        ),
        InfoLine(
          label: 'PixPayloadResponse',
          value: paymentResponse.pixPayloadResponse.toString(),
        ),
      ],
    );
  }
}
