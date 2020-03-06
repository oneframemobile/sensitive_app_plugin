package com.oneframe.flutter.sensitive_content

import android.app.Activity
import android.view.WindowManager
import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** SensitiveContentPlugin */
public class SensitiveContentPlugin(private val activity: Activity) : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "sensitive_content")
            channel.setMethodCallHandler(SensitiveContentPlugin(registrar.activity()))
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "hide") {
            activity.window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
            result.success(true)
        } else {
            result.notImplemented()
        }
    }
}
