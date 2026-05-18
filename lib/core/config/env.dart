import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment configuration wrapper loading securely from dotenv.
class Env {
  static String get revenueCatApiKeyAndroidDev => 
      dotenv.env['REVENUECAT_API_KEY_ANDROID_DEV'] ?? 'goog_dev_mock_revenuecat_api_key';
  static String get revenueCatApiKeyAndroidStaging => 
      dotenv.env['REVENUECAT_API_KEY_ANDROID_STAGING'] ?? 'goog_staging_mock_revenuecat_api_key';
  static String get revenueCatApiKeyAndroidProd => 
      dotenv.env['REVENUECAT_API_KEY_ANDROID_PROD'] ?? 'goog_prod_mock_revenuecat_api_key';

  static String get revenueCatApiKeyIosDev => 
      dotenv.env['REVENUECAT_API_KEY_IOS_DEV'] ?? 'appl_dev_mock_revenuecat_api_key';
  static String get revenueCatApiKeyIosStaging => 
      dotenv.env['REVENUECAT_API_KEY_IOS_STAGING'] ?? 'appl_staging_mock_revenuecat_api_key';
  static String get revenueCatApiKeyIosProd => 
      dotenv.env['REVENUECAT_API_KEY_IOS_PROD'] ?? 'appl_prod_mock_revenuecat_api_key';

  static String get supabaseAnonKeyDev => 
      dotenv.env['SUPABASE_ANON_KEY_DEV'] ?? 'dev_anon_key_mock_2026';
  static String get supabaseAnonKeyStaging => 
      dotenv.env['SUPABASE_ANON_KEY_STAGING'] ?? 'staging_anon_key_mock_2026';
  static String get supabaseAnonKeyProd => 
      dotenv.env['SUPABASE_ANON_KEY_PROD'] ?? 'prod_anon_key_mock_2026';

  static String get aiEngineApiKey => 
      dotenv.env['AI_ENGINE_API_KEY'] ?? 'ai_engine_mock_secret_key_2026';
}
