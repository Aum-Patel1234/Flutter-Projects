part of 'search_user_bloc.dart';

class SearchUserState {
  const SearchUserState({
    required this.isLoading,
    required this.users,
  });

  final bool isLoading;
  final List<UserModel> users;

  SearchUserState copyWith({
    bool? isLoading,
    List<UserModel>? users,
  }) {
    return SearchUserState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }
}