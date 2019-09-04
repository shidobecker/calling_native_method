package jp.shido.calling_native_method

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    companion object {
        const val CHANNEL = "jp.shido.channel"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            val fromClass = when {
                call.method == "showNativeClass" -> NativeClass().getResult()
                call.method == "showNativeClass2" -> NativeClass2().getNativeClass2()
                else -> result.notImplemented()
            }
            result.success(fromClass)

        }
    }
}
