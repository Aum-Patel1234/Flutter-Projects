import 'package:firebase_auth/firebase_auth.dart';
// import '../models/user_model.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<bool> get isAuthenticated{
    return _firebaseAuth.authStateChanges().map((user) => user != null);
  }

  // UserModel? get currentUser{
  //   return UserM
  // }

}