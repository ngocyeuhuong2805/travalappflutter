import 'package:flutter/material.dart';

import '../../core/constants/color_config.dart';
import '../../core/constants/dismension_config.dart';
import '../../core/constants/textstyle.dart';

class ButtonComponent extends StatefulWidget {
  final Function()? onTap;
  final String content;
  const ButtonComponent({
    Key? key, // Đã sửa lại từ super.key thành Key? key
    required this.size,
    required this.content,
    this.onTap,
  });

  final Size size;

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMinPadding),
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          primary: ColorPalete.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          minimumSize: Size(widget.size.width, 50),
        ),
        child: Text(
          widget.content,
          style: TextStyles.textApp.bold.whiteTextColor,
        ),
      ),
    );
  }
}