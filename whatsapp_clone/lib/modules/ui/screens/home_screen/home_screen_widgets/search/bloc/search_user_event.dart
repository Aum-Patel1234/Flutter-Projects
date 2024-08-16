part of 'search_user_bloc.dart';

abstract class SearchUserEvent {
  const SearchUserEvent();
}

class SearchUserEventQueryChanged extends SearchUserEvent {
  const SearchUserEventQueryChanged({
    required this.query,
  });

  final String query;
}