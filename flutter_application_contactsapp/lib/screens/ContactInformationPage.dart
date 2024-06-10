import 'package:flutter/material.dart';
import 'package:flutter_application_contactsapp/screens/Contact.dart';
import 'package:flutter_application_contactsapp/screens/ContactEntryAlertBox.dart';
import 'package:flutter_application_contactsapp/widgets/NavigationBar.dart';

class ContactInformationPage extends StatefulWidget {
  final Contact contact;
  final List<Contact> contacts;
  final bool edit_box;

  const ContactInformationPage(
      {super.key, required this.edit_box ,required this.contact, required this.contacts});

  // final String title;

  @override
  State<ContactInformationPage> createState() =>
      _ContactInformationPage(contact : contact, contacts: contacts);
}

class _ContactInformationPage extends State<ContactInformationPage> {
  Contact contact; // not allowed if contact is null
  IconData star_icon = Icons.star_border;
  final List<Contact> contacts;

  _ContactInformationPage({ required this.contact, required this.contacts}) {
    star_icon =
        contact.favourites == true ? Icons.star : Icons.star_border;
  }

  @override
  Widget build(BuildContext context) {
    String name = contact.name;
    String number = contact.phonenumber;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.navigate_before,
                color: Colors.white,
              ),
              onPressed: () {
                // print('jj');
                // print(contact?.name);
                setState(() {
                  Navigator.pop(context, contact);
                });
              },
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Contact Information',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 100,
                      height: 250,
                      child: const Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 2,
                    color: const Color.fromARGB(255, 161, 157, 157),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  NavigationBarCustom(
                    icon1: Icons.call,
                    icon1_text: 'Call',
                    icon1onPressed: () {
                      // add to recents
                      contact.recents = true;
                    },
                    icon2: Icons.message,
                    icon2_text: 'Message',
                    icon2onPressed: () {},
                    icon3: Icons.video_call,
                    icon3_text: 'Set up',
                    icon3onPressed: () {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 2,
                    color: const Color.fromARGB(255, 161, 157, 157),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Phone Number',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        ':',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        number,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 10,
                top: 10,
                child: TextButton(
                  // style: ButtonStyle(
                  // backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white30)
                  // ),
                  onPressed: () {
                    setState(() {
                      if (contact.favourites == true) {
                        contact.favourites = false;
                      } else {
                        contact.favourites = true;
                      }
                      star_icon = contact.favourites == true
                          ? Icons.star
                          : Icons.star_border;
                    });
                  },
                  child: Icon(
                    star_icon,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: widget.edit_box ? FloatingActionButton(
        onPressed: () async {
          Contact localcontact = await showDialog(
              context: context, 
              builder: (context){
                return ContactEntryAlertBox(contacts: contacts,contact: contact,);
              }
            );
          setState(
            () {
              // Contact localcontact = await Navigator.pushNamed<Contact>(context, '/ContactEntryPage',arguments: contacts) as Contact;

              contact = localcontact;
            },
          );
        },
        child: const Icon(Icons.edit),
      )
      : const SizedBox(),
    );
  }
}
