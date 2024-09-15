part of 'auth_shared_widgets.dart';

class CustomSigninSignupTextfield extends StatefulWidget {
  const CustomSigninSignupTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      required this.header});

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String header;

  @override
  State<CustomSigninSignupTextfield> createState() =>_CustomSigninSignupTextfieldState();
}

class _CustomSigninSignupTextfieldState
    extends State<CustomSigninSignupTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Config.paddingEight, 0, Config.paddingEight, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Config.paddingEight),
            child: Text(widget.header),
          ),
          TextField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Config.borderRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
