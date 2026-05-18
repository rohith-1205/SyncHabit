import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import '../core/config/app_config.dart';
import '../database/database.dart';
import '../firebase_options.dart';
import '../sync/strategies/background_sync_worker.dart';
import 'app.dart';

Future<void> bootstrap(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables safely
  try {
    await dotenv.load(fileName: '.env.${config.environment.name}');
    debugPrint('Successfully loaded environment: .env.${config.environment.name}');
  } catch (e) {
    debugPrint('DotEnv load warning (fallback to config): $e');
  }

  // Initialize Firebase gracefully with error handling and fallback
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      debugPrint('Firebase initialized successfully in bootstrap');
    } else {
      debugPrint('Firebase already initialized prior to bootstrap');
    }
  } catch (e, st) {
    debugPrint('Firebase initialization error in bootstrap: $e | StackTrace: $st');
    // Fallback logging for graceful bootstrap failure handling
  }

  final container = ProviderContainer(
    overrides: [
      appConfigProvider.overrideWithValue(config),
    ],
  );

  // Initialize Isar Local Database gracefully
  try {
    await container.read(databaseServiceProvider).init();
    debugPrint('Isar Local Database initialized successfully');
    
    // Start Cloud Synchronization Background Worker
    container.read(backgroundSyncWorkerProvider);
    debugPrint('BackgroundSyncWorker started successfully');
  } catch (e, st) {
    debugPrint('Database/Sync initialization error in bootstrap: $e | StackTrace: $st');
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const SyncHabitApp(),
    ),
  );
}
