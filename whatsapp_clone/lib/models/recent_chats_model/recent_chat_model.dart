/*
 structure  - recent chat flow -> /recentChats/userId/List<chatId>
 then get the most recent chat from the chatId(u1.id_u2.id)/messages   
*/ 
class RecentChatModel {
  const RecentChatModel({
    required this.chatId,
  });

  final String chatId;      // pending

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chatId': chatId,
    };
  }

  factory RecentChatModel.fromMap(Map<String, dynamic> map) {
    return RecentChatModel(
      chatId: map['chatId'] as String,
    );
  }
}
