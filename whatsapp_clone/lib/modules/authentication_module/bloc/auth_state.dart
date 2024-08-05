part of 'auth_bloc.dart';

class AuthState{
  AuthState({required this.isLoading,required this.isAuthenticated, this.user});

  final bool isLoading;
  final bool isAuthenticated;
  final UserModel? user;

  AuthState copyWith({bool? isLoading,bool? isAuthenticated,UserModel? user,}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
    );
  }
}