import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/models/users_model/user_model.dart';

class AuthService{
  final FirebaseAuth _instance = FirebaseAuth.instance;

  Stream<bool> get isAuthenticated{
    log(_instance.authStateChanges().elementAt(1).toString());
    return _instance.authStateChanges().map((user) => user != null);
  }

  UserModel? get currentUser{
    if (_instance.currentUser == null) return null;
    return UserModel.fromFirebaseUser(_instance.currentUser!);
  }

  Future<Either<String, UserCredential>> createUserwithUsernameEmailPassord({required String username,required String email,required String password}) async{
    try{
      final UserCredential userCredential = await _instance.createUserWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    }on FirebaseAuthException catch (e) {
      return Left(e.message ?? 'An unexpected error occurred.');
    } catch (e) {
      return const Left('An unexpected error occurred.');
    }
  }

  Future<Either<String, UserCredential>> login({required String email,required String password}) async{
    try{
      final UserCredential userCredential = await _instance.signInWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    }on FirebaseAuthException catch (e){
      return Left(e.message ?? 'Something went wrong..');
    }
  }

  Future<Either<String, void>> logout() async{
    try{
      return Right(_instance.signOut());
    }on FirebaseAuthException catch (e){
      return Left(e.message ?? 'Something went wrong..');
    }
  }
}