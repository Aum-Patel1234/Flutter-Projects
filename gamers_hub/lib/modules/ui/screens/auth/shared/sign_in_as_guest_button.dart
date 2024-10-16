part of 'auth_shared_widgets.dart';

class SignInAsGuestButton extends StatelessWidget {
  const SignInAsGuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, Config.paddingSixteen, 0, Config.paddingSixteen),
      child: Center(
        child: Container(
          width: width * 0.8,
          decoration: BoxDecoration(
            color: const Color(0xFF28A745),
            borderRadius: BorderRadius.circular(Config.borderRadius),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Sign In as a Guest",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}