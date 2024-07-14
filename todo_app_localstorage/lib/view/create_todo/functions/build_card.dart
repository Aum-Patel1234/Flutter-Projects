import 'package:flutter/material.dart';

Widget buildCard(BuildContext context,{required VoidCallback onPressed, required Widget child}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.deepPurple,
      child: TextButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }