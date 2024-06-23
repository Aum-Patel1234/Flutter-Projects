import 'package:flutter_application_restapi_app/model/user_response_model.dart';

class UserState{
  List<UserResponseModel> users;

  UserState({required this.users});
}

class Loading extends UserState{
  Loading({required super.users,});
}
class InitialState extends UserState{
  InitialState({required super.users});
}

class UserProfile extends UserState{
  UserProfile({required this.user,required super.users});
  
  final UserResponseModel user;
}