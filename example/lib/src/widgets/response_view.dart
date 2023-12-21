import 'package:flutter/material.dart';
import 'package:get_smart_pos/get_smart_pos.dart';
import 'package:get_smart_pos_example/src/widgets/check_status_response_view.dart';
import 'package:get_smart_pos_example/src/widgets/payment_response_view.dart';
import 'package:get_smart_pos_example/src/widgets/refund_response_view.dart';

class ResponseView extends StatelessWidget {
  const ResponseView({
    super.key,
    this.paymentResponse,
    this.checkStatusResponse,
    this.refundResponse,
  });

  final PaymentResponse? paymentResponse;
  final CheckStatusResponse? checkStatusResponse;
  final RefundResponse? refundResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (paymentResponse != null)
          PaymentResponseView(paymentResponse: paymentResponse!),
        if (checkStatusResponse != null)
          CheckStatusResponseView(
            checkStatusResponse: checkStatusResponse!,
          ),
        if (refundResponse != null)
          RefundResponseView(refundResponse: refundResponse!),
      ],
    );
  }
}
