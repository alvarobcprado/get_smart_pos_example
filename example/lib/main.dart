import 'package:flutter/material.dart';
import 'package:get_smart_pos/get_smart_pos.dart';
import 'package:get_smart_pos_example/src/widgets/check_status_response_view.dart';
import 'package:get_smart_pos_example/src/widgets/payment_response_view.dart';

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

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onPaymentTap() async {
    final request = PaymentRequest(
      paymentType: PaymentTypeRequest.credit,
      amount: 23.50,
      callerId: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    final response = await _getSmartPosPlugin.paymentV3(request);
    if (mounted) {
      setState(() {
        _paymentResponse = response;
      });
    }
  }

  Future<void> _onCheckStatusTap() async {
    final request = CheckStatusRequest(
      callerId: DateTime.now().millisecondsSinceEpoch.toString(),
      allowPrintCurrentTransaction: true,
    );
    final response = await _getSmartPosPlugin.checkStatus(request);
    if (mounted) {
      setState(() {
        _checkStatusResponse = response;
      });
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
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: _onCheckStatusTap,
                  child: const Text('CheckStatus'),
                ),
                const SizedBox(height: 16),
                if (_paymentResponse != null)
                  PaymentResponseView(paymentResponse: _paymentResponse!),
                if (_checkStatusResponse != null)
                  CheckStatusResponseView(
                    checkStatusResponse: _checkStatusResponse!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
