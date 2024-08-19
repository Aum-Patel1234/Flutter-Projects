import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/modules/ui/screens/chat_screen/src/chat_page.dart';
import 'package:whatsapp_clone/modules/ui/screens/home_screen/recent_chats/service/recent_chat_service.dart';

import '../../../../../authentication_module/bloc/auth_bloc.dart';

class RecentChatBody extends StatelessWidget {
  RecentChatBody({super.key});

  final RecentChatService _recentChatService = RecentChatService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _recentChatService.getRecentChatQuery().snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Show a loading indicator
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No recent chat data available.'));
        }

        final recentChat = snapshot.data!.docs;

        return ListView.builder(
          itemCount: recentChat.length,
          itemBuilder: (context, index) {
            final chat = recentChat[index];

            return StreamBuilder(
              stream: _recentChatService.geRecentChatStream(chatId: chat.data().chatId),
              builder: (context, messageSnapshot) {
                if (messageSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator()); // Show a loading indicator
                }
                if (!messageSnapshot.hasData || messageSnapshot.data == null) {
                  return const Center(child: Text('No recent message data available.'));
                }

                final recentMessage = messageSnapshot.data!;

                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ChatPage(sender: context.read<AuthBloc>().state.user!, receiver: recentMessage.user)));
                  },
                  leading: const CircleAvatar(),
                  title: Text(recentMessage.user.email!), // Adjust according to your model
                  subtitle: Text(recentMessage.message.text),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(DateFormat('hh:mm aa').format(recentMessage.message.sentAt)),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
