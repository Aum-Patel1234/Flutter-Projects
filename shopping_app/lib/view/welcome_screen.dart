
import 'package:flutter/material.dart';
import 'package:stocks_app/view/home_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.username, required this.email});

  final String username;
  final String email;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _opacity = 0;
  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500),() {
        setState(() {
          _opacity = 1;
        });
    },);
    Future.delayed(const Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(username: widget.username,email : widget.email)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          child: Text(
            'Welcome, ${widget.username}',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
