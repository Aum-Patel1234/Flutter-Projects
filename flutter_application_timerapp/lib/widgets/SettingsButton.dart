import 'package:flutter/material.dart';
import 'package:flutter_application_timerapp/sceens/Settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
          },
          icon: const Icon(Icons.settings),
        ),
      ),
    );
  }
}
