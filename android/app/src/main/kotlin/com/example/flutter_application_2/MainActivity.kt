package com.example.flutter_application_2

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setLocale("ru_RU") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("4d2e008b-f4a1-4c24-b3a0-dc184ae6fb36") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}