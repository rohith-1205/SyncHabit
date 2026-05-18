/// Envied configuration simulation/wrapper for environment variables.
/// In a standard workflow with build_runner, this would be generated via @Envied().
class Env {
  static const String revenueCatApiKeyAndroidDev = 'goog_dev_mock_revenuecat_api_key';
  static const String revenueCatApiKeyAndroidStaging = 'goog_staging_mock_revenuecat_api_key';
  static const String revenueCatApiKeyAndroidProd = 'goog_prod_mock_revenuecat_api_key';

  static const String revenueCatApiKeyIosDev = 'appl_dev_mock_revenuecat_api_key';
  static const String revenueCatApiKeyIosStaging = 'appl_staging_mock_revenuecat_api_key';
  static const String revenueCatApiKeyIosProd = 'appl_prod_mock_revenuecat_api_key';

  static const String supabaseAnonKeyDev = 'dev_anon_key_mock_2026';
  static const String supabaseAnonKeyStaging = 'staging_anon_key_mock_2026';
  static const String supabaseAnonKeyProd = 'prod_anon_key_mock_2026';

  static const String aiEngineApiKey = 'ai_engine_mock_secret_key_2026';
}
