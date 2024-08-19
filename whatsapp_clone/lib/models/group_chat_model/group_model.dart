import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  final String id;
  final DateTime createdAt;
  final String createdBy;
  final String groupName;
  final String? description;

  GroupModel({required this.id, required this.groupName,required this.createdBy, required this.createdAt, this.description});

  GroupModel copyWith({DateTime? createdAt, String? groupName, String? description}) {
    return GroupModel(
      id: id,
      groupName: groupName ?? this.groupName,
      createdBy: createdBy,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
    );
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: map['id'] as String,
      groupName: map['groupName'] as String,
      createdBy: map['createdBy'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt,
      'createdBy': createdBy,
      'groupName': groupName,
      'description': description,
    };
  }
}
