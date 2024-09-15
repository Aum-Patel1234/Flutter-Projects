import 'package:flutter/widgets.dart';
import 'package:gamers_hub/modules/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:gamers_hub/modules/ui/screens/auth/sign_up/sign_up_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen();
  }
}