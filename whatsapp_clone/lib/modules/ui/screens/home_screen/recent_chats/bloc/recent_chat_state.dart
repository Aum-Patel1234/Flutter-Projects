part of 'recent_chat_bloc.dart';

class RecentChatState{
  RecentChatState({required this.recentChats});

  final List<RecentMessageModel> recentChats;

  RecentChatState copyWith({
    List<RecentMessageModel>? recentChats,
  }) {
    return RecentChatState(
      recentChats: recentChats ?? this.recentChats,
    );
  }
}