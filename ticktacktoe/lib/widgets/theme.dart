
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Colors.black,
      primary: Colors.black26,
      secondary: Color.fromRGBO(255, 255, 255, 1),
      tertiary: Color.fromRGBO(196	,196	,196,1),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.deepPurple,
    ),
);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Colors.grey,
      primary: Colors.white70,
      secondary: Colors.black,
      tertiary: Color.fromARGB(255, 75, 67, 67),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.deepPurple,
    ),
    // scaffoldBackgroundColor: Colors.white70,
    // appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    useMaterial3: true,
);
