package com.example.get_smart_pos

import android.app.Activity
import android.content.Intent
import android.net.Uri
import androidx.core.app.ActivityCompat
import com.example.get_smart_pos.mappers.BaseMapper
import com.example.get_smart_pos.mappers.CheckStatusMapper
import com.example.get_smart_pos.mappers.PaymentMapper
import com.example.get_smart_pos.mappers.RefundMapper
import io.flutter.plugin.common.PluginRegistry

class GetSmartPosDelegate(private val activity: Activity) : PluginRegistry.ActivityResultListener {
    companion object {
        private const val PAYMENT_REQUEST_CODE = 1
        private const val CHECK_STATUS_REQUEST_CODE = 2
        private const val REFUND_REQUEST_CODE = 3
        private val paymentMapper = PaymentMapper()
        private val checkStatusMapper = CheckStatusMapper()
        private val refundMapper = RefundMapper()
    }

    private object Deeplink {
        const val paymentV3 = "getnet://pagamento/v3/payment"
        const val checkStatus = "getnet://pagamento/v1/checkstatus"
        const val refund = "getnet://pagamento/v1/refund"
    }

    private var paymentResultCallback: (Result<PigeonPaymentResponse>) -> Unit = {}
    private var checkStatusResultCallback: (Result<PigeonCheckStatusResponse>) -> Unit = {}
    private var refundResultCallback: (Result<PigeonRefundResponse>) -> Unit = {}


    fun paymentV3(
        paymentRequest: PigeonPaymentRequest,
        resultCallback: (Result<PigeonPaymentResponse>) -> Unit
    ) {
        paymentResultCallback = resultCallback
        startDeeplink(
            paymentRequest,
            paymentMapper,
            Deeplink.paymentV3,
            PAYMENT_REQUEST_CODE,
        )
    }

    fun checkStatus(
        checkStatusRequest: PigeonCheckStatusRequest,
        resultCallback: (Result<PigeonCheckStatusResponse>) -> Unit
    ) {
        checkStatusResultCallback = resultCallback
        startDeeplink(
            checkStatusRequest,
            checkStatusMapper,
            Deeplink.checkStatus,
            CHECK_STATUS_REQUEST_CODE
        )
    }

    fun refund(
        refundRequest: PigeonRefundRequest,
        resultCallback: (Result<PigeonRefundResponse>) -> Unit
    ) {
        refundResultCallback = resultCallback
        startDeeplink(
            refundRequest,
            refundMapper,
            Deeplink.refund,
            REFUND_REQUEST_CODE,
        )
    }

    private fun <Request, Response> startDeeplink(
        request: Request,
        mapper: BaseMapper<Request, Response>,
        deeplink: String,
        requestCode: Int,
    ) {
        // Create a Bundle to store the paymentRequest data
        val bundle = mapper.requestToBundle(request)

        // Create an Intent with the deeplink URI and add the Bundle
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(deeplink)).apply {
            putExtras(bundle)
        }

        // Start the activity with the Intent and wait for the result
        ActivityCompat.startActivityForResult(activity, intent, requestCode, null)
    }

    private fun <Response> handleResult(
        resultCode: Int,
        data: Intent?,
        mapper: BaseMapper<*, Response>,
        resultCallback: (Result<Response>) -> Unit,
        onError: FlutterError,
    ) {
        if (resultCode == Activity.RESULT_OK) {
            // Extract the parameters from the intent and return the result
            val response = mapper.intentToResponse(data)
            resultCallback(Result.success(response))
        } else {
            resultCallback(Result.failure(onError))
        }
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

            REFUND_REQUEST_CODE -> {
                handleResult(
                    resultCode,
                    data,
                    refundMapper,
                    refundResultCallback,
                    FlutterError("REFUND_ERROR", "The refund cannot be completed"),
                )
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