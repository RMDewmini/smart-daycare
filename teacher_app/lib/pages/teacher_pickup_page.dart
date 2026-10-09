import 'package:flutter/material.dart';

class TeacherPickupPage extends StatefulWidget {
  const TeacherPickupPage({Key? key}) : super(key: key);

  @override
  State<TeacherPickupPage> createState() => _TeacherPickupPageState();
}

class _TeacherPickupPageState extends State<TeacherPickupPage> {
  final List<Map<String, dynamic>> waitingStudents = [
    {
      'name': 'Little Lim',
      'classGroup': 'Preschool A',
      'guardianName': 'Shan Perera',
      'relation': 'Father',
      'pickupTime': '03:30 PM',
      'status': 'Waiting',
      'notes': 'Mother is unavailable today, father will pick up. ID verified.',
      'isVerified': false,
    },
    {
      'name': 'Little Noah',
      'classGroup': 'Preschool A',
      'guardianName': 'Nimal de Silva',
      'relation': 'Grandfather',
      'pickupTime': '03:45 PM',
      'status': 'Waiting',
      'notes': 'No special notes. Informed by parents in advance.',
      'isVerified': false,
    },
    {
      'name': 'Emma',
      'classGroup': 'Preschool A',
      'guardianName': 'Kamal Silva',
      'relation': 'Uncle',
      'pickupTime': '04:00 PM',
      'status': 'Waiting',
      'notes': 'Authorized guardian pickup.',
      'isVerified': false,
    },
    {
      'name': 'Mia',
      'classGroup': 'Preschool A',
      'guardianName': 'Sunil Perera',
      'relation': 'Father',
      'pickupTime': '03:15 PM',
      'status': 'Waiting',
      'notes': 'Early pickup requested.',
      'isVerified': false,
    },
    {
      'name': 'Princess Rose',
      'classGroup': 'Preschool A',
      'guardianName': 'Mary Rose',
      'relation': 'Mother',
      'pickupTime': '03:50 PM',
      'status': 'Waiting',
      'notes': 'Standard pickup procedure.',
      'isVerified': false,
    },
    {
      'name': 'Little Smith',
      'classGroup': 'Preschool A',
      'guardianName': 'John Smith',
      'relation': 'Father',
      'pickupTime': '04:10 PM',
      'status': 'Waiting',
      'notes': 'Check In N/A recorded earlier.',
      'isVerified': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pickup Verification'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Pickup History',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening Pickup History...')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSummarySection(),
            const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Waiting Students & Guardians',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('QR / PIN Verification Scanner opened.')),
                    );
                  },
                  icon: const Icon(Icons.qr_code_scanner, size: 18),
                  label: const Text('Scan QR / PIN'),
                ),
              ],
            ),
            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: waitingStudents.length,
              itemBuilder: (context, index) {
                final student = waitingStudents[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              student['name'],
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Chip(
                              label: Text(student['classGroup']),
                              backgroundColor: Colors.teal.shade50,
                            ),
                          ],
                        ),
                        Text('Scheduled Time: ${student['pickupTime']}'),
                        const Divider(height: 20),

                        const Text(
                          'Guardian Details:',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text('Name: ${student['guardianName']} (${student['relation']})'),
                        const SizedBox(height: 8),

                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.amber.shade200),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.note_alt_outlined, color: Colors.amber, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Notes: ${student['notes']}',
                                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Notification sent for ${student['name']}.')),
                                );
                              },
                              icon: const Icon(Icons.notifications_active, color: Colors.orange),
                              label: const Text('Notify'),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton.icon(
                              onPressed: student['isVerified']
                                  ? null
                                  : () {
                                      setState(() {
                                        waitingStudents[index]['isVerified'] = true;
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('${student['name']} successfully verified and dispatched!')),
                                      );
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: student['isVerified'] ? Colors.grey : Colors.teal,
                                foregroundColor: Colors.white,
                              ),
                              icon: Icon(student['isVerified'] ? Icons.check_circle : Icons.verified_user),
                              label: Text(student['isVerified'] ? 'Approved' : 'Verify & Approve'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSummarySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal.shade700,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('Waiting Students', style: TextStyle(color: Colors.white70, fontSize: 13)),
              SizedBox(height: 5),
              Text('06', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          VerticalDivider(color: Colors.white54, thickness: 1),
          Column(
            children: [
              Text('Approved', style: TextStyle(color: Colors.white70, fontSize: 13)),
              SizedBox(height: 5),
              Text('14', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}