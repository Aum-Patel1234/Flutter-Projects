import 'package:flutter/material.dart';

import '../../../../../utils/config/config.dart';
import '../shared/auth_shared_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage('assets/images/sign-up-background.jpg'),
            fit: BoxFit.fitHeight,
            height: double.maxFinite,
          ),
          Center(
            child: Container(
              height: width > height ? height * 0.75 : height * 0.6,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(Config.borderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(Config.paddingEight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Please Enter Your Account Details',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    CustomSigninSignupTextfield(
                      controller: _emailcontroller,
                      hintText: "Enter Your Email",
                      header: "Email",
                    ),
                    CustomSigninSignupTextfield(
                      controller: _passwordcontroller,
                      hintText: "Enter Your Password",
                      header: "Password",
                      obscureText: true,
                    ),

                    const SizedBox(height: 20,),
                    
                    const SigninSignupButton(text: 'Sign Up'),
                    
                    const Padding(
                      padding: EdgeInsets.all(Config.paddingEight),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),

                    const SigninSignupButton(text: 'Sign In as a Guest'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }
}
