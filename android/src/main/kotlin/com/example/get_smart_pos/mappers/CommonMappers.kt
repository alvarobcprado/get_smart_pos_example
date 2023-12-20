package com.example.get_smart_pos.mappers

import android.content.Intent
import android.os.Bundle


fun Bundle.putBooleanIfNotNull(key: String, value: Boolean?) {
    if (value != null) {
        putBoolean(key, value)
    }
}

fun Bundle.putStringIfNotNull(key: String, value: String?) {
    if (value != null) {
        putString(key, value)
    }
}

fun Intent?.getBooleanExtraOrNull(key: String): Boolean? {
    val hasExtra = this?.hasExtra(key) ?: false
    return if (hasExtra) {
        this?.getBooleanExtra(key, false)
    } else {
        null
    }
}

fun Intent?.getStringExtraOrEmpty(key: String): String {
    return this?.getStringExtra(key) ?: ""
}

fun Intent?.getStringExtraOrNull(key: String): String? {
    return this?.getStringExtra(key)
}
