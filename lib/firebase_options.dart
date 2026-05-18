import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.windows:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.linux:
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyMockKeyForWebSyncHabit12345',
    appId: '1:1234567890:web:abcdef123456',
    messagingSenderId: '1234567890',
    projectId: 'synchabit-cyber-os',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLd-Ete1-E7tZJY-8eRLX7onWABRn_xuA',
    appId: '1:182981373013:android:5156fabbe2daa52f2d78dc',
    messagingSenderId: '182981373013',
    projectId: 'synchabit-4cfa4',
    storageBucket: 'synchabit-4cfa4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBv0iG-8JdV8EwxzrXY2oVkhVV86U7jcqs',
    appId: '1:182981373013:ios:658e7a191eb0f6d52d78dc',
    messagingSenderId: '182981373013',
    projectId: 'synchabit-4cfa4',
    storageBucket: 'synchabit-4cfa4.firebasestorage.app',
    iosBundleId: 'com.synchabit.synchabit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyMockKeyForMacosSyncHabit12345',
    appId: '1:1234567890:ios:abcdef123456',
    messagingSenderId: '1234567890',
    projectId: 'synchabit-cyber-os',
    storageBucket: 'synchabit-cyber-os.appspot.com',
    iosBundleId: 'com.synchabit.app',
  );
}