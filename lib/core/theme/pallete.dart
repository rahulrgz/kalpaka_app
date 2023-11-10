import 'package:flutter/material.dart';

class Pallete {
  static const primaryColor = Color(0xffe1e0e0);
  static const secondaryColor = Color(0xff43215b);
  static const containerColor = Color(0xffdee0e7);
  static const shadowColor = Color(0xffababaf);
  static const darkColor = Color(0xff454546);
  static const blackColor = Colors.black;
  static const whiteColor = Colors.white;
  static const notwhiteColor = Color(0xffececec);

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: primaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
    ),
    cardColor: secondaryColor,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(secondaryColor),
        iconColor: MaterialStatePropertyAll(secondaryColor),
        textStyle: MaterialStatePropertyAll(
          TextStyle(color: primaryColor),
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: blackColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: secondaryColor,
      unselectedIconTheme: IconThemeData(color: secondaryColor),
      unselectedLabelStyle: TextStyle(color: secondaryColor),
    ),
  );
}
