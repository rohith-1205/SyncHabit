import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/flavor_config.dart';
import '../errors/app_error.dart';

class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  String get _baseUrl => FlavorConfig.instance.apiEndpoint;

  Future<Map<String, dynamic>> get(String path) async {
    try {
      final response = await _client.get(Uri.parse('$_baseUrl$path'));
      return _handleResponse(response);
    } catch (e) {
      throw AppError('Network connection failed: $e');
    }
  }

  Future<Map<String, dynamic>> post(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await _client.post(
        Uri.parse('$_baseUrl$path'),
        headers: {'Content-Type': 'application/json'},
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse(response);
    } catch (e) {
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
      throw AppError('API Error: ${response.statusCode}', code: response.statusCode.toString());
    }
  }
}
