import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/service/auth_state_provider.dart';
import 'package:firebase_example/view/authentication_screen.dart';
import 'package:firebase_example/view/homepage.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthStateProvider _authStateProvider = AuthStateProvider();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authStateProvider.user,
      builder: (BuildContext context,AsyncSnapshot snapshot) {
        log(snapshot.connectionState.toString());
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }
        else if(snapshot.hasData){
          return const HomePage();
        }else{
          return const AuthenticationScreen();
        }
      },
    );
  }
}
