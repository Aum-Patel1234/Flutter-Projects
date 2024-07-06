import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key, required this.username,
  });

  final String username;

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
          'john.doe@example.com', // Replace with the user's email
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            // Implement edit profile functionality
          },
          icon: const Icon(Icons.edit),
          label: const Text('Edit Profile'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50), // Button size
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            // Implement settings functionality
          },
          icon: const Icon(Icons.settings),
          label: const Text('Settings'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50), // Button size
          ),
        ),
        const SizedBox(height: 10),
        // Logout Button
        ElevatedButton.icon(
          onPressed: () {
            // Implement logout functionality
          },
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50), // Button size
            iconColor: Colors.red, // Button color
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
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
      ],
    );
  }
}