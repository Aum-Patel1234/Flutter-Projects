class UserGroupModel {
  final String groupId;
  final String groupName;
  final bool isAdmin;

  UserGroupModel({
    required this.groupId,
    required this.groupName,
    required this.isAdmin,
  });

  factory UserGroupModel.fromMap(Map<String, dynamic> map) {
    return UserGroupModel(
      groupId: map['groupId'] ?? '',
      groupName: map['groupName'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'groupId': groupId,
      'groupName': groupName,
      'isAdmin': isAdmin,
    };
  }

  UserGroupModel copyWith({
    String? groupId,
    String? groupName,
    bool? isAdmin,
  }) {
    return UserGroupModel(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }
}
