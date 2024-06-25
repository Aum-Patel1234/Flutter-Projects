
import 'package:flutter/material.dart';
import 'package:flutter_application_recipes_app/bloc/recipe_bloc.dart';
import 'package:flutter_application_recipes_app/theme/dark_light_theme.dart';
import 'package:flutter_application_recipes_app/view/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RecipeBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lighttheme,
          darkTheme: darkTheme,
          home: const HomePage(),
        )
    );
  }
}
