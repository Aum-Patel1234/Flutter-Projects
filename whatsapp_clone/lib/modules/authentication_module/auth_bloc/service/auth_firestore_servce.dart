import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whatsapp_clone/modules/authentication_module/model/user_model.dart';

class AuthFirestoreServce{
  final FirebaseFirestore _client =FirebaseFirestore.instance;

  Future<Either<String, void>> createUser({required UserModel userModel})async{
    try{
      final ref =_client.collection('users').doc(userModel.id);
      return Right(await ref.set(userModel.toMap()));
    }catch(e){
      return const Left('Something went wrong..');
    }
  }
}