import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/ui/screens/home_screen/home_screen_widgets/search/service/search_user_service.dart';

import '../../../../../../../models/users_model/user_model.dart';

part 'search_user_event.dart';
part 'search_user_state.dart';

class SearchUserBloc extends Bloc<SearchUserEvent,SearchUserState>{
  SearchUserBloc():super(const SearchUserState(isLoading: false, users: [])){
    on<SearchUserEventQueryChanged>(_onSearchUserEventQueryChanged);
  }

  final SearchUserService _service = SearchUserService();

  FutureOr<void> _onSearchUserEventQueryChanged(SearchUserEventQueryChanged event, Emitter<SearchUserState> emit) async{
    emit(state.copyWith(isLoading: true));

    final response = await _service.searchUser(query: event.query);
    response.fold(
      (l){},
      (r){
        emit(state.copyWith(isLoading: false,users: r));
      }
    );
  }
}