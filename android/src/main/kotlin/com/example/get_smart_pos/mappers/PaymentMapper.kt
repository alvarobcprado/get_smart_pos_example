package com.example.get_smart_pos.mappers

import android.content.Intent
import android.os.Bundle
import com.example.get_smart_pos.PigeonPaymentRequest
import com.example.get_smart_pos.PigeonPaymentResponse

class PaymentMapper : BaseMapper<PigeonPaymentRequest, PigeonPaymentResponse> {
    override fun requestToBundle(request: PigeonPaymentRequest): Bundle =
        Bundle().apply {
            with(request) {
                putStringIfNotNull("paymentType", paymentType)
                putStringIfNotNull("creditType", creditType)
                putStringIfNotNull("amount", amount)
                putStringIfNotNull("callerId", callerId)
                putStringIfNotNull("currencyPosition", currencyPosition)
                putStringIfNotNull("currencyCode", currencyCode)
                putStringIfNotNull("installments", installments)
                putStringIfNotNull("extraScreens", extraScreens)
                putStringIfNotNull("extraData", extraData)
                putBooleanIfNotNull("disableTypedTransaction", disableTypedTransaction)
                putBooleanIfNotNull("disableMagStripe", disableMagStripe)
                putBooleanIfNotNull("disableCustomerSlipSpace", disableCustomerSlipSpace)
                putBooleanIfNotNull("allowPrintCurrentTransaction", allowPrintCurrentTransaction)
                putStringIfNotNull("orderId", orderId)
                putStringIfNotNull("additionalInfo", additionalInfo)
            }
        }

    override fun intentToResponse(intent: Intent?): PigeonPaymentResponse {
        with(intent) {
            return PigeonPaymentResponse(
                result = getStringExtraOrEmpty("result"),
                amount = getStringExtraOrEmpty("amount"),
                callerId = getStringExtraOrEmpty("callerId"),
                nsu = getStringExtraOrNull("nsu"),
                nsuLastSuccessfullMessage = getStringExtraOrNull("nsuLastSuccessfullMessage"),
                cvNumber = getStringExtraOrNull("cvNumber"),
                inputType = getStringExtraOrEmpty("inputType"),
                installments = getStringExtraOrEmpty("installments"),
                type = getStringExtraOrEmpty("type"),
                brand = getStringExtraOrNull("brand"),
                gmtDateTime = getStringExtraOrNull("gmtDateTime"),
                nsuLocal = getStringExtraOrNull("nsuLocal"),
                authorizationCode = getStringExtraOrNull("authorizationCode"),
                cardBin = getStringExtraOrNull("cardBin"),
                cardLastDigits = getStringExtraOrNull("cardLastDigits"),
                extraScreensResult = getStringExtraOrNull("extraScreensResult"),
                cardholderName = getStringExtraOrNull("cardholderName"),
                automationSlip = getStringExtraOrNull("automationSlip"),
                printMerchantPreference = getBooleanExtraOrNull("printMerchantPreference"),
                orderId = getStringExtraOrNull("orderId"),
                pixPayloadResponse = getStringExtraOrNull("pixPayloadResponse"),
                resultDetails = getStringExtraOrNull("resultDetails"),
            )
        }
    }
}

