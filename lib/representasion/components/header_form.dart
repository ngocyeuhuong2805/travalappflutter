import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

import '../../core/constants/color_config.dart';
import '../../core/constants/dismension_config.dart';
import '../../core/constants/textstyle.dart';
import '../../core/helpers/asset_helper.dart';

class HeaderForm extends StatelessWidget {
  final String title;
  final String content;
  const HeaderForm({
    super.key,
    required this.size,
    required this.title,
    required this.content,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: Gradients.defaultGradientBground,
                  borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(35)),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: ImageHelper.loadFormAsset(
                    AssetHelper.oval1), // Corrected method name
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: ImageHelper.loadFormAsset(
                    AssetHelper.oval2), // Corrected method name
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: kMediumPadding * 3, // Sửa thành kMediumPadding * 3
                ),
                Text(title, style: TextStyles.headerTitle.bold.whiteTextColor),
                const SizedBox(
                  height: kMediumPadding, // Sửa thành kMediumPadding
                ),
                Container(child: Text(content, style: TextStyles.defaultStyle.whiteTextColor)),
              ],
            ),
          ),
        ),
        Positioned(
          top: kMediumPadding,
          left: kMediumPadding,
          child: Container(
            alignment: Alignment.center,
            width: size.width / 10, // Sửa thành size.width / 10
            height: size.height / 21, // Sửa thành size.height / 21
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(kDefaultPadding)),
              color: Colors.white,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
                size: kDefaultIconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}