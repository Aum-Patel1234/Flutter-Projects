import 'package:flutter/material.dart';
import 'package:flutter_application_contactsapp/screens/Contact.dart';
import 'package:flutter_application_contactsapp/screens/ContactInformationPage.dart';
import 'package:flutter_application_contactsapp/screens/ContantsDisplayPage.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  List<Contact> contacts;
  int sectionNumber;

  Body({super.key, required this.contacts, required this.sectionNumber});

  @override
  State<StatefulWidget> createState() {
    // print('in body - $sectionNumber');

    return _Body(contacts: contacts, sectionNumber: sectionNumber);
  }
}

class _Body extends State<Body> {
  List<Contact> contacts;
  int sectionNumber;

  _Body({required this.contacts, required this.sectionNumber});

  // the problem lies in that when set state is called the build method is rebuilded and thus only the value that we
  // gave at start i.e 2 is being repeated
  // 3hrs

  Widget body(List<Contact> contacts, int sectionNumber) {
    // print('function - $sectionNumber');

    if (contacts.isEmpty) {
      return const Text(
        'No contacts added',
        style: TextStyle(color: Colors.white),
      );
    } else if (sectionNumber == 1) {
      List<Contact> recents = [];
      for (Contact contact in contacts) {
        if (contact.recents == true) {
          recents.add(contact);
        }
      }
      return ListView.builder(
        itemCount: recents.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              recents[index].name,
              style: const TextStyle(color: Colors.white),
            ),
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            subtitle: Text(
              recents[index].phonenumber,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: recents[index].favourites == true
                ? const Icon(
                    Icons.star,
                    color: Colors.white,
                  )
                : const SizedBox(),
            onTap: () {
              Navigator.push<Contact>(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactInformationPage(edit_box: false,
                      contact: recents[index], contacts: contacts , ),
                ),
              );
            },
          ),
        ),
      );
    } else if (sectionNumber == 0) {
      List<Contact> favourites = [];
      for (Contact contact in contacts) {
        if (contact.favourites == true) {
          favourites.add(contact);
        }
      }
      return ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              favourites[index].name,
              style: const TextStyle(color: Colors.white),
            ),
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            subtitle: Text(
              favourites[index].phonenumber,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: favourites[index].favourites == true
                ? const Icon(
                    Icons.star,
                    color: Colors.white,
                  )
                : const SizedBox(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactInformationPage(edit_box: false,
                      contact: favourites[index], contacts: contacts),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              contacts[index].name,
              style: const TextStyle(color: Colors.white),
            ),
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            subtitle: Text(
              contacts[index].phonenumber,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                contacts[index].favourites == true // ternary operator
                    ? const Icon(
                        Icons.star,
                        color: Colors.white,
                      )
                    : const SizedBox(),
                IconButton(
                    splashColor: Colors.white,
                    // splashRadius: 10,
                    onPressed: () async {
                      bool delete = await opendialog(context);

                      if (delete) {
                        setState(() {
                          contacts.removeAt(index);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
              ],
            ),
            onTap: () async {
              // Navigate to ContactInformationPage and wait for result
              Contact? localContact = await Navigator.push<Contact>(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactInformationPage(
                    edit_box: true,
                    contact: contacts[index],
                    contacts: contacts,
                  ),
                ),
              );
              // print(localContact);

              // Check if localContact is not null and setState to update the contact
              if (localContact != null) {
                setState(() {
                  contacts[index] = localContact;
                  // Alternatively, if you are adding a new contact, use contacts.add(localContact);
                });
              }
            },
          ),
        ),
      );
    }
  }

  Future<bool> opendialog(BuildContext context) async {
    bool ans = false;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Do You Want to delete ?'),
        titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
        content: Container(
          width: 100,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('No'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  ans = true;
                  Navigator.pop(context, true);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        ),
      ),
    );

    return ans;
  }

  @override
  Widget build(BuildContext context) {
    sectionNumber =
        getglobalsectionNumber(); // for geting sectionNumber from display page
    return body(contacts, sectionNumber);
  }

  @override
  void didUpdateWidget(Body oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.sectionNumber != oldWidget.sectionNumber) {
      setState(() {});
    }
  }
}
