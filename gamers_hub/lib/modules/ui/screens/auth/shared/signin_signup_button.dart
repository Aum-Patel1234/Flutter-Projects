part of 'auth_shared_widgets.dart';

class SigninSignupButton extends StatelessWidget {
  const SigninSignupButton({super.key, required this.text, required this.emailKey, required this.passwordKey});

  final String text;
  final GlobalKey<FormState> emailKey;
  final GlobalKey<FormState> passwordKey;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, Config.paddingSixteen, 0, Config.paddingSixteen),
      child: Center(
        child: Container(
          width: width * 0.8,
          decoration: BoxDecoration(
            color: const Color(0xFF43B27F),
            borderRadius: BorderRadius.circular(Config.borderRadius),
          ),
          child: TextButton(
            onPressed: () {
              
            },
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
