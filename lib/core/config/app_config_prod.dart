import 'dart:io';
import 'package:flutter/foundation.dart';
import 'app_config.dart';
import 'env.dart';

final prodConfig = AppConfig(
  environment: Environment.production,
  appName: 'SyncHabit',
  apiBaseUrl: 'https://api.synchabit.ai/v1',
  supabaseUrl: 'https://supabase.synchabit.ai',
  supabaseAnonKey: Env.supabaseAnonKeyProd,
  revenueCatApiKey: kIsWeb ? Env.revenueCatApiKeyAndroidProd : (Platform.isIOS ? Env.revenueCatApiKeyIosProd : Env.revenueCatApiKeyAndroidProd),
  enableLogging: false,
);
