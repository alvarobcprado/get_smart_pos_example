import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'get_smart_pos_platform_interface.dart';

/// An implementation of [GetSmartPosPlatform] that uses method channels.
class MethodChannelGetSmartPos extends GetSmartPosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('get_smart_pos');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
