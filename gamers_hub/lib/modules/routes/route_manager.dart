import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamers_hub/modules/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/src/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/screens/home_screen/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';

class RouteManager {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        {
          return _handleIntialRoute();
        }
      case '/signIn':
        {
          return MaterialPageRoute(builder: (context) => const SignInScreen());
        }
      default:
        return _errorRoute();
    }
    // return _errorRoute();
  }

  static Route<MaterialPageRoute> _handleIntialRoute() {
    return MaterialPageRoute(builder: (context) {
      return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final prefs = snapshot.data;
          if (prefs?.getString('email') == null) {
            return const SignInScreen();
          }
          return BlocProvider(
            create: (context) => BottomNavigationBloc(),
            child: const HomeScreen(),
          );
        },
      );
    });
  }

  static Route<MaterialPageRoute> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => (Scaffold(
        appBar: AppBar(
          title: const Text(
            'Error page',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: const Center(
          child: Text(
            'Some Error Occured !!',
            style: TextStyle(fontSize: 36),
          ),
        ),
      )),
    );
  }
}
