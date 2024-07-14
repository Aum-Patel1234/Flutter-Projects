import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.field, required this.controller, required this.formKey});
  
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final String field;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: field,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 3),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$field can\'t be empty';
          }
          return null;
        },
      ),
    );
  }
}
