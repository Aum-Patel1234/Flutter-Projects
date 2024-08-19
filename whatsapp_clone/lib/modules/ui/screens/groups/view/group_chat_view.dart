import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/models/group_chat_model/group_model.dart';
import 'package:whatsapp_clone/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:whatsapp_clone/modules/ui/screens/chat_screen/widgets/src/chat_screen_widgets.dart';
import 'package:whatsapp_clone/modules/ui/screens/groups/service/groups_service.dart';
import '../../../../../models/chat_model/message_model.dart';
import '../../home_screen/home_screen_widgets/src/home_screen_widgets.dart';

class GroupChatView extends StatelessWidget {
  GroupChatView({super.key, required this.group});

  final GroupModel group;
  final TextEditingController _controller = TextEditingController();
  final GroupsService _groupsService = GroupsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(group.groupName), // Use the group name in the app bar title
        actions: [
          IconButton(
            onPressed: () async {
              showSearch(
                  context: context,
                  delegate: CustomSearchBar(groupModel: group));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: _groupsService.getMessages(groupId: group.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading messages'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No messages yet'));
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemCount: snapshot.data!.length, // edit this
                    reverse: true,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final message = snapshot.data![index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MessageListTile(
                          message: message,
                          senderId: message.sentBy,
                          senderName: message.senderName,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 60, // Adjust height as needed
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onSubmitted: (value) => _sendGroupMessage(
                          groupId: group.id,
                          sentBy: context.read<AuthBloc>().state.user!.id,
                          senderName:
                              context.read<AuthBloc>().state.user!.username ??
                                  context
                                      .read<AuthBloc>()
                                      .state
                                      .user!
                                      .email!
                                      .split('@')[0]),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF22BE65),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => _sendGroupMessage(
                          groupId: group.id,
                          sentBy: context.read<AuthBloc>().state.user!.id,
                          senderName:
                              context.read<AuthBloc>().state.user!.username ??
                                  context
                                      .read<AuthBloc>()
                                      .state
                                      .user!
                                      .email!
                                      .split('@')[0]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendGroupMessage(
      {required String groupId,
      required String sentBy,
      required String senderName}) {
    if (_controller.text.isEmpty) {
      return;
    }
    final message = MessageModel(
      id: 'id',
      text: _controller.text.trim(),
      sentAt: DateTime.now(),
      sentBy: sentBy,
      senderName: senderName,
    );
    _groupsService.sendMessage(groupId: groupId, message: message);
    _controller.clear();
  }
}
