import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whatsapp_clone/modules/authentication_module/model/user_model.dart';

class SearchUserService{
  final _client = FirebaseFirestore.instance;

  Future<Either<String, List<UserModel>>> searchUser({required String query}) async{
    try{
      final response = await _client.collection('users').where('email',isGreaterThanOrEqualTo: query.trim()).get();
      final docs = response.docs;
      
      log(docs.toString());
      return Right(
        docs.map((doc) => UserModel.fromMap(doc.data())).toList(),
      );
    }catch (e){
      return Left(e.toString());
    }
  }
}