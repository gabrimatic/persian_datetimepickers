import 'package:flutter/material.dart';

MaterialColor getMaterialColor(Color color) {
  final red = (color.r * 255.0).round().clamp(0, 255).toInt();
  final green = (color.g * 255.0).round().clamp(0, 255).toInt();
  final blue = (color.b * 255.0).round().clamp(0, 255).toInt();

  Color shade(double opacity) {
    return Color.fromARGB((opacity * 255).round(), red, green, blue);
  }

  return MaterialColor(
    color.toARGB32(),
    {
      50: shade(.1),
      100: shade(.2),
      200: shade(.3),
      300: shade(.4),
      400: shade(.5),
      500: shade(.6),
      600: shade(.7),
      700: shade(.8),
      800: shade(.9),
      900: shade(1),
    },
  );
}
