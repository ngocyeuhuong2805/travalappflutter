

import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_config.dart';

class TextStyles {
  TextStyles(this.context);
  BuildContext? context;

  static const TextStyle defaultStyle = TextStyle(
    fontSize: 16,
    color: ColorPalete.text1Color,
    fontWeight: FontWeight.w500,
    height: 9/7,
  );
  static const TextStyle headerTitle = TextStyle(
    fontSize: 30,
    color: ColorPalete.text1Color,
    fontWeight: FontWeight.bold,
    height: 21/19,
    decoration: TextDecoration.none
  );
  static const TextStyle textApp = TextStyle(
    fontSize: 15,
    color: Color.fromRGBO(49, 49, 49, 1),
    fontWeight: FontWeight.bold,
    height: 11/9,
  );
}

extension ExtendedTextStyle on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get whiteTextColor => copyWith(color: Colors.white);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle withFontSize(double fontSize) => copyWith(fontSize: fontSize);

  TextStyle withFontWeight(FontWeight fontWeight) => copyWith(fontWeight: fontWeight);

  TextStyle withLineHeight(double height) => copyWith(height: height);
}