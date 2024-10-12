import 'dart:async';

import 'package:flutter/material.dart';
import '../screens/application.dart';

Future<void> showCustomSnackBar({required String message}) async{
  await Future.delayed(const Duration(seconds: 1));
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
