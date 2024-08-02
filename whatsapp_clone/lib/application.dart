import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:whatsapp_clone/ui/screens/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarBloc(),
      child: const HomeScreen(),
    );
  }
}