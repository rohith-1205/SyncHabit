import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/config/app_config_dev.dart';
import 'firebase_options.dart';
import 'main/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('Firebase initialized successfully in main_development');
  } catch (e, st) {
    debugPrint('Firebase initialization error in main: $e | $st');
  }

  bootstrap(devConfig);
}
