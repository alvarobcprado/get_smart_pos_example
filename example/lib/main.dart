import 'package:flutter/material.dart';
import 'package:get_smart_pos/get_smart_pos.dart';
import 'package:get_smart_pos_example/src/widgets/response_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _getSmartPosPlugin = GetSmartPos();
  PaymentResponse? _paymentResponse;
  CheckStatusResponse? _checkStatusResponse;
  RefundResponse? _refundResponse;

  @override
  void initState() {
    super.initState();
  }

  void _setResponse({
    PaymentResponse? paymentResponse,
    CheckStatusResponse? checkStatusResponse,
    RefundResponse? refundResponse,
  }) {
    setState(() {
      _paymentResponse = paymentResponse;
      _checkStatusResponse = checkStatusResponse;
      _refundResponse = refundResponse;
    });
  }

  Future<void> _onPaymentTap() async {
    final request = PaymentRequest(
      paymentType: PaymentTypeRequest.credit,
      amount: 23.50,
      callerId: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    final response = await _getSmartPosPlugin.paymentV3(request);
    if (mounted) {
      _setResponse(paymentResponse: response);
    }
  }

  Future<void> _onCheckStatusTap() async {
    final request = CheckStatusRequest(
      callerId: DateTime.now().millisecondsSinceEpoch.toString(),
      allowPrintCurrentTransaction: true,
    );
    final response = await _getSmartPosPlugin.checkStatus(request);
    if (mounted) {
      _setResponse(checkStatusResponse: response);
    }
  }

  Future<void> _onRefundTap() async {
    final request = RefundRequest(
      amount: 50.00,
      cvNumber: '123456789',
      transactionDate: DateTime.now(),
      originTerminal: '12345678',
    );
    final response = await _getSmartPosPlugin.refund(request);
    if (mounted) {
      _setResponse(refundResponse: response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SizedBox.expand(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: _onPaymentTap,
                  child: const Text('PaymentV3'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: _onCheckStatusTap,
                  child: const Text('CheckStatus'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: _onRefundTap,
                  child: const Text('Refund'),
                ),
                const SizedBox(height: 8),
                ResponseView(
                  paymentResponse: _paymentResponse,
                  checkStatusResponse: _checkStatusResponse,
                  refundResponse: _refundResponse,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
