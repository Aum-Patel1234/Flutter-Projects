import 'package:flutter/material.dart';
import 'package:flutter_application_contactsapp/screens/Contact.dart';
import 'package:flutter_application_contactsapp/widgets/StandardBorder.dart';

class ContactEntryAlertBox extends StatefulWidget {
  final Contact? contact;
  final List<Contact> contacts;

  const ContactEntryAlertBox({super.key, required this.contacts, this.contact});

  @override
  State<StatefulWidget> createState() {
    return _ContactEntryAlertBox(contact: contact, contacts: contacts);
  }
}

class _ContactEntryAlertBox extends State<ContactEntryAlertBox> {
  Contact? contact;
  final List<Contact> contacts;
  bool favourites = false;
  final formKey = GlobalKey<FormState>();
  final formKeyName = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();

  _ContactEntryAlertBox({required this.contacts, required this.contact});

  void updatePlaceholders() {
    if (contact != null) {
      namecontroller.text = contact!.name;
      phonenumbercontroller.text = contact!.phonenumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    updatePlaceholders();

    return AlertDialog(
      title: const Text(
        'Contact Details',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: SizedBox(
        height: height * 0.35,
        child: Column(
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
                          color: Colors
                              .grey, // You can adjust the color to match your design
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

                        bool flag =
                            true; // to keep a track of whether a number is repeated or not

                        for (Contact con in contacts) {
                          if (namecontroller.text == con.name) {
                            continue; // big brains proud of myself
                          }

                          if (value == con.phonenumber) {
                            // checking duplicate numbers
                            flag = false; // no duplicate numbers
                          }

                          if (value == contact?.phonenumber) {
                            // alowwing same number to change the name
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
                      maxLength: 12,
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        contact == null
            ? FloatingActionButton(
                tooltip: 'Add to Favourites',
                onPressed: () {
                  setState(() {
                    favourites = !favourites;
                  });
                },
                child: favourites? const Icon(Icons.star): const Icon(Icons.star_border),
              )
            : const SizedBox(),           // to kind of disable favourites
      ],
    );
  }
}
