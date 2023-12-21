import 'package:get_smart_pos/src/models/models.dart';

import 'get_smart_pos_platform_interface.dart';

export 'src/models/models.dart';

class GetSmartPos {
  Future<String?> getPlatformVersion() {
    return GetSmartPosPlatform.instance.getPlatformVersion();
  }

  Future<PaymentResponse> paymentV3(PaymentRequest request) {
    return GetSmartPosPlatform.instance.paymentV3(request);
  }

  Future<CheckStatusResponse> checkStatus(CheckStatusRequest request) {
    return GetSmartPosPlatform.instance.checkStatus(request);
  }

  Future<RefundResponse> refund(RefundRequest request) {
    return GetSmartPosPlatform.instance.refund(request);
  }
}
