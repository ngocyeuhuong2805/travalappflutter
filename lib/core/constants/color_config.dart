

import 'package:flutter/material.dart';

class ColorPalete {
  static const Color primaryColor = Color(0xff6357cc);
  static const Color secondColor = Color(0xff8f67e8);
  static const Color yellowColor = Color(0xfffe9c5e);

  static const Color colorText = Color.fromRGBO(49, 49, 49, 1);

  static const Color dividerColor = Color(0xffe5e7eB);
  static const Color text1Color = Color(0xff323b4b);
  static const Color subTitleColor = Color(0xff838383);
  static const Color bgScaffoldColor = Color(0xfff2f2f2);
}

class Gradients {
  static const Gradient defaultGradientBground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalete.secondColor,
      ColorPalete.primaryColor
    ],
  );
}