import 'dart:async';
import 'dart:developer';

import 'package:flutter_application_restapi_app/bloc/user_event.dart';
import 'package:flutter_application_restapi_app/bloc/user_state.dart';
import 'package:flutter_application_restapi_app/model/user_response_model.dart';
import 'package:flutter_application_restapi_app/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialState(users: [])) {
    on<UserEventGetUsers>(_onUserEventGetUsers);
    on<UserEventGetUserProfile>(
        _onUserEventGetUserProfile); // no need of this event but just wanted to test out querry Parameters in Uri
  }

  final UserAPI service = UserAPI();

  Future<void> _onUserEventGetUsers(
      UserEventGetUsers event, Emitter<UserState> emit) async {
    emit(Loading(users: []));
    try {
      List<dynamic>? map = await service.getUsers();
      if (map == null) {
        return;
      }
      int i = 0;
      for (Map<String, dynamic> object in map) {
        UserResponseModel usermodel = UserResponseModel(
          id: object['id'],
          name: object['name'],
          username: object['username'],
          email: object['email'],
          address: Address(
            street: object['address']['street'],
            suite: object['address']['suite'],
            city: object['address']['city'],
            zipcode: object['address']['zipcode'],
            geo: Geo(
              lat: object['address']['geo']['lat'],
              lng: object['address']['geo']['lng'],
            ),
          ),
          phone: object['phone'],
          website: object['website'],
          company: Company(
            name: object['company']['name'],
            catchPhrase: object['company']['catchPhrase'],
            bs: object['company']['bs'],
          ),
        );

        if (0 + i != usermodel.id) {
          state.users.add(usermodel);
        }
        i++;
        log(object['id'].toString());
      }

      emit(UserState(users: state.users));
    } catch (e) {
      log('Error fetching users: $e');
    }
  }

  FutureOr<void> _onUserEventGetUserProfile( UserEventGetUserProfile event, Emitter<UserState> emit) async {
    emit(Loading(users: state.users));
    try {
      UserResponseModel userprofile = await service.getUserProfile(event.index);
      emit(UserProfile(
        user: userprofile,
        users: state.users,
      ));
    } catch (e) {
      log(e.toString());
    }
  }
}
