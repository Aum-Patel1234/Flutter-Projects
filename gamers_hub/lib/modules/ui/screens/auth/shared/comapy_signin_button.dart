part of 'auth_shared_widgets.dart';

enum SignInCompany{
  google,
  facebook,
  twitter;
}

class CompanySignInButton extends StatelessWidget {
  const CompanySignInButton({
    super.key, required this.imageLink, required this.signInCompany,
  });

  final String imageLink;
  final SignInCompany signInCompany;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(signInCompany == SignInCompany.google){
          context.read<AuthBloc>().add(AuthEventGoogleSignIn());
        }else if(signInCompany == SignInCompany.facebook){
          context.read<AuthBloc>().add(AuthEventFacebookSignIn());
        }else{
          context.read<AuthBloc>().add(AuthEventTwitterSignIn());
        }
      },
      child: Container(
        margin: const EdgeInsets.all(Config.marginEight),
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(imageLink,width: 25,height: 25,),
        ),
      ),
    );
  }
}