import 'package:flutter/material.dart';
import 'package:get_smart_pos/get_smart_pos.dart';
import 'package:get_smart_pos_example/src/widgets/info_line.dart';

class CheckStatusResponseView extends StatelessWidget {
  const CheckStatusResponseView({super.key, required this.checkStatusResponse});

  final CheckStatusResponse checkStatusResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoLine(
          label: 'Result',
          value: checkStatusResponse.result.toString(),
        ),
        InfoLine(
          label: 'ResultDetails',
          value: checkStatusResponse.resultDetails.toString(),
        ),
        InfoLine(
          label: 'gmtDateTime',
          value: checkStatusResponse.gmtDateTime.toString(),
        ),
        InfoLine(
          label: 'Amount',
          value: checkStatusResponse.amount.toString(),
        ),
        InfoLine(
          label: 'CallerId',
          value: checkStatusResponse.callerId.toString(),
        ),
        InfoLine(
          label: 'Type',
          value: checkStatusResponse.type.toString(),
        ),
        InfoLine(
          label: 'InputType',
          value: checkStatusResponse.inputType.toString(),
        ),
        InfoLine(
          label: 'Installments',
          value: checkStatusResponse.installments.toString(),
        ),
        InfoLine(
          label: 'Nsu',
          value: checkStatusResponse.nsu.toString(),
        ),
        InfoLine(
          label: 'NsuLastSuccessfullMessage',
          value: checkStatusResponse.nsuLastSuccessfullMessage.toString(),
        ),
        InfoLine(
          label: 'CvNumber',
          value: checkStatusResponse.cvNumber.toString(),
        ),
        InfoLine(
          label: 'Brand',
          value: checkStatusResponse.brand.toString(),
        ),
        InfoLine(
          label: 'NsuLocal',
          value: checkStatusResponse.nsuLocal.toString(),
        ),
        InfoLine(
          label: 'AuthorizationCode',
          value: checkStatusResponse.authorizationCode.toString(),
        ),
        InfoLine(
          label: 'CardBin',
          value: checkStatusResponse.cardBin.toString(),
        ),
        InfoLine(
          label: 'CardLastDigits',
          value: checkStatusResponse.cardLastDigits.toString(),
        ),
        InfoLine(
          label: 'ExtraScreensResult',
          value: checkStatusResponse.extraScreensResult.toString(),
        ),
        InfoLine(
          label: 'CardholderName',
          value: checkStatusResponse.cardholderName.toString(),
        ),
        // InfoLine(label:
        //   'AutomationSlipvalue:',
        //   paymentResponse.automationSlip.toString(),
        // ),
        InfoLine(
          label: 'PrintMerchantPreference',
          value: checkStatusResponse.printMerchantPreference.toString(),
        ),
        InfoLine(
          label: 'OrderId',
          value: checkStatusResponse.orderId.toString(),
        ),
        // InfoLine(
        //   label: 'PixPayloadResponse',
        //   value: checkStatusResponse.pixPayloadResponse.toString(),
        // ),
        InfoLine(
          label: 'Refunded',
          value: checkStatusResponse.refunded.toString(),
        ),
      ],
    );
  }
}
