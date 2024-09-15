import 'package:flutter/material.dart';

import '../../../../../utils/config/config.dart';
import '../shared/auth_shared_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            image: AssetImage('assets/images/home-page-background.jpg'),
            fit: BoxFit.fitHeight,
            height: double.maxFinite,
          ),
          Center(
            child: Container(
              height: width > height ? height * 0.75 : height*0.6,
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
                    const Align(
                      alignment: Alignment.centerRight,
                      child: CustomUnderlinedButton(
                        text: 'Forgot Password?',
                      ),
                    ),
                    const SigninSignupButton(text: 'Sign In'),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CompanySignInButton(
                          imageLink: 'assets/icons/google_icon.png',
                        ),
                        CompanySignInButton(
                          imageLink: 'assets/icons/facebook.png',
                        ),
                        CompanySignInButton(
                          imageLink: 'assets/icons/logo-black.png',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: CustomUnderlinedButton(text: 'Create an Account'),
                    ),
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
