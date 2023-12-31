import 'package:flutter_test/flutter_test.dart';
import 'package:get_smart_pos/get_smart_pos.dart';
import 'package:get_smart_pos/get_smart_pos_method_channel.dart';
import 'package:get_smart_pos/get_smart_pos_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGetSmartPosPlatform
    with MockPlatformInterfaceMixin
    implements GetSmartPosPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<PaymentResponse> paymentV3(PaymentRequest request) {
    return Future.value(
      PaymentResponse(
        result: PaymentResult.success,
        amount: 1.0,
        callerId: 'callerId',
        type: PaymentTypeResponse.creditInFull,
        inputType: PaymentInputType.chip,
        installments: 1,
      ),
    );
  }

  @override
  Future<CheckStatusResponse> checkStatus(CheckStatusRequest request) {
    return Future.value(
      CheckStatusResponse(
        result: PaymentResult.success,
        amount: 1.0,
        callerId: 'callerId',
        type: PaymentTypeResponse.creditInFull,
        inputType: PaymentInputType.chip,
        installments: 1,
      ),
    );
  }

  @override
  Future<RefundResponse> refund(RefundRequest request) {
    return Future.value(
      RefundResponse(
        result: PaymentResult.success,
        amount: 1.0,
      ),
    );
  }
}

void main() {
  final GetSmartPosPlatform initialPlatform = GetSmartPosPlatform.instance;

  test('$MethodChannelGetSmartPos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGetSmartPos>());
  });

  test('getPlatformVersion', () async {
    GetSmartPos getSmartPosPlugin = GetSmartPos();
    MockGetSmartPosPlatform fakePlatform = MockGetSmartPosPlatform();
    GetSmartPosPlatform.instance = fakePlatform;

    expect(await getSmartPosPlugin.getPlatformVersion(), '42');
  });
}
