import 'package:flutter/material.dart';
import 'package:flutter_screwdriver/flutter_screwdriver.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  dividerColor: Colors.black12,
  scaffoldBackgroundColor: const Color(0xff14141b),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Color(0xff282934),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff14141b),
  ),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.white.toMaterialColor(),
  ).copyWith(
    background: const Color(0xff14141b),
  ),
);

final lightTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.light,
  dividerColor: Colors.white54,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    elevation: 0.0,
    //color: Colors.black,
    //foregroundColor: const Color(0xffFF5E00),
    titleTextStyle: TextStyle(
      color: Colors.black54,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: const Color(0xffFF5E00).toMaterialColor(),
  ).copyWith(
    secondary: const Color(0xffFF5E00),
  ),
);
