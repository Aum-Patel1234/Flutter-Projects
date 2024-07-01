import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.brown,
    brightness: Brightness.dark,
  ).copyWith(
    secondary: Colors.brown[200],
    surface: Colors.brown[800],
  ),
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.brown[900],
    foregroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.brown.shade600, // Darker brown background
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.brown[700],
    textTheme: ButtonTextTheme.primary,
  ),
);

ThemeData lighttheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.brown,
  ).copyWith(
    secondary: Colors.brown[700],
    background: Colors.brown[100],
    surface: Colors.brown[50],
  ),
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.brown.shade300,
    foregroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.brown[100], // Lighter brown background
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.brown[700],
    textTheme: ButtonTextTheme.primary,
  ),
);
