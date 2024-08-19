import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:whatsapp_clone/core/utils/constants.dart';
import 'package:whatsapp_clone/models/chat_model/message_model.dart';
import 'package:whatsapp_clone/models/recent_chats_model/recent_chat_model.dart';
import 'package:whatsapp_clone/models/recent_chats_model/recent_message_modol.dart';
import 'package:whatsapp_clone/models/users_model/user_model.dart';
import 'package:whatsapp_clone/modules/authentication_module/service/auth_service.dart';

class RecentChatService {
  final FirebaseFirestore _client = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();

  Stream<RecentMessageModel> geRecentChatStream({required String chatId}) {
    final String currentUserId = _authService.currentUser!.id;
    final String otherUserId = _extractUser(chatId: chatId, senderId: currentUserId);

    final userStream = _getUsersStream(userId: otherUserId);
    final messageStream = _getMessageStream(chatId: chatId);

    return Rx.combineLatest2(userStream, messageStream,
        (UserModel userModel, MessageModel messageModel) {
      return RecentMessageModel(user: userModel, message: messageModel);
    });
  }

  String _extractUser({required String chatId, required String senderId}) {
    final List<String> splitList = chatId.split('_');
    return splitList.firstWhere(
      (String id) => id != senderId,
    );
  }

  CollectionReference<RecentChatModel> getRecentChatQuery() {
    return _client
        .collection(FireStoreConstants.recentCollectionPath)
        .doc(_authService.currentUser!.id)
        .collection(FireStoreConstants.messages)
        .withConverter(fromFirestore: (snapshot, options) => RecentChatModel.fromMap(snapshot.data()!), toFirestore: (RecentChatModel value, options) => value.toMap(),);
  }

  Stream<UserModel> _getUsersStream({required String userId}) {
    return _client
        .collection(FireStoreConstants.usersCollectionPath)
        .doc(userId)
        .snapshots()
        .map((doc) => UserModel.fromMap(doc.data()!));
  }

  Stream<MessageModel> _getMessageStream({required String chatId}) {
    return _client
        .collection(FireStoreConstants.chatsCollectionPath)
        .doc(chatId)
        .collection(FireStoreConstants.messages)
        .limit(1)
        .orderBy(
          'sentAt',
          descending: true,
        )
        .snapshots()
        .map((query) => query.docs.map((doc) => MessageModel.fromMap(doc.data())).first);
  }
}
