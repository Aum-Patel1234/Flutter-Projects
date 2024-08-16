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
