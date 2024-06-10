// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_contactsapp/screens/Contact.dart';
import 'package:flutter_application_contactsapp/widgets/StandardBorder.dart';

class ContactEntryPage extends StatefulWidget {
  final Contact? contact;

  final List<Contact> contacts;

  const ContactEntryPage(
      {super.key, this.contact, required this.contacts});

  // final String title;

  @override
  State<ContactEntryPage> createState() => _ContactEntryPage(contact: contact, contacts: contacts);
}

class _ContactEntryPage extends State<ContactEntryPage> {
  Contact? contact;
  bool favourites = false;
  final List<Contact> contacts;
  final formKey = GlobalKey<FormState>();
  final formKeyName = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();

  _ContactEntryPage({required this.contact, required this.contacts});

  void writeIfNotNull(Contact? contact) {
    namecontroller.text = contact!.name;
    phonenumbercontroller.text = contact.phonenumber;
  }

  @override
  Widget build(BuildContext context) {
    if (contact != null) {
      writeIfNotNull(contact);
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Contact Information',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 80,
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKeyName,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid name';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    controller: namecontroller,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: const TextStyle(color: Colors.white70),
                      
                      hintText: 'Enter Your Name',
                      hintStyle: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey, // You can adjust the color to match your design
                      ),
                      suffixIcon: const Icon(Icons.people),
                      
                      border: StandardBorder(color: Colors.white),
                      errorBorder: StandardBorder(color: Colors.red),
                      focusedBorder: StandardBorder(width: 3),
                      enabledBorder: StandardBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 90,
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: phonenumbercontroller,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid phone number';
                      } else if (double.tryParse(value) == null) {
                        return 'Enter valid phone number';
                      } else if (value.length < 10 || value.length > 12) {
                        return 'Enter valid phone number';
                      }

                      bool flag = true;               // to keep a track of whether a number is repeated or not
                     

                      for (Contact con in contacts) {

                        if (namecontroller.text == con.name) {
                          continue; // big brains proud of myself
                        }
                        

                        if (value == con.phonenumber ) {          // checking duplicate numbers
                          flag = false; // no duplicate numbers
                        }

                        if(value == contact?.phonenumber){      // alowwing same number to change the name
                          flag = true;
                          break;
                        }
                        
                      }

                      if (!flag) {
                        return 'Number aldready exists';
                      }

                      return null;
                    },
                    onFieldSubmitted: (value) => {
                      // RegExp regex = RegExp(r'^[0-9]&[0-9]');
                      // if(exp.)
                    },
                    maxLines: 1,

                    keyboardType: TextInputType.phone,
                  

                    decoration: InputDecoration(
                      
                      border: StandardBorder(color: Colors.white),
                      errorBorder: StandardBorder(color: Colors.red),
                      focusedBorder: StandardBorder(width: 3),
                      enabledBorder: StandardBorder(),
                      
                      labelText: 'Phone Number',
                      labelStyle: const TextStyle(color: Colors.white70),

                      hintText: 'Enter phone number',
                      hintStyle: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors
                            .grey, // You can adjust the color to match your design
                      ),
                      suffixIcon: const Icon(Icons.phone),
                      // label: const Text('Name'),
                      
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 150,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate() &&
                      formKeyName.currentState!.validate()) {
                    contact = Contact(
                        name: namecontroller.text,
                        phonenumber: phonenumbercontroller.text,
                        favourites: favourites);

                    setState(() {
                      // contact?.name = namecontroller.text;
                      // contact?.phonenumber = phonenumbercontroller.text;
                      Navigator.pop(context, contact);
                    });
                  }
                },
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 42, 41, 41),
        onPressed: () {
          favourites = true;
        },
        child: const Icon(
          Icons.star,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    phonenumbercontroller.dispose();
  }
}
