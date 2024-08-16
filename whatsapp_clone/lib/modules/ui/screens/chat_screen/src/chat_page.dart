import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/ui/screens/chat_screen/bloc/chat_bloc.dart';

import '../../../../../models/users_model/user_model.dart';
import 'chat_screen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    required this.sender,
    required this.receiver,
  });

  final UserModel sender;
  final UserModel receiver;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(
        sender: sender,
        receiver: receiver,
      ),
      child: const ChatScreen(),
    );
  }
}