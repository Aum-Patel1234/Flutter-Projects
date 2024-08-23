part of 'src/chat_screen_widgets.dart';

class ImagePickerIcon extends StatelessWidget {
  const ImagePickerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final ImagePicker imagePicker = ImagePicker();

        imagePicker.pickImage(source: ImageSource.gallery).then((xFile) {
          final path = xFile?.path;
          
          if (path == null) return;

          context.read<ChatBloc>().add(ChatEventSendImage(path: path),);
        });
      },
      icon: const Icon(Icons.image),
    );
  }
}
