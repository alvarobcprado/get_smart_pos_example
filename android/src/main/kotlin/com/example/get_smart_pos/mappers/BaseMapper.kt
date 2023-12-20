package com.example.get_smart_pos.mappers

import android.content.Intent
import android.os.Bundle

interface BaseMapper<Request, Response> {
    fun requestToBundle(request: Request): Bundle
    fun intentToResponse(intent: Intent?): Response
}