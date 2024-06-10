import 'package:flutter/material.dart';
import 'package:flutter_application_contactsapp/screens/Contact.dart';
import 'package:flutter_application_contactsapp/screens/ContactEntryAlertBox.dart';
// import 'package:flutter_application_contactsapp/screens/ContactEntryPage.dart';
import 'package:flutter_application_contactsapp/widgets/Body.dart';

int globalsectionNumber = 2;

class ContactDisplayPage extends StatefulWidget {
  const ContactDisplayPage({super.key});

  // final String title;

  @override
  State<ContactDisplayPage> createState() => _ContactDisplayPage();
}

class _ContactDisplayPage extends State<ContactDisplayPage> {
  List<Contact> contacts = [];

  bool selected_favourites = false;
  bool selected_recents = false;
  bool selected_contacts = true;

  int currentIndexNumber = 2;
  // Color selecteditemColor = Colors.white;
  // Color unselecteditemColor = Colors.white60;

  @override
  Widget build(BuildContext context) {
    // print('here $sectionNumber');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
        title: const Text(
          'Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Body(
        contacts: contacts,
        sectionNumber: globalsectionNumber,
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Contacts',
        hoverColor: const Color.fromARGB(255, 150, 150, 150),
        hoverElevation: 20,
        backgroundColor: const Color.fromARGB(255, 57, 57, 57),
        splashColor: Colors.white,
        onPressed: () async {
          try {
            // final Contact contact = await Navigator.pushNamed<Contact>(
            //   context,
            //   "/ContactEntryPage",
            // ) as Contact;
            final Contact? contact = await showDialog(
              context: context, 
              builder: (context){
                return ContactEntryAlertBox(contacts: contacts,);
              }
            );
            
            // print(contact);

            setState(() {
              contacts.add(contact!);
            });
          } catch (e) {
            // print('Error navigating to ContactEntryPage: $e');
          }
        },
        child: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndexNumber,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        selectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(
          color: Colors.white38,
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedItemColor: Colors.white70,
        // fixedColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),

        items: [
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected_favourites == true
                    ? Colors.white
                    : Colors.transparent, // Set the background color here
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    globalsectionNumber = 0;
                    // print(sectionNumber);

                    selected_favourites = true;
                    selected_contacts = false;
                    selected_recents = false;
                    currentIndexNumber = 0;
                  });
                },
                icon: const Icon(Icons.star_border, color: Colors.blue),
              ),
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected_recents == true
                    ? Colors.white
                    : Colors.transparent, // Set the background color here
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    globalsectionNumber = 1;
                    // print(sectionNumber);

                    selected_favourites = false;
                    selected_recents = true;
                    selected_contacts = false;
                    currentIndexNumber = 1;
                  });
                },
                icon: const Icon(Icons.recent_actors, color: Colors.blue),
              ),
            ),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected_contacts == true
                    ? Colors.white
                    : Colors.transparent, // Set the background color here
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    globalsectionNumber = 2;
                    // print(sectionNumber);

                    selected_favourites = false;
                    selected_recents = false;
                    selected_contacts = true;
                    currentIndexNumber = 2;
                  });
                },
                icon: const Icon(Icons.contacts, color: Colors.blue),
              ),
            ),
            label: 'Contacts',
          ),
        ],
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}

int getglobalsectionNumber() {
  return globalsectionNumber;
}
