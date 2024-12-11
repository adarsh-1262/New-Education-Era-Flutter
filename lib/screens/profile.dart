import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  final List<Map<String, String>> marks = [
    {'subject': 'Hindi', 'marks': '75'},
    {'subject': 'English', 'marks': '80'},
    {'subject': 'Math', 'marks': '95'},
    {'subject': 'Science', 'marks': '88'},
    {'subject': 'Social Science', 'marks': '85'},
    {'subject': 'Computer', 'marks': '92'},
  ];

  final Map<String, int> attendance = {
    'totalClasses': 100,
    'attendedClasses': 90,
  };

  final List<Map<String, String>> enrolledCourses = [
    {'name': 'React Basics', 'status': 'Pending'},
    {'name': 'Advanced CSS', 'status': 'Pending'},
    {'name': 'JavaScript Mastery', 'status': 'Completed'},
    {'name': 'Python for Beginners', 'status': 'Completed'},
  ];

  final List<Map<String, dynamic>> courses = [
    {'name': 'React Basics', 'progress': 75},
    {'name': 'Advanced CSS', 'progress': 50},
    {'name': 'JavaScript Mastery', 'progress': 90},
    {'name': 'Tailwind CSS', 'progress': 30},
  ];

  void handleBackToLearning(BuildContext context) {
    Navigator.pushNamed(context, '/learning-hub');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blue[700]!, Colors.blue[500]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  'Welcome, Adarsh!!',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Section
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue[600]!, Colors.blue[800]!],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              //backgroundImage: AssetImage('assets/Expert1.jpg'),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Adarsh Singh',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'B.Tech in Computer Science',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => handleBackToLearning(context),
                              style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                                backgroundColor: Colors.blue[900],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Back to Learning',style: TextStyle(fontSize: 10),),
                            ),
                            const Divider(
                              color: Colors.white,
                              height: 30,
                              thickness: 1,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Achievements',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: 12,
                              itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Right Section
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          // Subject Marks
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Subject Marks',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ...marks.map(
                                  (item) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item['subject']!,style: TextStyle(color: Colors.black)),
                                      Text(item['marks']!,style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Enrolled Courses
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Enrolled Courses',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ...enrolledCourses.map(
                                  (course) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: course['status'] == 'Completed'
                                          ? Colors.green.withOpacity(0.1)
                                          : Colors.red.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(course['name']!,style: TextStyle(color: Colors.black)),
                                        Text(
                                          course['status']!,
                                          style: TextStyle(
                                            color: course['status'] ==
                                                    'Completed'
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Course Progress
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'My Courses',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ...courses.map(
                                  (course) => Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(course['name']!,style: TextStyle(color: Colors.black),),
                                          Text('${course['progress']}%'),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      LinearProgressIndicator(
                                        value: course['progress'] / 100,
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}