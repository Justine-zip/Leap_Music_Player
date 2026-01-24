import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    primaryContainer: Colors.grey[100],
    seedColor: Colors.white,
    brightness: Brightness.light,
  ).copyWith(tertiary: Colors.deepPurple),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.deepPurple,
    indicator: BoxDecoration(),
    indicatorColor: Colors.white,
    unselectedLabelColor: Colors.black,
  ),
);
