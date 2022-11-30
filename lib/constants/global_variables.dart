import 'package:flutter/material.dart';

String uri = 'http://192.168.88.200:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 88, 240, 169);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color.fromARGB(255, 215, 220, 231);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}
