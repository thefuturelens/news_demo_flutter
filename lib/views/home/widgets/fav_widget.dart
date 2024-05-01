import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_demo_flutter/config/color_config.dart';
import 'package:news_demo_flutter/config/font_family.dart';
import 'package:news_demo_flutter/config/font_size.dart';
import 'package:news_demo_flutter/config/image_config.dart';
import 'package:news_demo_flutter/config/size_config.dart';
import 'package:news_demo_flutter/controller/home_controller.dart';
import 'package:news_demo_flutter/views/home/detail_screen.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import '../../../config/icon_config.dart';

class FavWidget extends StatelessWidget {
  FavWidget({Key? key}) : super(key: key);

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
        () => Column(
          children: List.generate(homeController.allFav.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: SizeConfig.height23),
              child: GestureDetector(
                onTap: () {
                  Get.to(DetailScreen(
                    articles: homeController.allFav[index],
                    status: "fav",
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SizeConfig.height25,
                      vertical: SizeConfig.height20),
                  decoration: BoxDecoration(
                    color: ColorConfig.whiteColor,
                    borderRadius: BorderRadius.circular(SizeConfig.height11_61),
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
                            borderRadius:
                                BorderRadius.circular(SizeConfig.height10),
                            child: homeController
                                        .allFav[index]?.urlToImage?.isEmpty ??
                                    false
                                ? Image.asset(ImageConfig.newsImage)
                                : Image.network(
                                    "${homeController.allFav[index]?.urlToImage}",
                                    height: SizeConfig.height96,
                                    width: SizeConfig.height96,
                                    fit: BoxFit.fill,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.asset(ImageConfig.newsImage,
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
                              homeController.allFav[index]?.title ?? "",
                              maxLines: 2,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: FontSize.fontSize15,
                                  fontFamily: FontFamily.robotoBold,
                                  color: ColorConfig.color212121,
                                  fontWeight: FontWeight.w700),
                            ),
                            html.Html(
                              data: homeController.dashboardModel.value
                                      .articles?[index]?.content ??
                                  "",
                              style: {
                                '#': html.Style(
                                    maxLines: 2,
                                    textOverflow: TextOverflow.ellipsis,
                                    padding: html.HtmlPaddings.zero,
                                    margin: html.Margins.zero),
                              },
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
                                  "${DateFormat('E, d MMM yyy hh:mm').format(DateTime.parse("${homeController.allFav[index]?.publishedAt}").toUtc())} GMT",
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
