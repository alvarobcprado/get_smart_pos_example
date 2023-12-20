package com.example.get_smart_pos

import android.app.Activity
import android.content.Intent
import android.net.Uri
import androidx.core.app.ActivityCompat
import com.example.get_smart_pos.mappers.CheckStatusMapper
import com.example.get_smart_pos.mappers.PaymentMapper
import io.flutter.plugin.common.PluginRegistry

class GetSmartPosDelegate(private val activity: Activity) : PluginRegistry.ActivityResultListener {
    companion object {
        private const val PAYMENT_REQUEST_CODE = 1
        private const val CHECK_STATUS_REQUEST_CODE = 2
        private val paymentMapper = PaymentMapper()
        private val checkStatusMapper = CheckStatusMapper()
    }

    private object Deeplink {
        const val paymentV3 = "getnet://pagamento/v3/payment"
        const val checkStatus = "getnet://pagamento/v1/checkstatus"
    }

    private var paymentResultCallback: (Result<PigeonPaymentResponse>) -> Unit = {}
    private var checkStatusResultCallback: (Result<PigeonCheckStatusResponse>) -> Unit = {}


    fun paymentV3(
        paymentRequest: PigeonPaymentRequest,
        resultCallback: (Result<PigeonPaymentResponse>) -> Unit
    ) {
        paymentResultCallback = resultCallback
        // Create a Bundle to store the paymentRequest data
        val bundle = paymentMapper.requestToBundle(paymentRequest)

        // Create an Intent with the deeplink URI and add the Bundle
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(Deeplink.paymentV3)).apply {
            putExtras(bundle)
        }

        // Start the activity with the Intent and wait for the result
        ActivityCompat.startActivityForResult(activity, intent, PAYMENT_REQUEST_CODE, null)
    }

    fun checkStatus(
        checkStatusRequest: PigeonCheckStatusRequest,
        resultCallback: (Result<PigeonCheckStatusResponse>) -> Unit
    ) {
        checkStatusResultCallback = resultCallback
        // Create a Bundle to store the paymentRequest data
        val bundle = checkStatusMapper.requestToBundle(checkStatusRequest)

        // Create an Intent with the deeplink URI and add the Bundle
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(Deeplink.checkStatus)).apply {
            putExtras(bundle)
        }

        // Start the activity with the Intent and wait for the result
        ActivityCompat.startActivityForResult(activity, intent, CHECK_STATUS_REQUEST_CODE, null)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        return when (requestCode) {
            PAYMENT_REQUEST_CODE -> {
                handlePaymentResult(resultCode, data)
                true
            }

            CHECK_STATUS_REQUEST_CODE -> {
                handleCheckStatusResult(resultCode, data)
                true
            }

            else -> false
        }
    }

    private fun handlePaymentResult(resultCode: Int, data: Intent?) {
        if (resultCode == Activity.RESULT_OK) {
            // Extract the parameters from the intent and return the result
            val paymentResponse = paymentMapper.intentToResponse(data)
            paymentResultCallback(Result.success(paymentResponse))
        } else {
            paymentResultCallback(
                Result.failure(
                    FlutterError("PAYMENT_ERROR", "The payment cannot be completed"),
                ),
            )
        }
    }

    private fun handleCheckStatusResult(resultCode: Int, data: Intent?) {
        if (resultCode == Activity.RESULT_OK) {
            // Extract the parameters from the intent and return the result
            val checkStatusResponse = checkStatusMapper.intentToResponse(data)
            checkStatusResultCallback(Result.success(checkStatusResponse))
        } else {
            checkStatusResultCallback(
                Result.failure(
                    FlutterError("CHECK_STATUS_ERROR", "The status check cannot be completed"),
                ),
            )
        }
    }

}