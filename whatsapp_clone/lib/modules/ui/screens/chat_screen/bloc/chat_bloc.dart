import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/models/users_model/user_model.dart';
import 'package:whatsapp_clone/modules/ui/screens/chat_screen/service/firestore_chat_service.dart';
import '../../../../../models/chat_model/message_model.dart';

part 'chat_state.dart';
part 'chat_event.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({required this.sender, required this.receiver}):super(ChatState(isLoading: false,messages: [],receiver: receiver)){
    on<ChatEventInitialize>(_onChatEventInitialize);
    on<ChatEventSendMessage>(_onChatEventSendMessage);
    on<ChatEventSendImage>(_onChatEventSendImage);
  }

  final UserModel sender;
  final UserModel receiver;

  final FirestoreChatService _chatService = FirestoreChatService();
  late final String _chatId;

  FutureOr<void> _onChatEventInitialize(ChatEventInitialize event, Emitter<ChatState> emit)async {
    emit(state.copyWith(isLoading: true));            // loading state

    _chatId = await _chatService.createChat(sender: sender, receiver: receiver);

    final Stream<List<MessageModel>> messages = _chatService.getMessages(chatId: _chatId);    // get stream of messages

    return emit.forEach(messages, onData: (messages){  
      return state.copyWith(                              // continously emit messages 
        isLoading: false,
        messages: messages,
      );
    });
  }

  FutureOr<void> _onChatEventSendMessage(ChatEventSendMessage event, Emitter<ChatState> emit) async{
    emit(state.copyWith(isLoading: true));            // loading state

    final MessageModel message = MessageModel(
        id: '',                               // the id will be auto generated handled in sendMessage function of service
        text: event.message,
        sentAt: DateTime.now(),
        sentBy: sender.id,
        senderName: sender.username ?? sender.email!.split('@')[0],
    );
    
    await _chatService.sendMessage(message: message, chatId: _chatId);

    emit(state.copyWith(isLoading: false));            // sent message
  }

  FutureOr<void> _onChatEventSendImage(ChatEventSendImage event, Emitter<ChatState> emit) {
  }
}
