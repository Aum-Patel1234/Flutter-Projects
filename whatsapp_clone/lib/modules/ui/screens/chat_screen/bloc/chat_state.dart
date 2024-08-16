part of 'chat_bloc.dart';

class ChatState{
  ChatState({required this.isLoading, required this.receiver, required this.messages});

  final bool isLoading;
  final UserModel receiver;
  final List<MessageModel> messages;

  ChatState copyWith({
    bool? isLoading,
    UserModel? receiver,
    List<MessageModel>? messages,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      receiver: receiver ?? this.receiver,
      messages: messages ?? this.messages,
    );
  }
}