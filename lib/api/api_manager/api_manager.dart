import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future getApi(
    Uri url,
  ) async {
    http.Response response;

    try {
      response = await http.get(url);

      return response;
    } catch (e) {
      if (kDebugMode) {}
    } finally {}
  }
}
