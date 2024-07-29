import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Appbar'),
        ),
        body: Center(
          child: FilledButton.tonal(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to logout: $e')),
                );
              }
            },
            child: const Text('Logout'),
          ),
        ));
  }
}
