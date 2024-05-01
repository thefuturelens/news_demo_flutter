import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_demo_flutter/common/slidable_button.dart';
import 'package:news_demo_flutter/config/color_config.dart';
import 'package:news_demo_flutter/config/font_family.dart';
import 'package:news_demo_flutter/config/font_size.dart';
import 'package:news_demo_flutter/config/icon_config.dart';
import 'package:news_demo_flutter/config/image_config.dart';
import 'package:news_demo_flutter/config/size_config.dart';
import 'package:news_demo_flutter/config/string_config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_demo_flutter/routes/app_route.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _list(context);
  }

  _list(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeConfig.height18,
      ),
      child: Column(
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: SizeConfig.height23),
            child: Slidable(
              key: Key(UniqueKey().toString()),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: SizeConfig.height0_245,
                children: [
                  SlidableButton(
                    onTap: () {},
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.detailScreen);
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
                            child: Image.asset(ImageConfig.newsImage,
                                height: SizeConfig.height96,
                                width: SizeConfig.height96),
                          ),
                        ],
                      ),
                      _sizedBoxWidth(SizeConfig.height16_45),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              StringConfig.newsTitle,
                              style: TextStyle(
                                  fontSize: FontSize.fontSize15,
                                  fontFamily: FontFamily.robotoBold,
                                  color: ColorConfig.color212121,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Text(
                              StringConfig.newsSubTitle,
                              style: TextStyle(
                                  fontSize: FontSize.fontSize15,
                                  fontFamily: FontFamily.robotoRegular,
                                  color: ColorConfig.color212121,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  IconConfig.calendarIcon,
                                  height: SizeConfig.height17_42,
                                  width: SizeConfig.height17_42,
                                ),
                                _sizedBoxWidth(SizeConfig.height5),
                                const Text(
                                  StringConfig.newsDate,
                                  style: TextStyle(
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
    );
  }

  _sizedBoxWidth(double width) {
    return SizedBox(
      width: width,
    );
  }
}
