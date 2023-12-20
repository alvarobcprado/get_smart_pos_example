package com.example.get_smart_pos.mappers

import android.content.Intent
import android.os.Bundle
import com.example.get_smart_pos.PigeonPaymentRequest
import com.example.get_smart_pos.PigeonPaymentResponse

class PaymentMapper {
    private object PaymentResponse {
        const val result = "result"
        const val amount = "amount"
        const val callerId = "callerId"
        const val nsu = "nsu"
        const val nsuLastSuccessfullMessage = "nsuLastSuccessfullMessage"
        const val cvNumber = "cvNumber"
        const val inputType = "inputType"
        const val installments = "installments"
        const val type = "type"
        const val brand = "brand"
        const val gmtDateTime = "gmtDateTime"
        const val nsuLocal = "nsuLocal"
        const val authorizationCode = "authorizationCode"
        const val cardBin = "cardBin"
        const val cardLastDigits = "cardLastDigits"
        const val extraScreensResult = "extraScreensResult"
        const val cardholderName = "cardholderName"
        const val automationSlip = "automationSlip"
        const val printMerchantPreference = "printMerchantPreference"
        const val orderId = "orderId"
        const val pixPayloadResponse = "pixPayloadResponse"
        const val resultDetails = "resultDetails"
    }

    private object PaymentRequest {
        const val type = "type"
        const val creditType = "creditType"
        const val amount = "amount"
        const val callerId = "callerId"
        const val currencyPosition = "currencyPosition"
        const val currencyCode = "currencyCode"
        const val installments = "installments"
        const val extraScreens = "extraScreens"
        const val extraData = "extraData"
        const val disableTypedTransaction = "disableTypedTransaction"
        const val disableMagStripe = "disableMagStripe"
        const val disableCustomerSlipSpace = "disableCustomerSlipSpace"
        const val allowPrintCurrentTransaction = "allowPrintCurrentTransaction"
        const val orderId = "orderId"
        const val additionalInfo = "additionalInfo"
    }

    companion object {
        /// Create a Bundle to store the paymentRequest data
        fun paymentRequestToBundle(request: PigeonPaymentRequest): Bundle =
            Bundle().apply {
                with(request) {
                    putString(PaymentRequest.type, type)
                    putString(PaymentRequest.creditType, creditType)
                    putString(PaymentRequest.amount, amount)
                    putString(PaymentRequest.callerId, callerId)
                    putString(PaymentRequest.currencyPosition, currencyPosition)
                    putString(PaymentRequest.currencyCode, currencyCode)
                    putString(PaymentRequest.installments, installments)
                    putString(PaymentRequest.extraScreens, extraScreens)
                    putString(PaymentRequest.extraData, extraData)
                    putBoolean(
                        PaymentRequest.disableTypedTransaction,
                        disableTypedTransaction ?: false
                    )
                    putBoolean(PaymentRequest.disableMagStripe, disableMagStripe ?: false)
                    putBoolean(
                        PaymentRequest.disableCustomerSlipSpace,
                        disableCustomerSlipSpace ?: false
                    )
                    putBoolean(
                        PaymentRequest.allowPrintCurrentTransaction,
                        allowPrintCurrentTransaction ?: false
                    )
                    putString(PaymentRequest.orderId, orderId)
                    putString(PaymentRequest.additionalInfo, additionalInfo)
                }
            }

        /// Extract the parameters from the intent returned by the Payment Deeplink
        fun intentToPaymentResponse(intent: Intent?): PigeonPaymentResponse {
            val getStringExtra: (String) -> String = { key ->
                intent?.getStringExtra(key) ?: ""
            }

            val getBooleanExtra: (String) -> Boolean = { key ->
                intent?.getBooleanExtra(key, false) ?: false
            }

            return PigeonPaymentResponse(
                result = getStringExtra(PaymentResponse.result),
                amount = getStringExtra(PaymentResponse.amount),
                callerId = getStringExtra(PaymentResponse.callerId),
                nsu = getStringExtra(PaymentResponse.nsu),
                nsuLastSuccessfullMessage = getStringExtra(PaymentResponse.nsuLastSuccessfullMessage),
                cvNumber = getStringExtra(PaymentResponse.cvNumber),
                inputType = getStringExtra(PaymentResponse.inputType),
                installments = getStringExtra(PaymentResponse.installments),
                type = getStringExtra(PaymentResponse.type),
                brand = getStringExtra(PaymentResponse.brand),
                gmtDateTime = getStringExtra(PaymentResponse.gmtDateTime),
                nsuLocal = getStringExtra(PaymentResponse.nsuLocal),
                authorizationCode = getStringExtra(PaymentResponse.authorizationCode),
                cardBin = getStringExtra(PaymentResponse.cardBin),
                cardLastDigits = getStringExtra(PaymentResponse.cardLastDigits),
                extraScreensResult = getStringExtra(PaymentResponse.extraScreensResult),
                cardholderName = getStringExtra(PaymentResponse.cardholderName),
                automationSlip = getStringExtra(PaymentResponse.automationSlip),
                printMerchantPreference = getBooleanExtra(PaymentResponse.printMerchantPreference),
                orderId = getStringExtra(PaymentResponse.orderId),
                pixPayloadResponse = getStringExtra(PaymentResponse.pixPayloadResponse),
                resultDetails = getStringExtra(PaymentResponse.resultDetails),
            )
        }
    }
}
