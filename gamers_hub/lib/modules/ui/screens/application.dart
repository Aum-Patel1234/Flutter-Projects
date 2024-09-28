import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
// import 'package:gamers_hub/modules/ui/screens/auth/sign_in/sign_in_screen.dart';
// import 'package:gamers_hub/modules/ui/screens/auth/sign_up/sign_up_screen.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/src/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: const HomeScreen(),
    );
  }
}