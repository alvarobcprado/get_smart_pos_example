package com.example.get_smart_pos.mappers

import android.content.Intent
import android.os.Bundle
import com.example.get_smart_pos.PigeonCheckStatusRequest
import com.example.get_smart_pos.PigeonCheckStatusResponse

class CheckStatusMapper : BaseMapper<PigeonCheckStatusRequest, PigeonCheckStatusResponse> {
    override fun requestToBundle(request: PigeonCheckStatusRequest): Bundle = Bundle().apply {
        with(request) {
            putStringIfNotNull("callerId", callerId)
            putBooleanIfNotNull("allowPrintCurrentTransaction", allowPrintCurrentTransaction)
        }
    }

    override fun intentToResponse(intent: Intent?): PigeonCheckStatusResponse {
        with(intent) {
            return PigeonCheckStatusResponse(
                result = getStringExtraOrEmpty("result"),
                amount = getStringExtraOrNull("amount"),
                callerId = getStringExtraOrNull("callerId"),
                nsu = getStringExtraOrNull("nsu"),
                nsuLastSuccessfullMessage = getStringExtraOrNull("nsuLastSuccessfullMessage"),
                cvNumber = getStringExtraOrNull("cvNumber"),
                inputType = getStringExtraOrNull("inputType"),
                installments = getStringExtraOrNull("installments"),
                type = getStringExtraOrNull("type"),
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
                refunded = getStringExtraOrNull("refunded")
            )
        }
    }
}