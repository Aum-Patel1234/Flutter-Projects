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
  State<CustomSigninSignupTextfield> createState() => _CustomSigninSignupTextfieldState();
}

class _CustomSigninSignupTextfieldState extends State<CustomSigninSignupTextfield> {
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
          widget.hintText == "Enter Your Password"
              ? TextField(
                  controller: widget.controller,
                  obscureText: widget.obscureText,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Config.borderRadius),
                    ),
                  ),
                )
              : TextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    
                    final RegExp emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );

                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }

                    return null; // Return null if the input is valid
                  },
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
