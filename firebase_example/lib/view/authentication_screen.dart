import 'package:firebase_example/service/auth_service.dart';
import 'package:firebase_example/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: _emailcontroller,
            formKey: _emailKey,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email address',
            validator: (value) {
              RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
              if (value == null || value.isEmpty) {
                return 'Please enter an email address';
              }
              if (!regExp.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: _passwordcontroller,
            formKey: _passwordKey,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Password',
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton.tonal(
                onPressed: () async{
                  if(_emailKey.currentState!.validate() && _passwordKey.currentState!.validate()){
                    await AuthService().registration(
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text)
                    .then((message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message ?? 'Something went wrong..'))
                      );
                    });
                  }
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              FilledButton.tonal(
                onPressed: () async{
                  if(_emailKey.currentState!.validate() && _passwordKey.currentState!.validate()){
                    await AuthService().login(
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text)
                    .then((message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message ?? 'Something went wrong..'))
                      );
                    });
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
