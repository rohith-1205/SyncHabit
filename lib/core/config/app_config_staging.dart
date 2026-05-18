import 'dart:io';
import 'package:flutter/foundation.dart';
import 'app_config.dart';
import 'env.dart';

final stagingConfig = AppConfig(
  environment: Environment.staging,
  appName: 'SyncHabit Stage',
  apiBaseUrl: 'https://api.staging.synchabit.ai/v1',
  supabaseUrl: 'https://staging.supabase.synchabit.ai',
  supabaseAnonKey: Env.supabaseAnonKeyStaging,
  revenueCatApiKey: kIsWeb ? Env.revenueCatApiKeyAndroidStaging : (Platform.isIOS ? Env.revenueCatApiKeyIosStaging : Env.revenueCatApiKeyAndroidStaging),
  enableLogging: true,
);
