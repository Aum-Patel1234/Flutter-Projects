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
        Row(
          children: [
            const SizedBox(
              width: 25,
              height: 25,
              child: Image(
                image: AssetImage('assets/images/icons8-microsoft-todo-2019-48.png',),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              child: const CustonDropdownMenu(),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.search,color: themeColor),
            const SizedBox(
              width: 15,
            ),
            Icon(Icons.more_vert,color: themeColor)
          ],
        )
      ],
    );
  }
}
