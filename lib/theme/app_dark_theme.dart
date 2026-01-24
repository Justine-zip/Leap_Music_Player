import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    primaryContainer: Colors.grey[900],
    seedColor: Colors.black,
    brightness: Brightness.dark,
  ).copyWith(
    secondary: Colors.deepPurple[300],
    tertiary: Colors.deepPurple[300],
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.deepPurple[300],
    indicator: BoxDecoration(),
    indicatorColor: Colors.black,
    unselectedLabelColor: Colors.white,
  ),
);
