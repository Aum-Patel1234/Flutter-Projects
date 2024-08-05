import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:whatsapp_clone/modules/authentication_module/view/shared/src/repo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: BlocListener<AuthBloc,AuthState>(
        listener: (context,state){
          if(state.isAuthenticated){
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light ? Colors.black26 : Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                
                SizedBox(height: height*0.025,),
          
                Text('Log in to WhatsApp',style: Theme.of(context).textTheme.headlineLarge),
          
                SizedBox(height: height*0.025,),
          
                CustomEmailPasswordTextField(emailcontroller: _emailcontroller, passwordcontroller: _passwordcontroller),
          
                SizedBox(height: height*0.025,),
          
                GestureDetector(
                  onTap: (){},
                  child: const Text('Forgot Password?',style: TextStyle(color: Colors.blue,fontSize: 16),),
                ),
          
                SizedBox(height: height*0.025,),
          
                SubmitButton(text: 'Login', emailcontroller: _emailcontroller, passwordcontroller: _passwordcontroller),
          
                SizedBox(height: height*0.025,),
          
                const Seperator(),
          
                SizedBox(height: height*0.025,),
          
                const CompaniesSignUp(text: 'Continue with Apple',imageAddress: 'assets/images/apple_icon.png',imageWidth: 30,),
                
                SizedBox(height: height*0.025,),
          
                const CompaniesSignUp(text: 'Continue with Google',imageAddress: 'assets/images/google_icon.png',imageWidth: 25,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
