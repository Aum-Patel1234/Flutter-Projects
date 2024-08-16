import 'package:flutter/material.dart';
import 'package:whatsapp_clone/global_providers.dart';
import 'package:whatsapp_clone/modules/authentication_module/view/auth_gaurd.dart';
import 'package:whatsapp_clone/core/theme/themes.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const AuthGaurd(),
      ),
    );
  }
}