import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_demo_flutter/config/color_config.dart';
import 'package:news_demo_flutter/config/font_family.dart';
import 'package:news_demo_flutter/config/font_size.dart';
import 'package:news_demo_flutter/config/size_config.dart';
import 'package:news_demo_flutter/controller/home_controller.dart';
import 'package:news_demo_flutter/views/home/widgets/fav_widget.dart';
import 'package:news_demo_flutter/views/home/widgets/news_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConfig.whiteColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: ColorConfig.whiteColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: SizeConfig.height20,
        ),
        body: _body(context),
      ),
    );
  }

  _body(context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            _tabList(),
            _sizedBoxHeight(SizeConfig.height20),
            if (homeController.isSelected.value == 0)
              NewsWidget()
            else
              FavWidget(),
          ],
        ),
      ),
    );
  }

  _tabList() {
    return Padding(
      padding: const EdgeInsets.only(
          left: SizeConfig.height27,
          bottom: SizeConfig.height10,
          right: SizeConfig.height15),
      child: Obx(
        () => Row(
          children: List.generate(2, (index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: SizeConfig.height12),
                child: GestureDetector(
                  onTap: () {
                    homeController.isSelected.value = index;

                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: SizeConfig.height18,
                      right: SizeConfig.height18,
                      top: SizeConfig.height12,
                      bottom: SizeConfig.height12,
                    ),
                    decoration: BoxDecoration(
                      color: homeController.isSelected.value == index
                          ? ColorConfig.colorEEF3FD
                          : ColorConfig.whiteColor,
                      borderRadius: BorderRadius.circular(SizeConfig.height6),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            homeController.allTabIcon[index],
                            height: index == 0
                                ? SizeConfig.height23
                                : SizeConfig.height32,
                            width: index == 0
                                ? SizeConfig.height33
                                : SizeConfig.height36,
                          ),
                          _sizedBoxWidth(SizeConfig.height19),
                          Text(
                            homeController.allTab[index],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: FontSize.fontSize28,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.robotoBold,
                              color: homeController.isSelected.value == index
                                  ? ColorConfig.color212121
                                  : ColorConfig.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  _sizedBoxWidth(double width) {
    return SizedBox(
      width: width,
    );
  }

  _sizedBoxHeight(double height) {
    return SizedBox(
      height: height,
    );
  }
}
