part of 'src/chat_screen_widgets.dart';

class SendMessageTextfield extends StatefulWidget {
  const SendMessageTextfield({super.key,});

  @override
  State<SendMessageTextfield> createState() => _SendMessageTextfieldState();
}

class _SendMessageTextfieldState extends State<SendMessageTextfield> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if(_controller.text.isEmpty){
      return;
    }
    final message = _controller.text.trim();
    context.read<ChatBloc>().add(ChatEventSendMessage(message: message));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          const ImagePickerIcon(),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
              onSubmitted: (value) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8,),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF22BE65),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send,),
              onPressed:_sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
