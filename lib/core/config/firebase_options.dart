import 'package:flutter/foundation.dart';
// If firebase_core is used, import it. Here we define a mock/stub structure or standard FirebaseOptions class
// to ensure clean compilation and flavor-based options.

class DefaultFirebaseOptions {
  static get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const web = /* FirebaseOptions(...) */ {
    'apiKey': 'AIzaSyMockKeyForWebSyncHabit12345',
    'appId': '1:1234567890:web:abcdef123456',
    'messagingSenderId': '1234567890',
    'projectId': 'synchabit-cyber-os',
  };

  static const android = {
    'apiKey': 'AIzaSyMockKeyForAndroidSyncHabit12345',
    'appId': '1:1234567890:android:abcdef123456',
    'messagingSenderId': '1234567890',
    'projectId': 'synchabit-cyber-os',
    'storageBucket': 'synchabit-cyber-os.appspot.com',
  };

  static const ios = {
    'apiKey': 'AIzaSyMockKeyForIosSyncHabit12345',
    'appId': '1:1234567890:ios:abcdef123456',
    'messagingSenderId': '1234567890',
    'projectId': 'synchabit-cyber-os',
    'storageBucket': 'synchabit-cyber-os.appspot.com',
    'iosBundleId': 'com.synchabit.app',
  };

  static const macos = {
    'apiKey': 'AIzaSyMockKeyForMacosSyncHabit12345',
    'appId': '1:1234567890:ios:abcdef123456',
    'messagingSenderId': '1234567890',
    'projectId': 'synchabit-cyber-os',
    'storageBucket': 'synchabit-cyber-os.appspot.com',
    'iosBundleId': 'com.synchabit.app',
  };
}
