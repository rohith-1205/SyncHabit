import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  static FirebaseOptions get web => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_WEB'] ?? 'your_firebase_web_api_key',
    appId: dotenv.env['FIREBASE_APP_ID_WEB'] ?? '1:1234567890:web:abcdef123456',
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_WEB'] ?? '1234567890',
    projectId: dotenv.env['FIREBASE_PROJECT_ID_WEB'] ?? 'synchabit-cyber-os',
  );

  static FirebaseOptions get android => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_ANDROID'] ?? 'your_firebase_android_api_key',
    appId: dotenv.env['FIREBASE_APP_ID_ANDROID'] ?? '1:182981373013:android:5156fabbe2daa52f2d78dc',
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_ANDROID'] ?? '182981373013',
    projectId: dotenv.env['FIREBASE_PROJECT_ID_ANDROID'] ?? 'synchabit-4cfa4',
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_ANDROID'] ?? 'synchabit-4cfa4.firebasestorage.app',
  );

  static FirebaseOptions get ios => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_IOS'] ?? 'your_firebase_ios_api_key',
    appId: dotenv.env['FIREBASE_APP_ID_IOS'] ?? '1:182981373013:ios:658e7a191eb0f6d52d78dc',
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_IOS'] ?? '182981373013',
    projectId: dotenv.env['FIREBASE_PROJECT_ID_IOS'] ?? 'synchabit-4cfa4',
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_IOS'] ?? 'synchabit-4cfa4.firebasestorage.app',
    iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID'] ?? 'com.synchabit.synchabit',
  );

  static FirebaseOptions get macos => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_MACOS'] ?? 'your_firebase_macos_api_key',
    appId: dotenv.env['FIREBASE_APP_ID_MACOS'] ?? '1:1234567890:ios:abcdef123456',
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_MACOS'] ?? '1234567890',
    projectId: dotenv.env['FIREBASE_PROJECT_ID_MACOS'] ?? 'synchabit-cyber-os',
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_MACOS'] ?? 'synchabit-cyber-os.appspot.com',
    iosBundleId: dotenv.env['FIREBASE_MACOS_BUNDLE_ID'] ?? 'com.synchabit.app',
  );
}