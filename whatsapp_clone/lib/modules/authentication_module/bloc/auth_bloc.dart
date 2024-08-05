import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/authentication_module/service/auth_firestore_servce.dart';
import 'package:whatsapp_clone/modules/authentication_module/service/auth_service.dart';
import 'package:whatsapp_clone/modules/authentication_module/model/user_model.dart';
import 'package:whatsapp_clone/shared/show_snack_bar.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthState(isLoading: false, isAuthenticated: false)){
    on<AuthEventInitialize>(_onAuthEventInitialize);
    on<AuthEventSignUp>(_onAuthEventSignUp);
    on<AuthEventLogin>(_onAuthEventLogin);
    on<AuthEventLogout>(_onAuthEventLogout);
    on<AuthEventCreateUser>(_onAuthEventCreateUser);
  }

  final AuthService _authService = AuthService();
  final AuthFirestoreServce _firestoreServce = AuthFirestoreServce();

  FutureOr<void> _onAuthEventInitialize(AuthEventInitialize event, Emitter<AuthState> emit) {
    /*
      here response is checking weather the current user is authinticated or not using stream
      hence we use emit.forEach which requires stream and we are returning the required state 
    */
    final response = _authService.isAuthenticated;
    return emit.forEach(response, onData: (isAuthenticated){       
      return state.copyWith(isAuthenticated: isAuthenticated, user: _authService.currentUser);
    });
  }

  FutureOr<void> _onAuthEventSignUp(AuthEventSignUp event, Emitter<AuthState> emit) async{
    emit(state.copyWith(isLoading: true));  // loading

    final response = await _authService.createUserwithUsernameEmailPassord(username: event.username, email: event.email, password: event.password);
    
    log(response.toString());
    
    response.fold((l) {
      showCustomSnackBar(message: l);
      emit(AuthState(isLoading: false, isAuthenticated: false)); // emit unsuccessfull state
    }, (r) {
      add(AuthEventCreateUser(  
        userModel: UserModel(
          id: r.user?.uid ?? '',
          email: r.user?.email,                 // added a new event to create user
          username: r.user?.displayName,
        )
      ));
      showCustomSnackBar(message: "Account Created Successfully!");
      emit(AuthState(isLoading: false, isAuthenticated: true, user: _authService.currentUser)); // emit successfull state
    });
  }

  FutureOr<void> _onAuthEventLogin(AuthEventLogin event, Emitter<AuthState> emit) async{
    emit(state.copyWith(isLoading: true));            // loading

    final Either<String,UserCredential> response = await _authService.login(email: event.email, password: event.password); 

    response.fold(
      (l){
        log(l);
        showCustomSnackBar(message: l);
        emit(state.copyWith(isLoading: false,isAuthenticated: false)); // emit unsuccessfull state
      }, (r){
        log(r.toString());
        showCustomSnackBar(message: "Login Successful!");
        emit(state.copyWith(isLoading: false,isAuthenticated: true,user: _authService.currentUser));  // emit successfull state
      }
    );
  }

  FutureOr<void> _onAuthEventLogout(AuthEventLogout event, Emitter<AuthState> emit) async{
    emit(state.copyWith(isLoading: true));      // emit unsuccessfull state
    
    final response = await _authService.logout();   // logout 
    response.fold(
      (l) {
        showCustomSnackBar(message: l);
      },
      (r) {
        showCustomSnackBar(message: 'Logout successful!');
        emit(
          state.copyWith(isLoading: false, isAuthenticated: false),   // emit successfull state
        );
      },
    );
  }

  FutureOr<void> _onAuthEventCreateUser(AuthEventCreateUser event, Emitter<AuthState> emit) async{
    await _firestoreServce.createUser(userModel: event.userModel);
  }

}
