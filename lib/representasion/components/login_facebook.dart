import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/constants/color_config.dart';
import '../../core/constants/dismension_config.dart';
import '../../core/constants/textstyle.dart';

class LoginFaceBook extends StatelessWidget {
  const LoginFaceBook({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
      child: Row(
        children: [
          Expanded(flex: 4,
            child: Container(
              height: 50,
              width: size.width/3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  const [
                  FaIcon(FontAwesomeIcons.google, color: ColorPalete.primaryColor),
                  SizedBox(width: 10), // Thêm khoảng cách giữa icon và text
                  Text('Google', style: TextStyles.textApp), // Thêm style cho text
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(flex: 4,
            child: Container(
              height: 50,
              width: size.width/3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorPalete.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.facebook, color: ColorPalete.dividerColor,),
                  const SizedBox(width: 10), // Thêm khoảng cách giữa icon và text
                  Text('Facebook', style: TextStyles.textApp.whiteTextColor), // Thêm style cho text
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}