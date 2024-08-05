part of 'src/repo.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.text, required this.emailcontroller, required this.passwordcontroller});

  final String text;
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
       if(text == 'Login'){
        context.read<AuthBloc>().add(AuthEventLogin(email: emailcontroller.text, password: passwordcontroller.text));
       }else{
         context.read<AuthBloc>().add(AuthEventSignUp(username: emailcontroller.text.split('@')[0], email: emailcontroller.text, password: passwordcontroller.text));
       }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, 
          borderRadius: BorderRadius.circular(8)
        ),
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
