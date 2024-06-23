abstract class UserEvent{
  const UserEvent();
}

class UserEventGetUsers extends UserEvent{}

class UserEventGetUserProfile extends UserEvent{
  final int index;

  UserEventGetUserProfile({required this.index});
}