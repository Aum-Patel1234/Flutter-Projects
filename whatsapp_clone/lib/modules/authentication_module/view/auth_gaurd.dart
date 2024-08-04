import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/authentication_module/auth_bloc/auth_bloc.dart';
import 'package:whatsapp_clone/ui/screens/home_screen/home_screen_widgets/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:whatsapp_clone/ui/screens/home_screen/src/home_screen.dart';
import 'sign_up_screen.dart';

class AuthGaurd extends StatelessWidget {
  const AuthGaurd({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,AuthState>(
      builder: (context,state){
        if(state.isAuthenticated){
          return BlocProvider(
            create: (context) => BottomNavigationBarBloc(),
            child: const HomeScreen(),
          );
        }
        return const SignUpScreen();
      },
    );
  }
}