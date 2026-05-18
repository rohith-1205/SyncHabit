import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Environment { development, staging, production }

class AppConfig {
  final Environment environment;
  final String appName;
  final String apiBaseUrl;
  final String supabaseUrl;
  final String supabaseAnonKey;
  final String revenueCatApiKey;
  final bool enableLogging;

  const AppConfig({
    required this.environment,
    required this.appName,
    required this.apiBaseUrl,
    required this.supabaseUrl,
    required this.supabaseAnonKey,
    required this.revenueCatApiKey,
    required this.enableLogging,
  });

  bool get isDevelopment => environment == Environment.development;
  bool get isStaging => environment == Environment.staging;
  bool get isProduction => environment == Environment.production;
}

final appConfigProvider = Provider<AppConfig>((ref) {
  throw Exception('appConfigProvider has not been initialized. Please override it in ProviderScope.');
});
