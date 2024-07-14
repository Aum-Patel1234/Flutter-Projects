import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key, required this.username, required this.email,
  });

  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/847/847969.png'), // Replace with your profile image URL
          ),
        ),
        const SizedBox(height: 20),
        Text(
          username, // Replace with the user's name
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          email, // Replace with the user's email
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
        ),
        const ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone Number'),
          subtitle: Text('+1234567890'), // Replace with the user's phone number
        ),
        const ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Address'),
          subtitle: Text('123 Main Street, City, Country'), // Replace with the user's address
        ),
        const Divider(),
        ListTile(
          onTap: (){},
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
        ),
        const SizedBox(height: 10),
        ListTile(
          onTap: (){},
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
        ),
        const Divider(),
      ],
    );
  }
}