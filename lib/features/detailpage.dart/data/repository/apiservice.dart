import 'package:http/http.dart' as http;

class ApiServiceProductDetail {
  static Future getDetail({String? url}) async {
    try {
      final response = await http.get(Uri.parse(url ?? ''));
      return response;
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
}
