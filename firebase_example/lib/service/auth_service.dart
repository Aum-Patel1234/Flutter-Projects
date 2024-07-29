import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  Future<String?> registration({required String email,required String password})async{
    try{

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      return "Success";

    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        return 'Password is too weak..';
      }else if(e.code == 'email-aldready-in-use'){
        return 'The account aldready exists for this email..';
      }else{
        log(e.message.toString());
      }
    }catch (e){
      log(e.toString());
    }
    return null;
  }

  Future<String?> login({required String email,required String password})async{
    try{

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      return "Success";

    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        return 'Sign up.. (No User found)';
      }else if(e.code == 'wrong-password'){
        return 'Wrong password provided for the user..';
      }else{
        log(e.message.toString());
      }
    }catch (e){
      log(e.toString());
    }
    return null;
  }

}