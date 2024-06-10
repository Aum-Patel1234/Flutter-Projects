// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

class NavigationBarCustom extends StatefulWidget {
  final IconData icon1;
  final String icon1_text;
  final IconData icon2;
  final String icon2_text;
  final IconData icon3;
  final String icon3_text;
  final void Function()? icon1onPressed;
  final void Function()? icon2onPressed;
  final void Function()? icon3onPressed;
  // void onPressed(){}

  const NavigationBarCustom(
      {super.key,
      required this.icon1,
      required this.icon1_text,
      required this.icon2,
      required this.icon2_text,
      required this.icon3,
      required this.icon3_text,
      required this.icon1onPressed,
      required this.icon2onPressed,
      required this.icon3onPressed});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _NavigationBar(
        icon1: icon1,
        icon1_text: icon1_text,
        icon2: icon2,
        icon2_text: icon2_text,
        icon3: icon3,
        icon3_text: icon3_text,
        icon1onPressed: icon1onPressed,
        icon2onPressed: icon2onPressed,
        icon3onPressed: icon3onPressed);
  }
}

class _NavigationBar extends State<NavigationBarCustom> {
  final IconData icon1;
  final String icon1_text;
  final IconData icon2;
  final String icon2_text;
  final IconData icon3;
  final String icon3_text;
  void Function()? icon1onPressed;
  void Function()? icon2onPressed;
  void Function()? icon3onPressed;

  _NavigationBar(
      {required this.icon1,
      required this.icon1_text,
      required this.icon2,
      required this.icon2_text,
      required this.icon3,
      required this.icon3_text,
      required this.icon1onPressed,
      required this.icon2onPressed,
      required this.icon3onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 110,
            height: 70,
            child: TextButton(
              onPressed: icon1onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon1,
                    size: 25,
                    color: Colors.blue,
                  ),
                  Text(
                    icon1_text,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 110,
            height: 70,
            child: TextButton(
              onPressed: icon2onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon2,
                    size: 22,
                    color: Colors.blue,
                  ),
                  Text(
                    icon2_text,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 110,
            height: 70,
            child: TextButton(
              onPressed: icon3onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon3,
                    size: 25,
                    color: Colors.blue,
                  ),
                  Text(
                    icon3_text,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
