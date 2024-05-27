import 'package:flutter/material.dart';
import 'package:todo_app/widgets/Appbar.dart';

class CustonDropdownMenu extends StatefulWidget {
  const CustonDropdownMenu({super.key});

  @override
  State<CustonDropdownMenu> createState() => _CustonDropdownMenu();
}

enum Section {
  one(Icons.home, 'All Lists'),
  two(Icons.list, 'Default'),
  three(Icons.list, 'Personal'),
  four(Icons.list, 'Shopping'),
  five(Icons.list, 'Wishlist'),
  six(Icons.list, 'Work'),
  seven(Icons.check_box, 'Finished'),
  eight(Icons.list, 'New List');

  const Section(this.icon, this.string);
  final IconData icon;
  final String string;
}

class _CustonDropdownMenu extends State<CustonDropdownMenu> {
  TextEditingController sectioncontroller = TextEditingController();
  Section? selected;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      controller: sectioncontroller,
      initialSelection: Section.one,
      // enableFilter: true,
      // enableSearch: true,
      requestFocusOnTap: true,        // important property
      label: const Text(
        'Sections',
        style: TextStyle(color: Colors.white60),
      ),
      leadingIcon: const Icon(Icons.search,color: Colors.white),
      textStyle: TextStyle(color: themeColor),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      onSelected: (value) {
        setState(() {
          selected = value;
        });
      },
      dropdownMenuEntries:
          Section.values.map<DropdownMenuEntry<Section>>((Section section) {
        return DropdownMenuEntry(
          value: section, 
          label: section.string,
          leadingIcon: Icon(section.icon),
          enabled: section.string != 'New List',
          
          style: MenuItemButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 36, 36, 36),
            foregroundColor: Colors.white,
            iconColor: Colors.white54,
            disabledForegroundColor: Colors.white24,
          )
        );
      }).toList(),
    );
  }
}
