

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  
  const CustomTextField({
    super.key,
    required this.controller, required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(
          hintText,
          style :TextStyle(color:Theme.of(context).brightness == Brightness.dark? Colors.white54 : Colors.black54),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color: Theme.of(context).brightness == Brightness.dark? Colors.white: Colors.black87,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark? Colors.white: Colors.black87,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}