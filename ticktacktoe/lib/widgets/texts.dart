import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget player_info(BuildContext context,String text,double fontSize,Color color) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      color: color,
    ),
  );
}
