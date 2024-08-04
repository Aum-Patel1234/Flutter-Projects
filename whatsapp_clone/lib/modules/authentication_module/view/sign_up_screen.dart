import 'package:flutter/material.dart';
import 'shared/src/repo.dart';

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
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: height*0.025,),
          
              Text('Get Your Free Account',style: Theme.of(context).textTheme.headlineLarge),
          
              SizedBox(height: height*0.025,),
          
              const CompaniesSignUp(text: 'Continue with Apple',imageAddress: 'assets/images/apple_icon.png',imageWidth: 30,),
              SizedBox(height: height*0.025,),
              const CompaniesSignUp(text: 'Continue with Google',imageAddress: 'assets/images/google_icon.png',imageWidth: 25,),
          
              SizedBox(height: height*0.025,),
              
              const Seperator(),
          
              SizedBox(height: height*0.025,),
          
              CustomEmailPasswordTextField(emailcontroller: _emailcontroller,passwordcontroller: _passwordcontroller,),
          
              SizedBox(height: height*0.05,),    // more space
          
              SubmitButton(text: 'Sign Up',emailcontroller: _emailcontroller,passwordcontroller: _passwordcontroller,),
              
              SizedBox(height: height*0.05,),    // more space

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',style: Theme.of(context).textTheme.bodyLarge,),
                  const SizedBox(width: 5,),
                  TextButton(
                    onPressed: (){},
                    child: const Text('Login',style: TextStyle(color: Colors.green,fontSize: 16),),
                  )
                ],
              )
            ],
          ),
        ),
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

