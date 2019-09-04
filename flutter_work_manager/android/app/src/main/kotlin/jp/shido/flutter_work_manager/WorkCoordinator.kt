package jp.shido.flutter_work_manager


import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant

class WorkCoordinator : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {

    override fun onCreate() {
        super.onCreate()
        WorkmanagerPlugin.setPluginRegistrantCallback(this)
    }

    override fun registerWith(reg: PluginRegistry?) {
        GeneratedPluginRegistrant.registerWith(reg)

    }
}