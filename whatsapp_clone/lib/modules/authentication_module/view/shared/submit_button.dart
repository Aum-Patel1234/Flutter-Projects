part of 'src/repo.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.text, required this.emailcontroller, required this.passwordcontroller});

  final String text;
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, 
        borderRadius: BorderRadius.circular(8)
      ),
      child: GestureDetector(
        onTap: (){
          context.read<AuthBloc>().add(AuthEventSignUp(username: emailcontroller.text.split('@')[0], email: emailcontroller.text, password: passwordcontroller.text));
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black, 
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
