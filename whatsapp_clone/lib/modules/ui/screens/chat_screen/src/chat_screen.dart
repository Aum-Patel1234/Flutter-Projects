library chat_screen;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/ui/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:whatsapp_clone/modules/ui/shared/full_screen_loader.dart';
import '../widgets/src/chat_screen_widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ChatBloc>().add(const ChatEventInitialize()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return FullScreenLoader(
          isLoading: state.isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(state.receiver.username ?? state.receiver.email!.split('@')[0]),
            ),
            body: const Column(
              children: [
                Expanded(
                  child: MessageListView(),
                ),
                SizedBox(
                  height: 60, // Adjust height as needed
                  child: SendMessageTextfield(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
