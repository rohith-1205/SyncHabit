import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/logger.dart';

enum ConnectivityStatus { online, offline, unstable }

class ConnectivityService extends StateNotifier<ConnectivityStatus> {
  final AppLogger _logger;
  Timer? _timer;
  bool _isChecking = false;

  ConnectivityService(this._logger) : super(ConnectivityStatus.online) {
    _startMonitoring();
  }

  void _startMonitoring() {
    // Initial check
    checkConnectivity();

    // Low battery/network-efficient periodic check (every 15 seconds)
    _timer = Timer.periodic(const Duration(seconds: 15), (_) {
      checkConnectivity();
    });
  }

  Future<void> checkConnectivity() async {
    if (_isChecking) return;
    _isChecking = true;

    try {
      final result = await InternetAddress.lookup('example.com').timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (state != ConnectivityStatus.online) {
          _logger.info('Network connectivity restored: ONLINE');
          state = ConnectivityStatus.online;
        }
      } else {
        if (state != ConnectivityStatus.offline) {
          _logger.warning('Network connectivity lost: OFFLINE');
          state = ConnectivityStatus.offline;
        }
      }
    } on SocketException catch (_) {
      if (state != ConnectivityStatus.offline) {
        _logger.warning('SocketException: Network connectivity lost: OFFLINE');
        state = ConnectivityStatus.offline;
      }
    } on TimeoutException catch (_) {
      if (state != ConnectivityStatus.unstable) {
        _logger.warning('TimeoutException: Network connectivity UNSTABLE');
        state = ConnectivityStatus.unstable;
      }
    } catch (e) {
      if (state != ConnectivityStatus.offline) {
        _logger.warning('Unknown error during connectivity check: $e');
        state = ConnectivityStatus.offline;
      }
    } finally {
      _isChecking = false;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final connectivityServiceProvider = StateNotifierProvider<ConnectivityService, ConnectivityStatus>((ref) {
  return ConnectivityService(ref.watch(appLoggerProvider));
});
