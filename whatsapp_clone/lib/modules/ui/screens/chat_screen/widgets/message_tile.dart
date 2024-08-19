part of 'src/chat_screen_widgets.dart';

class MessageListTile extends StatelessWidget {
  const MessageListTile({
    super.key,
    required this.message,
    this.senderId,
    this.bloc,
  });

  final MessageModel message;
  final String? senderId; // sender is only required when it is a group chat
  final ChatBloc? bloc;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final bool isSentByYou = bloc != null
        ? bloc!.sender.id == message.sentBy
        : context.read<AuthBloc>().state.user!.id == senderId;

    return Row(
      mainAxisAlignment:
          isSentByYou ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: width * 0.7,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSentByYou
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(15),
              bottomRight: const Radius.circular(15),
              topLeft: isSentByYou ? const Radius.circular(15) : Radius.zero,
              topRight: isSentByYou ? Radius.zero : const Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (senderId != null && !isSentByYou)
                Text(
                  senderId!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
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
