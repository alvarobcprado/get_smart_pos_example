package com.example.get_smart_pos

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.core.app.ActivityCompat
import io.flutter.plugin.common.PluginRegistry

class GetSmartPosDelegate(private val activity: Activity) : PluginRegistry.ActivityResultListener {
    private val PAYMENT_REQUEST_CODE = 1001
    private var paymentResult: (Result<PigeonPaymentResponse>) -> Unit = {}

    fun paymentV3(
        paymentRequest: PigeonPaymentRequest,
        result: (Result<PigeonPaymentResponse>) -> Unit
    ) {
        paymentResult = result
        // Create a Bundle to store the paymentRequest data
        val bundle = processPaymentRequest(paymentRequest)

        // Create an Intent with the deeplink URI and add the Bundle
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse("getnet://pagamento/v3/payment")).apply {
            putExtras(bundle)
        }

        // Start the activity with the Intent and wait for the result
        ActivityCompat.startActivityForResult(activity, intent, PAYMENT_REQUEST_CODE, null)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == PAYMENT_REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                // Extract the parameters from the intent and return the result
                val paymentResponse = processPaymentResult(data)
                paymentResult(Result.success(paymentResponse))
            } else {
                paymentResult(
                    Result.failure(
                        FlutterError(
                            "PAYMENT_ERROR", "The payment cannot be completed",
                        ),
                    ),
                )
            }
            return true
        }
        return false
    }

    private fun processPaymentResult(intent: Intent?): PigeonPaymentResponse {
        // Extract the parameters from the intent using the getString method directly from the Intent
        return PigeonPaymentResponse(
            result = intent?.getStringExtra("result") ?: "",
            amount = intent?.getStringExtra("amount") ?: "",
            callerId = intent?.getStringExtra("callerId") ?: "",
            nsu = intent?.getStringExtra("nsu") ?: "",
            nsuLastSuccessfullMessage = intent?.getStringExtra("nsuLastSuccessfullMessage") ?: "",
            cvNumber = intent?.getStringExtra("cvNumber") ?: "",
            inputType = intent?.getStringExtra("inputType") ?: "",
            installments = intent?.getStringExtra("installments") ?: "",
            type = intent?.getStringExtra("type") ?: "",
            brand = intent?.getStringExtra("brand") ?: "",
            gmtDateTime = intent?.getStringExtra("gmtDateTime") ?: "",
            nsuLocal = intent?.getStringExtra("nsuLocal") ?: "",
            authorizationCode = intent?.getStringExtra("authorizationCode") ?: "",
            cardBin = intent?.getStringExtra("cardBin") ?: "",
            cardLastDigits = intent?.getStringExtra("cardLastDigits") ?: "",
            extraScreensResult = intent?.getStringExtra("extraScreensResult") ?: "",
            cardholderName = intent?.getStringExtra("cardholderName") ?: "",
            automationSlip = intent?.getStringExtra("automationSlip") ?: "",
            printMerchantPreference = intent?.getBooleanExtra("printMerchantPreference", false)
                ?: false,
            orderId = intent?.getStringExtra("orderId") ?: "",
            pixPayloadResponse = intent?.getStringExtra("pixPayloadResponse") ?: "",
            resultDetails = intent?.getStringExtra("resultDetails") ?: "",
        )
    }

    private fun processPaymentRequest(request: PigeonPaymentRequest): Bundle {
        // Create a Bundle to store the paymentRequest data
        return Bundle().apply {
            putString("type", request.type)
            putString("creditType", request.creditType)
            putString("amount", request.amount)
            putString("callerId", request.callerId)
            putString("currencyPosition", request.currencyPosition)
            putString("currencyCode", request.currencyCode)
            putString("installments", request.installments)
            putString("extraScreens", request.extraScreens)
            putString("extraData", request.extraData)
            putBoolean("disableTypedTransaction", request.disableTypedTransaction ?: false)
            putBoolean("disableMagStripe", request.disableMagStripe ?: false)
            putBoolean("disableCustomerSlipSpace", request.disableCustomerSlipSpace ?: false)
            putBoolean(
                "allowPrintCurrentTransaction",
                request.allowPrintCurrentTransaction ?: false
            )
            putString("orderId", request.orderId)
            putString("additionalInfo", request.additionalInfo)
        }
    }
}