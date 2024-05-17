import 'package:flutter/material.dart';

TextEditingController _namecontroller1 = TextEditingController();
TextEditingController _namecontroller2 = TextEditingController();

Future<String?> askName(BuildContext context, int num)async {
  String? result = await showDialog<String?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
          child: Text(
            'Player $num Details :',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        content: TextField(
          controller: num == 1 ? _namecontroller1 : _namecontroller2,
          maxLength: 10,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Name',
            labelStyle: const TextStyle(color: Colors.white),
            hintText: 'Enter Your Name here',
            icon: const Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Colors.white),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context,num == 1 ? _namecontroller1.text : _namecontroller2.text);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary),
            ),
            child: const Text(
              'Sumbit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
  return result;
}

@override
void dispose(){
  _namecontroller1.dispose();
  _namecontroller2.dispose();
}
