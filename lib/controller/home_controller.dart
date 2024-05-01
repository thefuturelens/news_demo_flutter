import 'package:get/get.dart';
import 'package:news_demo_flutter/config/icon_config.dart';
import 'package:news_demo_flutter/config/string_config.dart';

class HomeController extends GetxController {
  RxInt isSelected = 0.obs;
  RxList allTab = [
    StringConfig.news,
    StringConfig.favs,
  ].obs;
  RxList allTabIcon = [
    IconConfig.newsIcon,
    IconConfig.favIcon,
  ].obs;
}
