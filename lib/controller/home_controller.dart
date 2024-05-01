import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:news_demo_flutter/api/api_repository/home_api.dart';
import 'package:news_demo_flutter/config/icon_config.dart';
import 'package:news_demo_flutter/config/string_config.dart';
import 'package:news_demo_flutter/model/dashboard_model.dart';

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
  Rx<DashboardModel> dashboardModel = DashboardModel().obs;

  RxBool isLoading = false.obs;
  RxList<Articles?> allFav = <Articles?>[].obs;

  @override
  void onInit() {
    dashboard();
    super.onInit();
  }

  dashboard() async {
    try {
      isLoading.value = true;

      var response = await HomeApi.dashboard();
      if (jsonDecode(response.body)["status"] == "ok") {
        dashboardModel.value =
            DashboardModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
