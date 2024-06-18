
import 'package:flutter/material.dart';
import 'package:flutter_application_timerapp/widgets/SettingsTile.dart';

class Settings extends StatelessWidget{
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [
          SettingsTile(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAboutDialog(
            context: context,
            applicationIcon: const Icon(Icons.timer),
            applicationLegalese: "Made for Learning Purpose",
            applicationName: "Timer App",
          );
        },
        child: const Icon(Icons.info_outline),
      ),
    );
  }
  
}