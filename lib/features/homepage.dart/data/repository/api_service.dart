import 'package:http/http.dart' as http;

class ApiServiceProduct {
  static Future getProduct({String? url}) async {
    try {
      final response = await http.get(Uri.parse(url ?? ''));
      return response;
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
}

class ApiServiceCategory {
  static Future getCategory({String? url}) async {
    try {
      final response = await http.get(Uri.parse(url ?? ''));
      return response;
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
}

class ApiServiceCategoryProducts {
  static Future getCategoryProducts({String? url}) async {
    try {
      final response = await http.get(Uri.parse(url ?? ''));
      return response;
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
}
