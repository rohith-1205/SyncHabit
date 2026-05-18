import 'dart:io';
import 'package:flutter/foundation.dart';
import 'app_config.dart';
import 'env.dart';

final devConfig = AppConfig(
  environment: Environment.development,
  appName: 'SyncHabit Dev',
  apiBaseUrl: 'https://api.dev.synchabit.ai/v1',
  supabaseUrl: 'https://dev.supabase.synchabit.ai',
  supabaseAnonKey: Env.supabaseAnonKeyDev,
  revenueCatApiKey: kIsWeb ? Env.revenueCatApiKeyAndroidDev : (Platform.isIOS ? Env.revenueCatApiKeyIosDev : Env.revenueCatApiKeyAndroidDev),
  enableLogging: true,
);
