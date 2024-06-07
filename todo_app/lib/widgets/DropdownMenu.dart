import 'package:flutter/material.dart';
import 'package:todo_app/widgets/Appbar.dart';

class CustonDropdownMenu extends StatefulWidget {
  final double? width;
  final bool disableIcon;
  
  const CustonDropdownMenu({super.key, this.width, this.disableIcon=false});

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
    double width = MediaQuery.of(context).size.width;

    return DropdownMenu(
      width: widget.width ?? width*0.5,
      controller: sectioncontroller,
      initialSelection: !widget.disableIcon ? Section.one : Section.two,
      // enableFilter: true,
      // enableSearch: true,
      requestFocusOnTap: true,        // important property
      label: !widget.disableIcon ? const Text(
        'Sections',
        style: TextStyle(color: Colors.white60),
      ):const SizedBox(),
      leadingIcon: !widget.disableIcon ? const Icon(Icons.search,color: Colors.white) : const SizedBox(),
      textStyle: TextStyle(color: themeColor),
      inputDecorationTheme: InputDecorationTheme(
        isDense: !widget.disableIcon ? true : false,            // useful
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
          Section.values.where((section){
            if(widget.disableIcon && (section == Section.one || section == Section.seven || section == Section.eight) ){
              return false;
            }
            return true;
          })
          .map<DropdownMenuEntry<Section>>((Section section) {
           return DropdownMenuEntry(
          value: section, 
          label: section.string,
          leadingIcon: !widget.disableIcon ? Icon(section.icon) : const SizedBox(),
          enabled: section.string != 'New List',
          
          style: MenuItemButton.styleFrom(
            foregroundColor: Colors.black,
            iconColor: Colors.black87,
            disabledForegroundColor: Colors.black26,
            
          )
        );
      }).toList(),
    );
  }
}
