import 'dart:async';
import 'package:flutter/material.dart';

import 'pages/class_page.dart';
import 'pages/attendance_page.dart';
import 'pages/profile_page.dart';
import 'pages/teacher_pickup_page.dart';

void main() {
  runApp(const TeacherApp());
}

class TeacherApp extends StatelessWidget {
  const TeacherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Isuru Daycare',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const TeacherDashboardScreen(),
    );
  }
}

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({super.key});

  @override
  State<TeacherDashboardScreen> createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardContent(),
    ClassPage(),
    AttendancePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isuru Daycare'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.3),
              child: const Text('MA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Text('MA', style: TextStyle(fontSize: 24, color: Colors.indigo))),
                  SizedBox(height: 10),
                  Text('Ms. Amanda', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('Preschool Teacher', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.grid_view),
              title: const Text('Class'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('Attendance'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text('Pickup Verification'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TeacherPickupPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 950),
            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 750,
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Class'),
          BottomNavigationBarItem(icon: Icon(Icons.date_range), label: 'Attendance'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}

class Student {
  final String name;
  final String checkInTime;
  final String initials;
  bool isPresent;

  Student({
    required this.name,
    required this.checkInTime,
    required this.initials,
    required this.isPresent,
  });
}

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final List<Student> _students = [
    Student(name: 'Little Lim', checkInTime: '08:30 AM', initials: 'LL', isPresent: true),
    Student(name: 'Little Noah', checkInTime: '08:40 AM', initials: 'LN', isPresent: true),
    Student(name: 'Emma', checkInTime: '08:30 AM', initials: 'EM', isPresent: true),
    Student(name: 'Mia', checkInTime: '08:30 AM', initials: 'MI', isPresent: true),
    Student(name: 'Princess Rose', checkInTime: '08:50 AM', initials: 'PR', isPresent: true),
    Student(name: 'Little Smith', checkInTime: 'N/A', initials: 'LS', isPresent: false),
  ];

  late String _timeString;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timeString = _formatTime(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _getTime() {
    final String formattedDateTime = _formatTime(DateTime.now());
    if (mounted) {
      setState(() {
        _timeString = formattedDateTime;
      });
    }
  }

  String _formatTime(DateTime dt) {
    int hour = dt.hour;
    String period = 'AM';
    if (hour >= 12) {
      period = 'PM';
      if (hour > 12) hour -= 12;
    }
    if (hour == 0) hour = 12;
    String minute = dt.minute.toString().padLeft(2, '0');
    String second = dt.second.toString().padLeft(2, '0');
    return '$hour:$minute:$second $period';
  }

  String _formatDate(DateTime dt) {
    List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    String dayName = days[dt.weekday - 1];
    String monthName = months[dt.month - 1];
    return '$dayName, $monthName ${dt.day}, ${dt.year}';
  }

  String _getGreetingMessage() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    } else if (hour < 17) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    int presentCount = _students.where((s) => s.isPresent).length;
    int absentCount = _students.length - presentCount;
    String currentDateFormatted = _formatDate(DateTime.now());
    String greetingMessage = _getGreetingMessage();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Quick Actions',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
                const SizedBox(height: 12),
                _buildSidebarQuickActionItem('Activities', Icons.insights, () {}),
                const SizedBox(height: 10),
                _buildSidebarQuickActionItem('Pickup Verify', Icons.verified_user, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TeacherPickupPage()),
                  );
                }),
                const SizedBox(height: 10),
                _buildSidebarQuickActionItem('Health', Icons.favorite_border, () {}),
                const SizedBox(height: 10),
                _buildSidebarQuickActionItem('Attendance', Icons.calendar_today_outlined, () {}),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          greetingMessage,
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        const Text(
                          'Ms. Amanda',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.indigo.withOpacity(0.15)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 18, color: Colors.indigo),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    currentDateFormatted,
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.indigo),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.access_time, size: 18, color: Colors.teal),
                                const SizedBox(width: 8),
                                Text(
                                  _timeString,
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.teal),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.amber.withOpacity(0.3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.lightbulb_outline, size: 18, color: Colors.orange.shade800),
                                const SizedBox(width: 8),
                                const Text(
                                  'Teacher Tip of the Day',
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.brown),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Please verify and submit student attendance before 09:30 AM daily.',
                              style: TextStyle(fontSize: 12, color: Colors.brown),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.class_, color: Colors.indigo, size: 20),
                          SizedBox(width: 8),
                          Text('Class', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.indigo)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Preschool A', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.indigo)),
                          Icon(Icons.arrow_drop_down, color: Colors.indigo),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Class Summary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(child: _buildSummaryBadge('Total: ${_students.length}', Colors.indigo)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildSummaryBadge('Present: $presentCount', Colors.teal)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildSummaryBadge('Absent: $absentCount', Colors.redAccent)),
                  ],
                ),
                const SizedBox(height: 20),

                const Text(
                  'Recent Announcements',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.withOpacity(0.2)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.campaign, color: Colors.blue, size: 24),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Annual Sports Meet Practice',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Ground practice will begin tomorrow at 9:00 AM for Preschool A.',
                              style: TextStyle(fontSize: 12, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Today Schedule',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: _buildScheduleCard('09:00 AM', 'Morning Assembly', Icons.people)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildScheduleCard('10:30 AM', 'Drawing & Craft', Icons.palette)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildScheduleCard('12:00 PM', 'Lunch & Play', Icons.fastfood)),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Teacher Quick Notes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.purple.withOpacity(0.2)),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.edit_note, color: Colors.purple, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'To-Do Checklist for Today',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.purple),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text('• Check homework books for Little Lim & Emma.', style: TextStyle(fontSize: 12, color: Colors.black87)),
                      SizedBox(height: 4),
                      Text('• Update health check records in the evening.', style: TextStyle(fontSize: 12, color: Colors.black87)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Student Attendance List',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _students.length,
                  itemBuilder: (context, index) {
                    final student = _students[index];
                    return _buildStudentAttendanceCard(student, index);
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Attendance saved successfully!')),
                      );
                    },
                    child: const Text(
                      'Save Attendance',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarQuickActionItem(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.indigo.withOpacity(0.12)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.indigo),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryBadge(String text, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildScheduleCard(String time, String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.indigo),
          const SizedBox(height: 8),
          Text(
            time,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentAttendanceCard(Student student, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.teal.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white.withOpacity(0.3),
            child: Text(
              student.initials,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 2),
                Text(
                  'Check In : ${student.checkInTime}',
                  style: const TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _students[index].isPresent = true;
                  });
                },
                child: Row(
                  children: [
                    Text(
                      'Present',
                      style: TextStyle(
                        fontSize: 12, 
                        color: student.isPresent ? Colors.white : Colors.white60, 
                        fontWeight: student.isPresent ? FontWeight.bold : FontWeight.normal
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      student.isPresent ? Icons.check_circle : Icons.radio_button_unchecked,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  setState(() {
                    _students[index].isPresent = false;
                  });
                },
                child: Row(
                  children: [
                    Text(
                      'Absent',
                      style: TextStyle(
                        fontSize: 12, 
                        color: !student.isPresent ? Colors.white : Colors.white60, 
                        fontWeight: !student.isPresent ? FontWeight.bold : FontWeight.normal
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      !student.isPresent ? Icons.check_circle : Icons.radio_button_unchecked,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}