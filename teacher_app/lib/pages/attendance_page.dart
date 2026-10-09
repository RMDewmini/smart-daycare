import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // ටැබ් ගණන 2 ක් ලෙස සකස් කර ඇත (Past History සහ Monthly Reports සඳහා පමණි)
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 01. Past Attendance History (2026-10-01 to 2026-10-09)
    final List<Map<String, dynamic>> pastHistoryData = [
      {'date': '2026-10-09', 'day': 'Friday', 'time': '08:30 AM', 'name': 'Little Lim', 'status': 'Present'},
      {'date': '2026-10-08', 'day': 'Thursday', 'time': '08:35 AM', 'name': 'Little Noah', 'status': 'Present'},
      {'date': '2026-10-07', 'day': 'Wednesday', 'time': '08:25 AM', 'name': 'Emma', 'status': 'Present'},
      {'date': '2026-10-06', 'day': 'Tuesday', 'time': 'N/A', 'name': 'Mia', 'status': 'Absent'},
      {'date': '2026-10-05', 'day': 'Monday', 'time': '08:40 AM', 'name': 'Princess Rose', 'status': 'Present'},
      {'date': '2026-10-04', 'day': 'Sunday', 'time': 'Weekend', 'name': 'All Students', 'status': 'Holiday'},
      {'date': '2026-10-03', 'day': 'Saturday', 'time': 'Weekend', 'name': 'All Students', 'status': 'Holiday'},
      {'date': '2026-10-02', 'day': 'Friday', 'time': '08:30 AM', 'name': 'Little Smith', 'status': 'Present'},
      {'date': '2026-10-01', 'day': 'Wednesday', 'time': '08:32 AM', 'name': 'Little Lim', 'status': 'Present'},
    ];

    // 02. Monthly Reports (2026-Jan to 2026-Sep)
    final List<Map<String, dynamic>> monthlyReportsData = [
      {'month': '2026-September', 'name': 'Little Lim', 'totalDays': '21', 'presentDays': '20', 'rate': '95%'},
      {'month': '2026-August', 'name': 'Little Noah', 'totalDays': '20', 'presentDays': '19', 'rate': '95%'},
      {'month': '2026-July', 'name': 'Emma', 'totalDays': '22', 'presentDays': '21', 'rate': '95%'},
      {'month': '2026-June', 'name': 'Mia', 'totalDays': '20', 'presentDays': '18', 'rate': '90%'},
      {'month': '2026-May', 'name': 'Princess Rose', 'totalDays': '21', 'presentDays': '20', 'rate': '95%'},
      {'month': '2026-April', 'name': 'Little Smith', 'totalDays': '19', 'presentDays': '17', 'rate': '89%'},
      {'month': '2026-March', 'name': 'Little Lim', 'totalDays': '22', 'presentDays': '22', 'rate': '100%'},
      {'month': '2026-February', 'name': 'Little Noah', 'totalDays': '20', 'presentDays': '19', 'rate': '95%'},
      {'month': '2026-January', 'name': 'Emma', 'totalDays': '20', 'presentDays': '18', 'rate': '90%'},
    ];

    // Today Student Attendance Details
    final List<Map<String, dynamic>> todayAttendanceData = [
      {'name': 'Little Lim', 'initials': 'LL', 'time': '08:30 AM', 'relation': 'Mother (Mrs. Lim)', 'phone': '+94 77 123 4567'},
      {'name': 'Little Noah', 'initials': 'LN', 'time': '08:40 AM', 'relation': 'Father (Mr. Noah)', 'phone': '+94 71 987 6543'},
      {'name': 'Emma', 'initials': 'EM', 'time': '08:30 AM', 'relation': 'Mother (Mrs. Emma)', 'phone': '+94 70 555 1234'},
      {'name': 'Mia', 'initials': 'MI', 'time': '08:35 AM', 'relation': 'Father (Mr. Mia)', 'phone': '+94 75 444 8888'},
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          const Text(
            'Attendance Records',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          const SizedBox(height: 8),
          const Text(
            'View past attendance history, monthly reports, and student attendance statistics.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 20),

          // Today Student Attendance Details Section
          const Text(
            'Today Student Attendance Details',
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
              itemCount: todayAttendanceData.length,
              separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
              itemBuilder: (context, index) {
                final item = todayAttendanceData[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.indigo.shade100,
                        child: Text(
                          item['initials']!,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.indigo),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name']!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.access_time, size: 13, color: Colors.teal),
                                const SizedBox(width: 4),
                                Text('Time: ${item['time']}', style: const TextStyle(fontSize: 12, color: Colors.teal, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Brought by: ${item['relation']}', style: const TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 2),
                            Text('Phone: ${item['phone']}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),

          // Tab Bar for 2 Sections (03 ඉවත් කර ඇත)
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black87,
              indicator: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: const [
                Tab(text: '01. Past History'),
                Tab(text: '02. Monthly Reports'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // TabBar Views (කොටස් 2 සඳහා පමණි)
          SizedBox(
            height: 520,
            child: TabBarView(
              controller: _tabController,
              children: [
                // 01. Past Attendance History View
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: ListView.separated(
                    itemCount: pastHistoryData.length,
                    separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
                    itemBuilder: (context, index) {
                      final history = pastHistoryData[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: history['status'] == 'Present'
                              ? Colors.teal.shade50
                              : history['status'] == 'Absent'
                                  ? Colors.red.shade50
                                  : Colors.orange.shade50,
                          child: Icon(
                            history['status'] == 'Present'
                                ? Icons.check_circle
                                : history['status'] == 'Absent'
                                    ? Icons.cancel
                                    : Icons.event_available,
                            color: history['status'] == 'Present'
                                ? Colors.teal
                                : history['status'] == 'Absent'
                                    ? Colors.red
                                    : Colors.orange,
                            size: 20,
                          ),
                        ),
                        title: Text('${history['date']} (${history['day']}) - ${history['name']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        subtitle: Text('Arrival Time: ${history['time']}', style: const TextStyle(fontSize: 12)),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: history['status'] == 'Present' ? Colors.teal.shade100 : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(history['status'], style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: history['status'] == 'Present' ? Colors.teal.shade800 : Colors.black87)),
                        ),
                      );
                    },
                  ),
                ),

                // 02. Monthly Reports View
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: ListView.separated(
                    itemCount: monthlyReportsData.length,
                    separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
                    itemBuilder: (context, index) {
                      final report = monthlyReportsData.length > index ? monthlyReportsData[index] : monthlyReportsData[0];
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.indigoAccent,
                          child: Icon(Icons.assessment, color: Colors.white, size: 20),
                        ),
                        title: Text('${report['month']} - ${report['name']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        subtitle: Text('Total Days: ${report['totalDays']} | Present Days: ${report['presentDays']}', style: const TextStyle(fontSize: 12)),
                        trailing: Text(report['rate'], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 14)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}