import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_smart_pos/src/models/models.dart';
import 'package:get_smart_pos/src/pigeon/get_smart_pos.pigeon.dart';

import 'get_smart_pos_platform_interface.dart';

/// An implementation of [GetSmartPosPlatform] that uses method channels.
class MethodChannelGetSmartPos extends GetSmartPosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('get_smart_pos');

  @visibleForTesting
  static GetSmartPosHostApi api = GetSmartPosHostApi();

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

  @override
  Future<CheckStatusResponse> checkStatus(CheckStatusRequest request) async {
    final pigeonRequest = request.toPigeon();
    final response = await api.checkStatus(pigeonRequest);
    return CheckStatusResponse.fromPigeon(response);
  }

  @override
  Future<RefundResponse> refund(RefundRequest request) async {
    final pigeonRequest = request.toPigeon();
    final response = await api.refund(pigeonRequest);
    return RefundResponse.fromPigeon(response);
  }
}
