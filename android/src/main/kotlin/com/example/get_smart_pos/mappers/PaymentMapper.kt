package com.example.get_smart_pos.mappers

import android.content.Intent
import android.os.Bundle
import com.example.get_smart_pos.PigeonPaymentRequest
import com.example.get_smart_pos.PigeonPaymentResponse

class PaymentMapper : BaseMapper<PigeonPaymentRequest, PigeonPaymentResponse> {
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
        const val paymentType = "paymentType"
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

    override fun requestToBundle(request: PigeonPaymentRequest): Bundle =
        Bundle().apply {
            with(request) {
                putStringIfNotNull(PaymentRequest.paymentType, paymentType)
                putStringIfNotNull(PaymentRequest.creditType, creditType)
                putStringIfNotNull(PaymentRequest.amount, amount)
                putStringIfNotNull(PaymentRequest.callerId, callerId)
                putStringIfNotNull(PaymentRequest.currencyPosition, currencyPosition)
                putStringIfNotNull(PaymentRequest.currencyCode, currencyCode)
                putStringIfNotNull(PaymentRequest.installments, installments)
                putStringIfNotNull(PaymentRequest.extraScreens, extraScreens)
                putStringIfNotNull(PaymentRequest.extraData, extraData)
                putBooleanIfNotNull(
                    PaymentRequest.disableTypedTransaction,
                    disableTypedTransaction
                )
                putBooleanIfNotNull(PaymentRequest.disableMagStripe, disableMagStripe)
                putBooleanIfNotNull(
                    PaymentRequest.disableCustomerSlipSpace,
                    disableCustomerSlipSpace
                )
                putBooleanIfNotNull(
                    PaymentRequest.allowPrintCurrentTransaction,
                    allowPrintCurrentTransaction
                )
                putStringIfNotNull(PaymentRequest.orderId, orderId)
                putStringIfNotNull(PaymentRequest.additionalInfo, additionalInfo)
            }
        }

    override fun intentToResponse(intent: Intent?): PigeonPaymentResponse {
        with(intent) {
            return PigeonPaymentResponse(
                result = getStringExtraOrEmpty(PaymentResponse.result),
                amount = getStringExtraOrEmpty(PaymentResponse.amount),
                callerId = getStringExtraOrEmpty(PaymentResponse.callerId),
                nsu = getStringExtraOrNull(PaymentResponse.nsu),
                nsuLastSuccessfullMessage = getStringExtraOrNull(PaymentResponse.nsuLastSuccessfullMessage),
                cvNumber = getStringExtraOrNull(PaymentResponse.cvNumber),
                inputType = getStringExtraOrEmpty(PaymentResponse.inputType),
                installments = getStringExtraOrEmpty(PaymentResponse.installments),
                type = getStringExtraOrEmpty(PaymentResponse.type),
                brand = getStringExtraOrNull(PaymentResponse.brand),
                gmtDateTime = getStringExtraOrNull(PaymentResponse.gmtDateTime),
                nsuLocal = getStringExtraOrNull(PaymentResponse.nsuLocal),
                authorizationCode = getStringExtraOrNull(PaymentResponse.authorizationCode),
                cardBin = getStringExtraOrNull(PaymentResponse.cardBin),
                cardLastDigits = getStringExtraOrNull(PaymentResponse.cardLastDigits),
                extraScreensResult = getStringExtraOrNull(PaymentResponse.extraScreensResult),
                cardholderName = getStringExtraOrNull(PaymentResponse.cardholderName),
                automationSlip = getStringExtraOrNull(PaymentResponse.automationSlip),
                printMerchantPreference = getBooleanExtraOrNull(PaymentResponse.printMerchantPreference),
                orderId = getStringExtraOrNull(PaymentResponse.orderId),
                pixPayloadResponse = getStringExtraOrNull(PaymentResponse.pixPayloadResponse),
                resultDetails = getStringExtraOrNull(PaymentResponse.resultDetails),
            )
        }
    }
}

