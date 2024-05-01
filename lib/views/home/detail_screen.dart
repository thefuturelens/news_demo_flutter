import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_demo_flutter/config/color_config.dart';
import 'package:news_demo_flutter/config/font_family.dart';
import 'package:news_demo_flutter/config/icon_config.dart';
import 'package:news_demo_flutter/config/image_config.dart';
import 'package:news_demo_flutter/config/size_config.dart';
import 'package:news_demo_flutter/config/string_config.dart';
import 'package:news_demo_flutter/model/dashboard_model.dart';
import '../../config/font_size.dart';
import 'package:flutter_html/flutter_html.dart' as html;

class DetailScreen extends StatelessWidget {
  final Articles? articles;
  final String? status;
  const DetailScreen({Key? key, this.articles, this.status}) : super(key: key);

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
          leadingWidth: double.infinity,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.height27),
                  child: Icon(Icons.arrow_back_ios),
                ),
                Text(
                  StringConfig.back,
                  style: TextStyle(
                      fontSize: FontSize.fontSize14,
                      fontFamily: FontFamily.robotoBold,
                      color: ColorConfig.color232323,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
        body: _body(context),
      ),
    );
  }

  _body(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConfig.height27),
        child: Column(
          children: [
            _sizedBoxHeight(SizeConfig.height5),
            _image(),
            _sizedBoxHeight(SizeConfig.height19),
            _content(),
            _sizedBoxHeight(SizeConfig.height27),
          ],
        ),
      ),
    );
  }

  _image() {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(SizeConfig.height10_28),
        child: articles?.urlToImage?.isEmpty ?? false
            ? Image.asset(
                ImageConfig.newsDetailImage,
                width: double.infinity,
                height: SizeConfig.height201,
                fit: BoxFit.fill,
              )
            : Image.network(
                "${articles?.urlToImage}",
                width: double.infinity,
                height: SizeConfig.height201,
                fit: BoxFit.fill,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(ImageConfig.newsDetailImage,
                      height: SizeConfig.height201,
                      width: double.infinity,
                      fit: BoxFit.fill);
                },
              ),
      ),
      if (status == "fav")
        Positioned(
          top: SizeConfig.height15,
          right: SizeConfig.height17,
          child: Image.asset(
            IconConfig.favIcon,
            height: SizeConfig.height26_74,
            width: SizeConfig.height30_85,
          ),
        ),
    ]);
  }

  _content() {
    return Column(
      children: [
        Text(
          articles?.title ?? "",
          style: const TextStyle(
              height: SizeConfig.height1_2,
              fontSize: FontSize.fontSize24,
              fontFamily: FontFamily.robotoBold,
              color: ColorConfig.color212121,
              fontWeight: FontWeight.w700),
        ),
        _sizedBoxHeight(SizeConfig.height8_23),
        Row(
          children: [
            Image.asset(
              IconConfig.calendarIcon,
              height: SizeConfig.height17_42,
              width: SizeConfig.height17_42,
            ),
            _sizedBoxWidth(SizeConfig.height5),
            Text(
              "${DateFormat('E, d MMM yyy hh:mm').format(DateTime.parse("${articles?.publishedAt}").toUtc())} GMT",
              style: const TextStyle(
                  fontSize: FontSize.fontSize12,
                  fontFamily: FontFamily.robotoBold,
                  color: ColorConfig.colorB9B9B9,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        _sizedBoxHeight(SizeConfig.height22_63),
        html.Html(
          data: articles?.content ?? "",
          style: {
            '#': html.Style(
                padding: html.HtmlPaddings.zero, margin: html.Margins.zero),
          },
        ),
      ],
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
