import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/logger.dart';
import '../engine/sync_engine.dart';
import '../services/connectivity_service.dart';

class BackgroundSyncWorker {
  final SyncEngine _syncEngine;
  final ConnectivityStatus _connectivityStatus;
  final AppLogger _logger;
  Timer? _periodicTimer;

  BackgroundSyncWorker(this._syncEngine, this._connectivityStatus, this._logger);

  /// Start background synchronization worker
  void start() {
    _logger.info('Starting BackgroundSyncWorker...');

    // Trigger immediately if online
    if (_connectivityStatus == ConnectivityStatus.online) {
      _syncEngine.syncAll();
    }

    // Periodic sync throttling/batching (every 2 minutes)
    _periodicTimer = Timer.periodic(const Duration(minutes: 2), (_) {
      if (_connectivityStatus == ConnectivityStatus.online) {
        _logger.info('Periodic background sync triggered.');
        _syncEngine.syncAll();
      } else {
        _logger.info('Periodic background sync skipped: Device is offline or connection is unstable.');
      }
    });
  }

  /// Stop background synchronization worker
  void stop() {
    _periodicTimer?.cancel();
    _logger.info('BackgroundSyncWorker stopped.');
  }
}

final backgroundSyncWorkerProvider = Provider<BackgroundSyncWorker>((ref) {
  final worker = BackgroundSyncWorker(
    ref.watch(syncEngineProvider),
    ref.watch(connectivityServiceProvider),
    ref.watch(appLoggerProvider),
  );

  // Auto-start worker when provider is observed
  worker.start();
  ref.onDispose(() => worker.stop());

  return worker;
});
