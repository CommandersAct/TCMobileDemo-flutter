package com.example.my_app

import android.os.Bundle
import android.os.PersistableBundle
import com.google.firebase.FirebaseApp
import com.tagcommander.lib.firebasedestination.TCFirebase
import com.tagcommander.lib.tcmobile_exampole.R
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        TCFirebase.getInstance().initialize(applicationContext)
    }
}
