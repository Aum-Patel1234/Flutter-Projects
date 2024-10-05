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
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,    // important as it avoids the background to change when it enters something in textfield
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
                    Form(
                      key: _emailKey,
                      child: CustomSigninSignupTextfield(
                        controller: _emailcontroller,
                        hintText: "Enter Your Email",
                        header: "Email",
                      ),
                    ),
                    Form(
                      key: _passwordKey,
                      child: CustomSigninSignupTextfield(
                        controller: _passwordcontroller,
                        hintText: "Enter Your Password",
                        header: "Password",
                        obscureText: true,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: CustomUnderlinedButton(
                        text: 'Forgot Password?',
                      ),
                    ),
                   SigninSignupButton(text: 'Sign In',emailKey: _emailKey,passwordKey: _passwordKey,),
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
