enum Flavor { development, staging, production }

class FlavorConfig {
  final Flavor flavor;
  final String appName;
  final String packageName;
  final String apiEndpoint;

  static FlavorConfig? _instance;

  FlavorConfig._internal({
    required this.flavor,
    required this.appName,
    required this.packageName,
    required this.apiEndpoint,
  });

  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception('FlavorConfig has not been initialized. Please call FlavorConfig.initialize() first.');
    }
    return _instance!;
  }

  static void initialize({
    required Flavor flavor,
    required String appName,
    required String packageName,
    required String apiEndpoint,
  }) {
    _instance = FlavorConfig._internal(
      flavor: flavor,
      appName: appName,
      packageName: packageName,
      apiEndpoint: apiEndpoint,
    );
  }

  bool get isDevelopment => flavor == Flavor.development;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProduction => flavor == Flavor.production;
}
