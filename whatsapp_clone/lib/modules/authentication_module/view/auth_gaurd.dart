import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:whatsapp_clone/modules/ui/screens/home_screen/home_screen_widgets/bottom_navigation_bar_bloc/bloc/bottom_navigation_bar_bloc.dart';
import 'package:whatsapp_clone/modules/ui/screens/home_screen/src/home_screen.dart';
import 'sign_up_screen.dart';

class AuthGaurd extends StatefulWidget {
  const AuthGaurd({super.key});

  @override
  State<AuthGaurd> createState() => _AuthGaurdState();
}

class _AuthGaurdState extends State<AuthGaurd> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<AuthBloc>().add(AuthEventInitialize())
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,AuthState>(
      builder: (context,state){
        if(state.isAuthenticated){
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => BottomNavigationBarBloc(),),
            ],
            child: const HomeScreen(),
          );
        }
        return const SignUpScreen();
      },
    );
  }
}