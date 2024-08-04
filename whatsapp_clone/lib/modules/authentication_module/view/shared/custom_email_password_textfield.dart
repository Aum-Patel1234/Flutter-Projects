part of 'src/repo.dart';

class CustomEmailPasswordTextField extends StatefulWidget {
  const CustomEmailPasswordTextField({super.key, required this.emailcontroller, required this.passwordcontroller});

  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;

  @override
  State<CustomEmailPasswordTextField> createState() => _CustomEmailPasswordTextFieldState();
}

class _CustomEmailPasswordTextFieldState extends State<CustomEmailPasswordTextField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email',style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: height*0.01,),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Your Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).brightness == Brightness.light ? Colors.black38 : Colors.white30, 
              )
            )
          ),
        ),
        
        SizedBox(height: height*0.025,),

        // Password Section
        Text('Password',style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: height*0.01,),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: isVisible,
                decoration: InputDecoration(
                  hintText: 'Your Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.light ? Colors.black38 : Colors.white30, 
                    )
                  )
                ),
              ),
            ),
            TextButton.icon(
              onPressed: (){
                setState(() {
                  isVisible = !isVisible;
                });
              },
              label: isVisible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
            )
          ],
        ),
      ],
    );
  }
}