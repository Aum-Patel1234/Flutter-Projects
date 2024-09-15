part of 'auth_shared_widgets.dart';

class CustomUnderlinedButton extends StatelessWidget {
  const CustomUnderlinedButton({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(Config.paddingEight),
        child: Text(
          text,
          style: const TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
