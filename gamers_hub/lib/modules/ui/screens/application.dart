import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:gamers_hub/modules/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/src/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final prefs = snapshot.data;
        if (prefs?.getString('email') == null) {
          // If user is not logged in, navigate to SignInScreen
          return const SignInScreen();
        }

        // If user is logged in, navigate to HomeScreen
        return BlocProvider(
          create: (context) => BottomNavigationBloc(),
          child: const HomeScreen(),
        );
      },
    );
  }
}