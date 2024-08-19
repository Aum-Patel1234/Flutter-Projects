import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/models/group_chat_model/group_model.dart';
import 'package:whatsapp_clone/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:whatsapp_clone/modules/ui/screens/groups/service/groups_service.dart';
import 'package:whatsapp_clone/modules/ui/screens/groups/view/group_chat_view.dart';

class GroupsListview extends StatelessWidget {
  GroupsListview({super.key});

  final GroupsService _groupsService = GroupsService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _groupsService.getGroups(userId: context.read<AuthBloc>().state.user!.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Show a loading indicator
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No recent chat data available.'));
        }

        final chats = snapshot.data;

        return ListView.builder(
          itemCount: chats!.length,
          itemBuilder: (context, index) {
            final group = chats.elementAt(index);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                onTap: () async{
                  final GroupModel groupModel = await _groupsService.getGroup(groupId: group.groupId);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroupChatView(group: groupModel)));
                },
                tileColor: Theme.of(context).colorScheme.onTertiary,
                title: Text(group.groupName),
              ),
            );
          },
        );
      },
    );
  }
}
