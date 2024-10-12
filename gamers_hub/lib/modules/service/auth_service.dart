import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamers_hub/utils/config/firebase_collections.dart';
import '../models/user_model.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<bool> get isAuthenticated{
    return _firebaseAuth.authStateChanges().map((user) => user != null);
  }

  UserModel? get currentUser{
    if (_firebaseAuth.currentUser == null) return null;
    return UserModel.fromFirebaseUser(_firebaseAuth.currentUser!);
  }

  Future<DocumentSnapshot<Map<String,dynamic>>> _getUserDocumentSnapshot(String id)async{
    return await _firebaseFirestore.collection(FirebaseCollections.usersCollectionPath).doc(id).get();
  }

  // normal sign in with email and password
  Future<Either<String,UserCredential>> createUserWithEmailAndPassword({required String email,required String password}) async{
    try{
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    }catch(e){
      return const Left('An unexpected error occurred.');
    }
  }
  // normal login with email and password
  Future<Either<String, UserCredential>> signInWithEmailAndPassword({required String email,required String password}) async{
    try{
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    }catch(e){
      return const Left('An unexpected error occurred.');
    }
  }
  Future<Either<String, void>> logout() async{
    try{
      return Right(_firebaseAuth.signOut());
    }on FirebaseAuthException catch (e){
      return Left(e.message ?? 'Something went wrong..');
    }
  }

  Future<Either<String, void>> createUser({required UserModel userModel})async{
    try{
      final ref = _firebaseFirestore.collection(FirebaseCollections.usersCollectionPath).doc(userModel.id);
      return Right(await ref.set(userModel.toMap()));
    }catch(e){
      return const Left('Something went wrong..');
    }
  }
}