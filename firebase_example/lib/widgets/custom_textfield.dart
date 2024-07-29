import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.formKey, 
    required this.keyboardType,
    required this.hintText,
    this.obscureText = false, 
    this.validator,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: widget.formKey,
        child: TextFormField(
          obscureText: _obscureText,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
          ),
          validator: widget.validator
        ),
      ),
    );
  }
}
