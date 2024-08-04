import 'package:flutter/material.dart';
import 'package:whatsapp_clone/application.dart';

void showCustomSnackBar({required String message}) {
  scaffoldMessengerKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
