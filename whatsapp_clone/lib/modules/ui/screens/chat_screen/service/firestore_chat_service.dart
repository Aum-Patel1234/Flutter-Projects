import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_clone/core/utils/constants.dart';
import 'package:whatsapp_clone/models/chat_model/chat_model.dart';
import 'package:whatsapp_clone/models/chat_model/message_model.dart';
import 'package:whatsapp_clone/models/users_model/user_model.dart';

class FirestoreChatService{
  final FirebaseFirestore _client = FirebaseFirestore.instance;

  Future<String> createChat({required UserModel sender,required UserModel receiver})async{
    final String chatId = _getChatId(senderId: sender.id, receiverId: receiver.id);
    final ref = _client.collection(FireStoreConstants.chatsCollectionPath).doc(chatId);  // path - '/chats/user.id_other.id'
    final bool isChatCreated = await ref.get().then((doc) => doc.exists);

    if(isChatCreated)   return chatId;    // if chat aldready exists then no need to create one

    final ChatModel chatModel = ChatModel(id: chatId, createdAt: DateTime.now(), createdBy: sender.username ?? sender.email!.split('@')[0]);
    await ref.set(chatModel.toMap());

    return chatId;
  }

  Future<void> sendMessage({required MessageModel message ,required String chatId})async{
    log(message.text);
    final ref = _getMessagesRef(chatId).doc();
    final MessageModel messageModel = message.copyWith(id: ref.id);   // giving auto id genereated to the message
    await ref.set(messageModel.toMap());
  }

  Stream<List<MessageModel>> getMessages({required String chatId}){
    final ref = _getMessagesRef(chatId).orderBy('sentAt',descending: true);
    return ref.snapshots().map((query){
      return query.docs.map((message) => MessageModel.fromMap(message.data())).toList();
    });
  }

  // helper functions

  String _getChatId({required String senderId,required String receiverId}){
    return senderId.compareTo(receiverId) > 0 
      ? '${senderId}_$receiverId'
      : '${receiverId}_$senderId'
    ;
  }

  // this function makes a collection of messages inside chatId in chats  
  // '/chats/user.id_other.id/messages'
  CollectionReference<Map<String, dynamic>> _getMessagesRef(String chatId) {
    return _client
        .collection(FireStoreConstants.chatsCollectionPath)
        .doc(chatId)
        .collection(FireStoreConstants.messages);
  }
}