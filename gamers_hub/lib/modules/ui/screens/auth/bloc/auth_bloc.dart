import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthState(isLoading: false, isAuthenticated: false)){
    on<AuthEventSignIn>(_onAuthEventSignIn);
    on<AuthEventSignUp>(_onAuthEventSignUp);
    on<AuthEventSignInAsGuest>(_onAuthEventSignInAsGuest);
    on<AuthEventLogout>(_onAuthEventLogout);
    on<AuthEventCreateUser>(_onAuthEventCreateUser);
    on<AuthEventGoogleSignIn>(_onAuthEventGoogleSignIn);
    on<AuthEventFacebookSignIn>(_onAuthEventFacebookSignIn);
    on<AuthEventTwitterSignIn>(_onAuthEventTwitterSignIn);
  }

  FutureOr<void> _onAuthEventSignIn(AuthEventSignIn event, Emitter<AuthState> emit) {
    emit(AuthState(isLoading: true, isAuthenticated: false));
  
    
  }

  FutureOr<void> _onAuthEventSignUp(AuthEventSignUp event, Emitter<AuthState> emit) {

  }

  FutureOr<void> _onAuthEventSignInAsGuest(AuthEventSignInAsGuest event, Emitter<AuthState> emit) {

  }

  FutureOr<void> _onAuthEventLogout(AuthEventLogout event, Emitter<AuthState> emit) {

  }

  FutureOr<void> _onAuthEventCreateUser(AuthEventCreateUser event, Emitter<AuthState> emit) {

  }

  FutureOr<void> _onAuthEventGoogleSignIn(AuthEventGoogleSignIn event, Emitter<AuthState> emit) {
  }

  FutureOr<void> _onAuthEventTwitterSignIn(AuthEventTwitterSignIn event, Emitter<AuthState> emit) {
  }

  FutureOr<void> _onAuthEventFacebookSignIn(AuthEventFacebookSignIn event, Emitter<AuthState> emit) {
  }
}