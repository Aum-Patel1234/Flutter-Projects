part of 'src/chat_screen_widgets.dart';

class MessageListTile extends StatelessWidget {
  const MessageListTile({
    super.key, required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final bool isSentByYou = context.read<ChatBloc>().sender.id == message.sentBy;

    return Row(
      mainAxisAlignment: isSentByYou ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: width * 0.7,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSentByYou
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.text,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isSentByYou
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('hh:mm aa').format(message.sentAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
