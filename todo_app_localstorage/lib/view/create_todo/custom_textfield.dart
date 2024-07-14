 import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.purpose,
    required this.icon,
    required this.controller, required this.formkey,
  });

  final String purpose;
  final IconData icon;
  final TextEditingController controller;
  final GlobalKey<FormState>? formkey;

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Form(
        key: formkey,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.deepPurple),
            hintText: '$purpose of Todo',
            hintStyle: TextStyle(color: color == Colors.white ? Colors.black38 : Colors.white38),
            labelText: purpose,
            labelStyle: TextStyle(color: color),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: color,
                width: 2,
              ),
            ),
          ),
          maxLines: purpose == 'Description' ? 4 : 1,
          maxLength: purpose == 'Description' ? 200 : 30,
          validator: (value){
            if (value == null || value.isEmpty) {
              return 'Please enter the $purpose';
            }
            return null;
          },
        ),
      ),
    );
  }
}
