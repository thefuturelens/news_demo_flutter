import 'package:get/get.dart';
import 'package:news_demo_flutter/views/home/detail_screen.dart';

class AppRoute {
  static const String detailScreen = "/detail_screen";

  static List<GetPage> pages = [
    GetPage(name: detailScreen, page: () => DetailScreen()),
  ];
}
