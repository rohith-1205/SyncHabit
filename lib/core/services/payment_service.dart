import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../utils/logger.dart';

class PaymentService {
  final AppConfig _config;
  final AppLogger _logger;

  PaymentService(this._config, this._logger);

  Future<void> initialize() async {
    _logger.info('PaymentService initialized with RevenueCat API Key: ${_config.revenueCatApiKey}');
  }

  Future<bool> purchasePackage(String packageId) async {
    _logger.info('Purchasing package: $packageId in ${_config.environment.name} mode');
    // Simulate successful purchase
    await Future.delayed(const Duration(milliseconds: 800));
    return true;
  }

  Future<bool> restorePurchases() async {
    _logger.info('Restoring purchases in ${_config.environment.name} mode');
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}

final paymentServiceProvider = Provider<PaymentService>((ref) {
  return PaymentService(ref.watch(appConfigProvider), ref.watch(appLoggerProvider));
});
