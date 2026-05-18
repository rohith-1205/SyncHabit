import 'dart:convert';

class IsarJsonConverter {
  static String mapToJson(Map<String, dynamic> map) => jsonEncode(map);
  static Map<String, dynamic> jsonToMap(String json) {
    try {
      return jsonDecode(json) as Map<String, dynamic>? ?? {};
    } catch (_) {
      return {};
    }
  }
}
