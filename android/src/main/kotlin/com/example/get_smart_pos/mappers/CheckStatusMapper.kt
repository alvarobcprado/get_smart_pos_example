package com.example.get_smart_pos.mappers

import android.content.Intent
import android.os.Bundle
import com.example.get_smart_pos.PigeonCheckStatusRequest
import com.example.get_smart_pos.PigeonCheckStatusResponse

class CheckStatusMapper : BaseMapper<PigeonCheckStatusRequest, PigeonCheckStatusResponse> {
    private object CheckStatusResponse {
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
        const val refunded = "refunded"
    }

    private object CheckStatusRequest {
        const val callerId = "callerId"
        const val allowPrintCurrentTransaction = "allowPrintCurrentTransaction"
    }

    override fun requestToBundle(request: PigeonCheckStatusRequest): Bundle = Bundle().apply {
        with(request) {
            putStringIfNotNull(CheckStatusRequest.callerId, callerId)
            putBooleanIfNotNull(
                CheckStatusRequest.allowPrintCurrentTransaction,
                allowPrintCurrentTransaction
            )
        }
    }

    override fun intentToResponse(intent: Intent?): PigeonCheckStatusResponse {
        with(intent) {
            return PigeonCheckStatusResponse(
                result = getStringExtraOrEmpty(CheckStatusResponse.result),
                amount = getStringExtraOrNull(CheckStatusResponse.amount),
                callerId = getStringExtraOrNull(CheckStatusResponse.callerId),
                nsu = getStringExtraOrNull(CheckStatusResponse.nsu),
                nsuLastSuccessfullMessage = getStringExtraOrNull(CheckStatusResponse.nsuLastSuccessfullMessage),
                cvNumber = getStringExtraOrNull(CheckStatusResponse.cvNumber),
                inputType = getStringExtraOrNull(CheckStatusResponse.inputType),
                installments = getStringExtraOrNull(CheckStatusResponse.installments),
                type = getStringExtraOrNull(CheckStatusResponse.type),
                brand = getStringExtraOrNull(CheckStatusResponse.brand),
                gmtDateTime = getStringExtraOrNull(CheckStatusResponse.gmtDateTime),
                nsuLocal = getStringExtraOrNull(CheckStatusResponse.nsuLocal),
                authorizationCode = getStringExtraOrNull(CheckStatusResponse.authorizationCode),
                cardBin = getStringExtraOrNull(CheckStatusResponse.cardBin),
                cardLastDigits = getStringExtraOrNull(CheckStatusResponse.cardLastDigits),
                extraScreensResult = getStringExtraOrNull(CheckStatusResponse.extraScreensResult),
                cardholderName = getStringExtraOrNull(CheckStatusResponse.cardholderName),
                automationSlip = getStringExtraOrNull(CheckStatusResponse.automationSlip),
                printMerchantPreference = getBooleanExtraOrNull(CheckStatusResponse.printMerchantPreference),
                orderId = getStringExtraOrNull(CheckStatusResponse.orderId),
                pixPayloadResponse = getStringExtraOrNull(CheckStatusResponse.pixPayloadResponse),
                resultDetails = getStringExtraOrNull(CheckStatusResponse.resultDetails),
                refunded = getStringExtraOrNull(CheckStatusResponse.refunded)
            )
        }
    }
}