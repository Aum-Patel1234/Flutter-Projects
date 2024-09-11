import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_clone/core/utils/constants.dart';
import 'package:whatsapp_clone/models/chat_model/message_model.dart';
import 'package:whatsapp_clone/models/group_chat_model/group_model.dart';
import 'package:whatsapp_clone/models/group_chat_model/user_group_model.dart';
import 'package:whatsapp_clone/models/users_model/user_model.dart';

class GroupsService{
  final FirebaseFirestore _client = FirebaseFirestore.instance;

  void createGroup({required UserModel createdBy,required String groupName,String? description}) async{
    final groupRef = _client.collection(FireStoreConstants.groupsCollectionPath).doc();     // get reference and id
    final GroupModel groupModel = GroupModel(
      id: groupRef.id,
      groupName: groupName,
      createdBy: createdBy.username ?? createdBy.email!.split('@')[0],
      createdAt: DateTime.now(),
      description: description,
    );

    await groupRef.set(groupModel.toMap());     // create a group

    await groupRef.collection(FireStoreConstants.usersCollectionPath).doc(createdBy.id).set(createdBy.toMap());    // add the user who created it

    final UserGroupModel userGroupModel = UserGroupModel(groupId: groupRef.id, groupName: groupName, isAdmin: true);
    await _getUserGroups(createdBy,groupRef.id).set(userGroupModel.toMap());
  }

  DocumentReference<Map<String, dynamic>> _getUserGroups(UserModel user,String groupId) {
    return _client
        .collection(FireStoreConstants.usersCollectionPath)
        .doc(user.id)
        .collection(FireStoreConstants.groupsCollectionPath)
        .doc(groupId);
  }

  void addUser({required UserModel user, required GroupModel group}) async{
    await _getUserCollectionRef(id: group.id).doc(user.id).set(user.toMap());
    
    final UserGroupModel userGroupModel = UserGroupModel(groupId: group.id, groupName: group.groupName, isAdmin: false);
    await _getUserGroups(user,group.id).set(userGroupModel.toMap());
  }

  Future<GroupModel> getGroup({required String groupId}) async {
    final groupMap = await _client
        .collection(FireStoreConstants.groupsCollectionPath)
        .doc(groupId)
        .get();

    if (groupMap.data() == null) {
      throw Exception("Group data not found");
    }

    return GroupModel.fromMap(groupMap.data()!);
  }


  void sendMessage({required String groupId,required MessageModel message,}) async{ 
    final ref = _getMessageCollectionRef(id: groupId);
    ref.doc().set(message.toMap());
  }

  Stream<List<MessageModel>> getMessages({required String groupId}){
    final ref = _getMessageCollectionRef(id: groupId).orderBy('sentAt', descending: true);
    return ref.snapshots().map((query){
      return query.docs.map((message) => MessageModel.fromMap(message.data())).toList();
    });
  }

  Stream<List<UserGroupModel>> getGroups({required String userId}){
    return _client
      .collection(FireStoreConstants.usersCollectionPath)
      .doc(userId)
      .collection(FireStoreConstants.groupsCollectionPath)
      .snapshots()
      .map(
        (query){
          return query.docs.map((group) => UserGroupModel.fromMap(group.data())).toList();
        }
      );
  }

  CollectionReference<Map<String,dynamic>> _getUserCollectionRef({required String id}){
    return _client.collection(FireStoreConstants.groupsCollectionPath).doc(id).collection(FireStoreConstants.usersCollectionPath);
  }

  CollectionReference<Map<String,dynamic>> _getMessageCollectionRef({required String id}){
    return _client.collection(FireStoreConstants.groupsCollectionPath).doc(id).collection(FireStoreConstants.messages);
  }
}