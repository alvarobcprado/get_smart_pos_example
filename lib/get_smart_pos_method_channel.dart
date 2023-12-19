import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_smart_pos/src/models/payment_request.dart';
import 'package:get_smart_pos/src/models/payment_response.dart';
import 'package:get_smart_pos/src/pigeon/payment/payment.pigeon.dart';

import 'get_smart_pos_platform_interface.dart';

/// An implementation of [GetSmartPosPlatform] that uses method channels.
class MethodChannelGetSmartPos extends GetSmartPosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('get_smart_pos');

  @visibleForTesting
  static PaymentHostApi api = PaymentHostApi();

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<PaymentResponse> paymentV3(PaymentRequest request) async {
    final pigeonRequest = request.toPigeon();
    final response = await api.paymentV3(pigeonRequest);
    return PaymentResponse.fromPigeon(response);
  }
}
