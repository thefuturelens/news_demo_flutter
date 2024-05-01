import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_demo_flutter/config/icon_config.dart';
import 'package:news_demo_flutter/config/image_config.dart';
import 'package:news_demo_flutter/model/dashboard_model.dart';
import '../config/color_config.dart';
import '../config/font_family.dart';
import '../config/font_size.dart';
import '../config/size_config.dart';
import '../config/string_config.dart';

class SlidableButton extends StatelessWidget {
  SlidableButton({
    this.flex = 1,
    this.autoClose = true,
    required this.onTap,
  });
  final int flex;
  final bool autoClose;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Slidable.of(context);

    return ValueListenableBuilder<double>(
      valueListenable: controller!.animation,
      builder: (context, value, child) {
        return Flexible(
          flex: flex,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () async {
              onTap();
              controller.close();
            },
            child: Container(
              decoration: const BoxDecoration(
                color: ColorConfig.colorFCD1D1,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(SizeConfig.height11_61),
                    bottomRight: Radius.circular(SizeConfig.height11_61)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    IconConfig.favIcon,
                    height: SizeConfig.height24,
                    width: SizeConfig.height27,
                  ),
                  _sizedBoxHeight(SizeConfig.height5),
                  const Text(
                    StringConfig.addToFavorite,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: FontSize.fontSize12,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.robotoMedium,
                      color: ColorConfig.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _sizedBoxHeight(double height) {
    return SizedBox(
      height: height,
    );
  }
}
