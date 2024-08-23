import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsapp_clone/core/utils/constants.dart';

class FirestoreStorageService{
  final FirebaseStorage _client = FirebaseStorage.instance;

  Future<String> uploadFile({required String chatId,required String filePath,}) async{
    final Reference ref = _client.ref(FireStoreConstants.chatsCollectionPath).child(chatId).child(
      '${DateTime.now().millisecondsSinceEpoch}.${filePath.split('.').last}'
    );
    final UploadTask uploadTask = ref.putFile(File(filePath));
    
    return await uploadTask.then((snapshot) async{
      return await snapshot.ref.getDownloadURL();
    });
  }
}