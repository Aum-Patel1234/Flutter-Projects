import '../chat_model/message_model.dart';
import '../users_model/user_model.dart';

class RecentMessageModel {
  final UserModel user;
  final MessageModel message;
  
  const RecentMessageModel({
    required this.user,
    required this.message,
  });

  String get text {
    if (message.type == MessageType.image) return '🌄 Sent an image';
    return message.text;
  }
}