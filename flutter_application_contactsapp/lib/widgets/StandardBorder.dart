import 'package:flutter/material.dart';

class StandardBorder extends OutlineInputBorder {
  final double width;
  final Color color;
  StandardBorder({this.width = 1.5, this.color = Colors.white70})
      : super(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: color,
            width: width,
          ),
        );
}
