enum MessageType { text, image }

class MessageModel {
  const MessageModel({
    required this.id,
    required this.text,
    this.type = MessageType.text,
    required this.sentAt,
    required this.sentBy,         // sentBy is the id of the person who sends it
    required this.senderName
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      text: map['text'] as String,
      type: _getMessageType(map['type'] as String),
      sentAt: DateTime.fromMillisecondsSinceEpoch(map['sentAt'] as int),
      sentBy: map['sentBy'] as String,    
      senderName: map['senderName'] as String,        
    );
  }

  final String id;
  final String text;
  final MessageType type;
  final DateTime sentAt;
  final String sentBy;
  final String senderName;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'type': type.name,
      'sentAt': sentAt.millisecondsSinceEpoch,
      'sentBy': sentBy,
      'senderName': senderName
    };
  }

  MessageModel copyWith({
    String? id,
    String? text,
    MessageType? type,
    DateTime? sentAt,
    String? sentBy,
    String? senderName
  }) {
    return MessageModel(
      id: id ?? this.id,
      text: text ?? this.text,
      type: type ?? this.type,
      sentAt: sentAt ?? this.sentAt,
      sentBy: sentBy ?? this.sentBy,
      senderName: senderName ?? this.senderName
    );
  }
}

MessageType _getMessageType(String map) {
  if (map == MessageType.text.name) return MessageType.text;
  return MessageType.image;
}