import 'package:quotes_app_2/headers.dart';

import 'fonts_enum.dart';

class Globals {
  static bool on = false;
  static Color color = Colors.white;
  static Color fcolor = Colors.black;
  static double radius = 0;
  static double opacity = 1;
  static String font = CardFont.roboto.name;

  static void reset() {
    color = Colors.white;
    font = CardFont.roboto.name;
    radius = 0;
    fcolor = Colors.black;
  }
}
