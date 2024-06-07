import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Want to customize notifications?\nGo to Settings',style: TextStyle(fontSize: 13),),
              action: SnackBarAction(
                label: 'SETTINGS',
                onPressed: (){},
              ),
            ),
          );
        },
        child: const Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Notifications',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'No notifications if date not set',
                style: TextStyle(fontSize: 15, color: Colors.white60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
