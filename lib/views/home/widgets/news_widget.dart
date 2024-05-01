import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_demo_flutter/common/slidable_button.dart';
import 'package:news_demo_flutter/config/color_config.dart';
import 'package:news_demo_flutter/config/font_family.dart';
import 'package:news_demo_flutter/config/font_size.dart';
import 'package:news_demo_flutter/config/icon_config.dart';
import 'package:news_demo_flutter/config/image_config.dart';
import 'package:news_demo_flutter/config/size_config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_demo_flutter/controller/home_controller.dart';
import 'package:news_demo_flutter/views/home/detail_screen.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return _list(context);
  }

  _list(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeConfig.height18,
      ),
      child: Obx(
        () => homeController.isLoading.value
            ? Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 3),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: ColorConfig.blackColor,
                  ),
                ),
              )
            : Column(
                children: List.generate(
                    homeController.dashboardModel.value.articles?.length ?? 0,
                    (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: SizeConfig.height23),
                    child: Slidable(
                      key: Key(UniqueKey().toString()),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        extentRatio: SizeConfig.height0_245,
                        children: [
                          SlidableButton(
                            onTap: () {
                              if (!homeController.allFav.contains(homeController
                                  .dashboardModel.value.articles?[index])) {
                                homeController.allFav.add(homeController
                                    .dashboardModel.value.articles?[index]);
                              }
                            },
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(DetailScreen(
                            articles: homeController
                                .dashboardModel.value.articles?[index],
                            status: "news",
                          ));
                          // Get.toNamed(AppRoute.detailScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: SizeConfig.height25,
                              vertical: SizeConfig.height20),
                          decoration: BoxDecoration(
                            color: ColorConfig.whiteColor,
                            borderRadius:
                                BorderRadius.circular(SizeConfig.height11_61),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: SizeConfig.height85_15,
                                offset: const Offset(0, SizeConfig.height17),
                                spreadRadius: -SizeConfig.height3_87,
                                color: ColorConfig.color18274B
                                    .withOpacity(SizeConfig.height0_14),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.height10),
                                    child: homeController
                                                .dashboardModel
                                                .value
                                                .articles?[index]
                                                .urlToImage
                                                ?.isEmpty ??
                                            false
                                        ? Image.asset(ImageConfig.newsImage)
                                        : Image.network(
                                            "${homeController.dashboardModel.value.articles?[index].urlToImage}",
                                            height: SizeConfig.height96,
                                            width: SizeConfig.height96,
                                            fit: BoxFit.fill,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return Image.asset(
                                                  ImageConfig.newsImage,
                                                  height: SizeConfig.height96,
                                                  width: SizeConfig.height96,
                                                  fit: BoxFit.fill);
                                            },
                                          ),
                                  ),
                                ],
                              ),
                              _sizedBoxWidth(SizeConfig.height16_45),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      homeController.dashboardModel.value
                                              .articles?[index].title ??
                                          "",
                                      maxLines: 2,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: FontSize.fontSize15,
                                          fontFamily: FontFamily.robotoBold,
                                          color: ColorConfig.color212121,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      homeController.dashboardModel.value
                                              .articles?[index].description ??
                                          "",
                                      maxLines: 2,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: FontSize.fontSize15,
                                          fontFamily: FontFamily.robotoRegular,
                                          color: ColorConfig.color212121,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    _sizedBoxHeight(SizeConfig.height3),
                                    Row(
                                      children: [
                                        Image.asset(
                                          IconConfig.calendarIcon,
                                          height: SizeConfig.height17_42,
                                          width: SizeConfig.height17_42,
                                        ),
                                        _sizedBoxWidth(SizeConfig.height5),
                                        Text(
                                          "${DateFormat('E, d MMM yyy hh:mm').format(DateTime.parse("${homeController.dashboardModel.value.articles?[index].publishedAt}").toUtc())} GMT",
                                          style: const TextStyle(
                                              fontSize: FontSize.fontSize12,
                                              fontFamily: FontFamily.robotoBold,
                                              color: ColorConfig.colorB9B9B9,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
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

  _sizedBoxHeight(double height) {
    return SizedBox(
      height: height,
    );
  }

  _sizedBoxWidth(double width) {
    return SizedBox(
      width: width,
    );
  }
}
