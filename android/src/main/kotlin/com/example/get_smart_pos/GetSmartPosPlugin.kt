package com.example.get_smart_pos

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** GetSmartPosPlugin */
class GetSmartPosPlugin : FlutterPlugin, GetSmartPosHostApi, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var delegate: GetSmartPosDelegate
    private var pluginBinding: ActivityPluginBinding? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        GetSmartPosHostApi.setUp(flutterPluginBinding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        GetSmartPosHostApi.setUp(binding.binaryMessenger, null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        delegate = GetSmartPosDelegate(binding.activity)
        pluginBinding = binding
        binding.addActivityResultListener(delegate)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        pluginBinding?.removeActivityResultListener(delegate)
        pluginBinding = null
    }

    override fun paymentV3(
        request: PigeonPaymentRequest, callback: (Result<PigeonPaymentResponse>) -> Unit,
    ) {
        delegate.paymentV3(request, callback)
    }
}
