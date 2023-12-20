import 'package:get_smart_pos/src/models/models.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'get_smart_pos_method_channel.dart';

abstract class GetSmartPosPlatform extends PlatformInterface {
  /// Constructs a GetSmartPosPlatform.
  GetSmartPosPlatform() : super(token: _token);

  static final Object _token = Object();

  static GetSmartPosPlatform _instance = MethodChannelGetSmartPos();

  /// The default instance of [GetSmartPosPlatform] to use.
  ///
  /// Defaults to [MethodChannelGetSmartPos].
  static GetSmartPosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GetSmartPosPlatform] when
  /// they register themselves.
  static set instance(GetSmartPosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<PaymentResponse> paymentV3(PaymentRequest request) {
    throw UnimplementedError('paymentV3() has not been implemented.');
  }

  Future<CheckStatusResponse> checkStatus(CheckStatusRequest request) {
    throw UnimplementedError('checkStatus() has not been implemented.');
  }
}
