import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/models/recent_chats_model/recent_message_modol.dart';

part 'recent_chat_state.dart';
part 'recent_chat_event.dart';

class RecentChatBloc extends Bloc<RecentChatEvent,RecentChatState>{
  RecentChatBloc():super(RecentChatState(recentChats: [])){
    on<RecentChatEventInitialize>(_onRecentChatEventInitialize);
  }

  FutureOr<void> _onRecentChatEventInitialize(RecentChatEventInitialize event, Emitter<RecentChatState> emit) {
    
  }
}