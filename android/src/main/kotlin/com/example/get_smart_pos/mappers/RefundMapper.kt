package com.example.get_smart_pos.mappers

import android.content.Intent
import android.os.Bundle
import com.example.get_smart_pos.PigeonRefundRequest
import com.example.get_smart_pos.PigeonRefundResponse

class RefundMapper: BaseMapper<PigeonRefundRequest, PigeonRefundResponse>{
    override fun requestToBundle(request: PigeonRefundRequest): Bundle = Bundle().apply {
        with(request){
            putStringIfNotNull("amount", amount)
            putStringIfNotNull("cvNumber", cvNumber)
            putStringIfNotNull("transactionDate", transactionDate)
            putStringIfNotNull("originTerminal", originTerminal)
            putBooleanIfNotNull("allowPrintCurrentTransaction", allowPrintCurrentTransaction)
        }
    }

    override fun intentToResponse(intent: Intent?): PigeonRefundResponse = with(intent){
        PigeonRefundResponse(
            result = getStringExtraOrEmpty("result"),
            resultDetails = getStringExtraOrEmpty("resultDetails"),
            amount = getStringExtraOrEmpty("amount"),
            gmtDateTime = getStringExtraOrEmpty("gmtDateTime"),
            nsu = getStringExtraOrEmpty("nsu"),
            nsuLocal = getStringExtraOrEmpty("nsuLocal"),
            nsuLastSuccessfullMessage = getStringExtraOrEmpty("nsuLastSuccessfullMessage"),
            authorizationCode = getStringExtraOrEmpty("authorizationCode"),
            cardBin = getStringExtraOrEmpty("cardBin"),
            cardLastDigits = getStringExtraOrEmpty("cardLastDigits"),
            refundTransactionDate = getStringExtraOrEmpty("refundTransactionDate"),
            refundCvNumber = getStringExtraOrEmpty("refundCvNumber"),
            refundOriginTerminal = getStringExtraOrEmpty("refundOriginTerminal"),
            cardholderName = getStringExtraOrEmpty("cardholderName"),
            automationSlip = getStringExtraOrEmpty("automationSlip"),
        )
    }
}