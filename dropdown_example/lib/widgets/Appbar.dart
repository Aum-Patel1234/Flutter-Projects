import 'package:flutter/material.dart';
import 'package:todo_app/widgets/DropdownMenu.dart';

Color themeColor = Colors.white;

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Appbar();
  }
}

class _Appbar extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: Image(
                image: AssetImage(
                  'assets/images/icons8-microsoft-todo-2019-48.png',
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            CustonDropdownMenu(),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.search, color: themeColor),
            ),
            const SizedBox(width: 15.0), // Optional spacing between icons
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.more_vert, color: themeColor),
            ),
          ],
        )
      ],
    );
  }
}
