import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Ms. Amanda',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          const Text(
            'Preschool Teacher | Preschool A',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          Divider(color: Colors.grey.shade300),
          ListTile(
            leading: const Icon(Icons.email, color: Colors.indigo),
            title: const Text('Email'),
            subtitle: const Text('amanda.teacher@school.com'),
          ),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.indigo),
            title: const Text('Phone'),
            subtitle: const Text('+94 71 234 5678'),
          ),
          ListTile(
            leading: const Icon(Icons.location_on, color: Colors.indigo),
            title: const Text('School Branch'),
            subtitle: const Text('Colombo Main Branch'),
          ),
        ],
      ),
    );
  }
}