import 'package:flutter/foundation.dart';
import 'package:news_demo_flutter/api/api_manager/api_manager.dart';

class HomeApi {
  static dashboard() {
    try {
      return ApiManager.getApi(
        Uri.parse(
            "https://newsapi.org/v2/everything?q=tesla&from=2024-04-01&sortBy=publishedAt&apiKey=e077a7b5abc545778f58c29f6de0a464"),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {}
  }
}
