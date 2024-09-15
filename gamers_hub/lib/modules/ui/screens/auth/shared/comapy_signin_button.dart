part of 'auth_shared_widgets.dart';

class CompanySignInButton extends StatelessWidget {
  const CompanySignInButton({
    super.key, required this.imageLink,
  });

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
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