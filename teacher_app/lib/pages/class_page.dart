import 'package:flutter/material.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> teachersData = [
      {
        'name': 'Ms. Amanda',
        'empNo': 'EMP-001',
        'contact': '+94 77 123 4567',
        'initials': 'MA',
      },
      {
        'name': 'Mrs. Sarah Perera',
        'empNo': 'EMP-002',
        'contact': '+94 77 111 2233',
        'initials': 'SP',
      },
      {
        'name': 'Mr. John Silva',
        'empNo': 'EMP-003',
        'contact': '+94 71 444 5566',
        'initials': 'JS',
      },
    ];

    final List<Map<String, dynamic>> groupActivitiesData = [
      {
        'group': 'Preschool A (Age 3 - 5 Years)',
        'description': 'Early childhood foundational learning before parents leave for work.',
        'activities': 'Basic numbers, alphabet tracing, counting beads, storytelling, rhymes, drawing, and coloring.'
      },
    ];

    final List<Map<String, dynamic>> weeklyScheduleData = [
      {'day': 'Monday', 'item': 'Healthy Fruit Box & Water Bottle'},
      {'day': 'Tuesday', 'item': 'Vegetable Sandwich & Milk Packet'},
      {'day': 'Wednesday', 'item': 'Boiled Chickpeas / Corn & Juice Bottle'},
      {'day': 'Thursday', 'item': 'Rice & Curry Mini Pack / Snacks & Water Bottle'},
      {'day': 'Friday', 'item': 'Yogurt, Biscuit Pack & Water Bottle (Fun Friday)'},
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          const Text(
            'Class Management',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          const SizedBox(height: 8),
          const Text(
            'Here you can manage your classes, student groups, teacher details, and weekly items schedule.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 24),
          const Text(
            '01. Teachers Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: teachersData.length,
              separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
              itemBuilder: (context, index) {
                final teacher = teachersData[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo.shade100,
                    child: Text(
                      teacher['initials']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
                    ),
                  ),
                  title: Text(teacher['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  subtitle: Text('Employee No: ${teacher['empNo']}', style: const TextStyle(fontSize: 12)),
                  trailing: Text('Contact: ${teacher['contact']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.teal)),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            '02. Group Activities ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: groupActivitiesData.length,
              separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
              itemBuilder: (context, index) {
                final item = groupActivitiesData[index];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(Icons.assignment, color: Colors.white, size: 20),
                  ),
                  title: Text(item['group']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('Purpose: ${item['description']}', style: const TextStyle(fontSize: 12, color: Colors.black87)),
                      const SizedBox(height: 2),
                      Text('Activities: ${item['activities']}', style: const TextStyle(fontSize: 12, color: Colors.indigo, fontWeight: FontWeight.w500)),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            '03. 5-Day Weekly Items / Food Schedule',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: weeklyScheduleData.length,
              separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
              itemBuilder: (context, index) {
                final schedule = weeklyScheduleData[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange.shade100,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange.shade800),
                    ),
                  ),
                  title: Text(schedule['day']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.indigo)),
                  subtitle: Text('Snacks / Items: ${schedule['item']}', style: const TextStyle(fontSize: 12, color: Colors.black87)),
                );
              },
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}