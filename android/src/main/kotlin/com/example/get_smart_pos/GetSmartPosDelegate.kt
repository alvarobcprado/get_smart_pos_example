package com.example.get_smart_pos

import android.app.Activity
import android.content.Intent
import android.net.Uri
import androidx.core.app.ActivityCompat
import com.example.get_smart_pos.mappers.PaymentMapper
import io.flutter.plugin.common.PluginRegistry

class GetSmartPosDelegate(private val activity: Activity) : PluginRegistry.ActivityResultListener {
    companion object {
        private const val PAYMENT_REQUEST_CODE = 1
    }

    private var paymentResult: (Result<PigeonPaymentResponse>) -> Unit = {}

    fun paymentV3(
        paymentRequest: PigeonPaymentRequest,
        result: (Result<PigeonPaymentResponse>) -> Unit
    ) {
        paymentResult = result
        // Create a Bundle to store the paymentRequest data
        val bundle = PaymentMapper.paymentRequestToBundle(paymentRequest)

        // Create an Intent with the deeplink URI and add the Bundle
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse("getnet://pagamento/v3/payment")).apply {
            putExtras(bundle)
        }

        // Start the activity with the Intent and wait for the result
        ActivityCompat.startActivityForResult(activity, intent, PAYMENT_REQUEST_CODE, null)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == PAYMENT_REQUEST_CODE) {
            handlePaymentResult(resultCode, data)
            return true
        }
        return false
    }

    private fun handlePaymentResult(resultCode: Int, data: Intent?) {
        if (resultCode == Activity.RESULT_OK) {
            // Extract the parameters from the intent and return the result
            val paymentResponse = PaymentMapper.intentToPaymentResponse(data)
            paymentResult(Result.success(paymentResponse))
        } else {
            paymentResult(
                Result.failure(
                    FlutterError("PAYMENT_ERROR", "The payment cannot be completed"),
                ),
            )
        }
    }

}