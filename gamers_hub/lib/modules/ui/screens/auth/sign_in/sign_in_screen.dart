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
              height: width > height ? height * 0.8 : height*0.7,
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
                    CustomSigninSignupTextfield(
                      controller: _passwordcontroller,
                      hintText: "Enter Your Password",
                      header: "Password",
                      obscureText: true,
                    ),

                    SizedBox(
                      height: height * 0.02,
                    ),

                    const Align(
                      alignment: Alignment.centerRight,
                      child: CustomUnderlinedButton(
                        text: 'Forgot Password?',
                      ),
                    ),

                    SigninSignupButton(text: 'Sign In',emailKey: _emailKey,emailcontroller: _emailcontroller,passwordcontroller: _passwordcontroller,),
                    
                    SizedBox(
                      height: height * 0.025,
                    ),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CompanySignInButton(
                          imageLink: 'assets/icons/google_icon.png',
                          signInCompany: SignInCompany.google,

                        ),
                        CompanySignInButton(
                          imageLink: 'assets/icons/facebook.png',
                          signInCompany: SignInCompany.facebook,
                        ),
                        CompanySignInButton(
                          imageLink: 'assets/icons/logo-black.png',
                          signInCompany: SignInCompany.twitter,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: CustomUnderlinedButton(text: 'Create a New Account'),  
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
