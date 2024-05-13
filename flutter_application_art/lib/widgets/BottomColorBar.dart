import 'package:flutter/material.dart';
import 'package:flutter_application_art/screens/MyHomePage.dart';

class BottomColorBar extends StatefulWidget {
  const BottomColorBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomColorBar();
  }
}

class _BottomColorBar extends State<BottomColorBar> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return SizedBox(
      height: height * 0.05,
      width: width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          element(Colors.red, width),
          element(Colors.green, width),
          element(Colors.blue, width),
          element(Colors.yellow, width),
        ],
      ),
    );
  }


  void Function()? onPressed(Color color) {
    setState(() {
      selected = color;
    });

    return null;
  }


  Widget element(Color color,double width) {
    return Container(
      width: width * 0.1,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: selected == color ? Colors.white : Colors.transparent,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(width * 0.03),
      ),
      child: TextButton(
        onPressed: () {
          onPressed(color);
        },
        child: const SizedBox(),
      ),
    );
  }
}
