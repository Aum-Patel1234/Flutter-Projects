import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_example/bloc/users_bloc/users_event.dart';
import 'package:shared_preferences_example/bloc/users_bloc/users_state.dart';
import 'package:shared_preferences_example/core/share_preference.dart';
import 'package:shared_preferences_example/view/enums.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersState(users: [])) {
    on<UsersEventFetchAllUsers>(_onUsersEventFetchAllUsers);
  }

  FutureOr<void> _onUsersEventFetchAllUsers(UsersEventFetchAllUsers event, Emitter<UsersState> emit) async {
    List<String>? users = await fetchUsers('users');
    if (users != null) {
      List<User> allUsers = []; 
      for (String user in users) {
        List<String> data = user.split(' || ');
        allUsers.add(
          User(
            name: data[0],
            phoneNumber: int.parse(data[1]),
            email: data[2],
            age: int.parse(data[3]),
            isMarried: bool.parse(data[4]),
          ),
        );
      }
      emit(UsersState(users: allUsers));
    } else {
      emit(UsersState(users: []));
    }
  }
}
