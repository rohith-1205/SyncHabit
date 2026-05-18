import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../errors/app_error.dart';
import '../utils/logger.dart';

class ApiClient {
  final http.Client _client;
  final AppConfig _config;
  final AppLogger _logger;

  ApiClient(this._config, this._logger, {http.Client? client}) : _client = client ?? http.Client();

  String get _baseUrl => _config.apiBaseUrl;

  Future<Map<String, dynamic>> get(String path) async {
    _logger.info('GET Request: $_baseUrl$path');
    try {
      final response = await _client.get(Uri.parse('$_baseUrl$path'));
      return _handleResponse(response);
    } catch (e) {
      _logger.error('GET Request failed', e);
      throw AppError('Network connection failed: $e');
    }
  }

  Future<Map<String, dynamic>> post(String path, {Map<String, dynamic>? body}) async {
    _logger.info('POST Request: $_baseUrl$path | Body: $body');
    try {
      final response = await _client.post(
        Uri.parse('$_baseUrl$path'),
        headers: {'Content-Type': 'application/json'},
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse(response);
    } catch (e) {
      _logger.error('POST Request failed', e);
      throw AppError('Network connection failed: $e');
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isNotEmpty) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
      return {};
    } else {
      _logger.warning('API Error Response: ${response.statusCode}');
      throw AppError('API Error: ${response.statusCode}', code: response.statusCode.toString());
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.watch(appConfigProvider), ref.watch(appLoggerProvider));
});
