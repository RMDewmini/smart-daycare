import 'package:flutter/material.dart';

class ChildSafetyPickupPage extends StatelessWidget {
  const ChildSafetyPickupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text('Child Safety & Security Pickup'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Safety and Pickup Management',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 12),
            _buildSectionCard(
              title: '1. Authorized Guardians List',
              icon: Icons.people_alt_outlined,
              color: Colors.blueAccent,
              content: 'View details, photos, and NIC numbers of guardians authorized by parents to pick up the child.',
            ),
            const SizedBox(height: 12),
            _buildSectionCard(
              title: '2. Real-time Requests & Verification',
              icon: Icons.verified_user_outlined,
              color: Colors.green,
              content: 'Review incoming pickup requests and verify them using secure codes like OTP or QR codes.',
            ),
            const SizedBox(height: 12),
            _buildSectionCard(
              title: '3. Emergency Contacts & Alerts',
              icon: Icons.warning_amber_rounded,
              color: Colors.orange,
              content: 'Facilities and alerts to instantly notify parents or management during emergencies.',
            ),
            const SizedBox(height: 12),
            _buildSectionCard(
              title: '4. Pickup History & Logs',
              icon: Icons.history_toggle_off,
              color: Colors.purple,
              content: 'Check previous pickup times, details of the person who picked up, and relevant logs.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color color,
    required String content,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF374151),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}