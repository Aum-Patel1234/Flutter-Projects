part of 'auth_bloc.dart';

abstract class AuthEvent{}

class AuthEventInitialize extends AuthEvent{}

class AuthEventSignUp extends AuthEvent{
  AuthEventSignUp({required this.username, required this.email, required this.password});

  final String username;
  final String email;
  final String password;
}

class AuthEventLogin extends AuthEvent{
  AuthEventLogin({required this.email, required this.password});
  
  final String email;
  final String password;
}

class AuthEventLogout extends AuthEvent{}

class AuthEventCreateUser extends AuthEvent{
  AuthEventCreateUser({required this.userModel});

  final UserModel userModel;
}