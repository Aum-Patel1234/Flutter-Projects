part of 'src/chat_screen_widgets.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: state.messages.length, // edit this
            reverse: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return MessageListTile(message: state.messages.elementAt(index),bloc: context.read<ChatBloc>(),);
            },
          ),
        );
      },
    );
  }
}
