import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  UserModel({required this.id, this.username, this.email});

  final String id;
  final String? username;
  final String? email;

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
      id: map['id'] as String,
      email: map['email'] != null ? map['email'] as String : 'null',   // handle null
      username: map['username'] != null ? map['username'] as String : map['email'].toString().split('@')[0],
    );
  }

  UserModel copyWith({String? username,}){
    return UserModel(
      id: id,
      username: username ?? this.username,
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      username: user.displayName,
      email: user.email,
    );
  }
}