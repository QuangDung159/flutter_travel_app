import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xff6357cc);
  static const Color secondColor = Color(0xff8f67e8);
  static const Color yellowColor = Color(0xfffe9c5e);

  static const Color dividerColor = Color(0xffe5e7eb);
  static const Color text1Color = Color(0xff323b4b);
  static const Color subtitleColor = Color(0xff838383);
  static const Color backgroundScaffoldColor = Color(0xfff2f2f2);
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
    colors: [
      ColorPalette.secondColor,
      ColorPalette.primaryColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
  );
}
