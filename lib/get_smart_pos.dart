import 'get_smart_pos_platform_interface.dart';

class GetSmartPos {
  Future<String?> getPlatformVersion() {
    return GetSmartPosPlatform.instance.getPlatformVersion();
  }
}
