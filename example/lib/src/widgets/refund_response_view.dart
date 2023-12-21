import 'package:flutter/material.dart';
import 'package:get_smart_pos/get_smart_pos.dart';
import 'package:get_smart_pos_example/src/widgets/info_line.dart';

class RefundResponseView extends StatelessWidget {
  const RefundResponseView({super.key, required this.refundResponse});

  final RefundResponse refundResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoLine(
          label: 'Result',
          value: refundResponse.result.toString(),
        ),
        InfoLine(
          label: 'ResultDetails',
          value: refundResponse.resultDetails.toString(),
        ),
        InfoLine(
          label: 'Amount',
          value: refundResponse.amount.toString(),
        ),
        InfoLine(
          label: 'gmtDateTime',
          value: refundResponse.gmtDateTime.toString(),
        ),
        InfoLine(
          label: 'Nsu',
          value: refundResponse.nsu.toString(),
        ),
        InfoLine(
          label: 'NsuLocal',
          value: refundResponse.nsuLocal.toString(),
        ),
        InfoLine(
          label: 'NsuLastSuccessfullMessage',
          value: refundResponse.nsuLastSuccessfullMessage.toString(),
        ),
        InfoLine(
          label: 'AuthorizationCode',
          value: refundResponse.authorizationCode.toString(),
        ),
        InfoLine(
          label: 'CardBin',
          value: refundResponse.cardBin.toString(),
        ),
        InfoLine(
          label: 'CardLastDigits',
          value: refundResponse.cardLastDigits.toString(),
        ),
        InfoLine(
          label: 'RefundTransactionDate',
          value: refundResponse.refundTransactionDate.toString(),
        ),
        InfoLine(
          label: 'RefundCvNumber',
          value: refundResponse.refundCvNumber.toString(),
        ),
        InfoLine(
          label: 'RefundOriginTerminal',
          value: refundResponse.refundOriginTerminal.toString(),
        ),
        InfoLine(
          label: 'CardholderName',
          value: refundResponse.cardholderName.toString(),
        ),
        // InfoLine(label:
        //   'AutomationSlipvalue:',
        //   paymentResponse.automationSlip.toString(),
        // ),
      ],
    );
  }
}
