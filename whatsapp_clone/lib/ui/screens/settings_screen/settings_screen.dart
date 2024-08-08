import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/authentication_module/bloc/auth_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary, /// Header background color
            ),
            accountEmail: Text(
              context.read<AuthBloc>().state.user?.email ?? 'abc@gmail.com',
            ),
            accountName: Text(
              context.read<AuthBloc>().state.user?.username ?? 'username',
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                (context.read<AuthBloc>().state.user?.username ?? 'U')[0],
                style: TextStyle(color: (Theme.of(context).brightness == Brightness.dark) ? Colors.blueGrey[800] : Colors.black, fontSize: 40),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  onTap: () {
                    // Navigate to Profile screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notifications'),
                  onTap: () {
                    // Navigate to Notifications settings screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.security),
                  title: const Text('Privacy'),
                  onTap: () {
                    // Navigate to Privacy settings screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Help & Support'),
                  onTap: () {
                    // Navigate to Help & Support screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationIcon: const Icon(Icons.whatshot),
                      applicationName: 'WhatsApp Clone',
                      applicationVersion: '1.0.0',
                      applicationLegalese: 'For Learning purpose..',
                    );
                  },
                ),
                const SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: (){
                    showDialog<bool>(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text('Do you want to Logout ?'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop(true);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      }
                    ).then((flag){
                      if(flag!){
                        context.read<AuthBloc>().add(AuthEventLogout());
                        Navigator.of(context).pop();
                      }
                    });
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}