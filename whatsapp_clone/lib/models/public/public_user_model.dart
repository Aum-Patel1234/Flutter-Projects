class PublicUserModel{
  PublicUserModel({required this.id});

  final String id;

  Map<String,String> toMap(){
    return {
      'id': id,
    };
  }

  factory PublicUserModel.fromMap(Map<String,String> map){
    return PublicUserModel(id: map['id'] ?? '');
  }
}