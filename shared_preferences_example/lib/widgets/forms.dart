import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  const Forms({super.key, required this.label, required this.formKey, required this.controller});

  final String label;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType;
    int maxSize = 0;
    switch (label) {
      case 'Phone Number':
        keyboardType = TextInputType.phone;
        maxSize = 10;
        break;
      case 'Email':
        keyboardType = TextInputType.emailAddress;
        maxSize = 50;
        break;
      case 'Age':
        keyboardType = TextInputType.number;
        maxSize = 3;
        break;
      default:
        keyboardType = TextInputType.name;
        maxSize = 40;
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxSize,
          decoration: InputDecoration(
            hintText: 'Enter Your $label',
            hintStyle: const TextStyle(color: Colors.white38),
            label: Text(label),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          validator: (value){
            switch (label) {
              case 'Phone Number':
                if(value != null){
                  if(value.length < 10 ){
                    return 'Phone number should be of 10 digits';
                  }
                  if(int.tryParse(value) == null){
                    return 'Enter a valid number';
                  }
                }else{
                  return 'Phone number can\'t be empty';
                }
                return null;
              case 'Email':
                RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if(regExp.hasMatch(value!)){
                  return null;
                }
                return 'Not a valid email';
              case 'Age':
                if(value == null || value.isEmpty || int.tryParse(value) == null){
                  return 'Enter valid age';
                }
                return null;
              default:
                if(value == null || value.isEmpty ){
                  return 'Enter valid name';
                }
                return null;
            }
          },
        ),
      ),
    );
  }
}
