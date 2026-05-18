import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ConnectivityService {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
}

class ConnectivityServiceImpl implements ConnectivityService {
  @override
  Future<bool> get isConnected async => true; // Default mock/wrapper until connectivity_plus is integrated

  @override
  Stream<bool> get onConnectivityChanged => Stream.value(true);
}

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityServiceImpl();
});
