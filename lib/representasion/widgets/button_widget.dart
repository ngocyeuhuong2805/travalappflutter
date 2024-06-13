import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/constants/textstyle.dart';

class ButtonWidget extends StatelessWidget {
   const ButtonWidget({Key? key, required this.title, this.ontap}) : super(key: key);
  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBground
        ),
        child: Text(title, style: TextStyles.defaultStyle.bold.whiteTextColor),
      ),
    );
  }
}
