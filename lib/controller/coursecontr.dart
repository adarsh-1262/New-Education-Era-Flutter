import 'package:get/get.dart';
import 'package:learnly/components/courses.dart';

class CourseController extends GetxController {
  // Observable list of courses
  final _courseList = [
    Course(
  courseName: 'Physics',
  courseCode: 'PHY101',
  description: 'Exploration of classical mechanics, thermodynamics, and electromagnetism.',
  creditHours: 4,
),
Course(
  courseName: 'Chemistry',
  courseCode: 'CHE101',
  description: 'Introduction to organic, inorganic, and physical chemistry concepts.',
  creditHours: 4,
),
Course(
  courseName: 'Biology',
  courseCode: 'BIO101',
  description: 'Study of cell biology, genetics, and human physiology.',
  creditHours: 4,
),
Course(
  courseName: 'Mathematics',
  courseCode: 'MATH101',
  description: 'Covers algebra, calculus, trigonometry, and statistics.',
  creditHours: 4,
),
Course(
  courseName: 'Computer Science',
  courseCode: 'CS101',
  description: 'Introduction to programming, algorithms, and computer architecture.',
  creditHours: 4,
),
Course(
  courseName: 'History',
  courseCode: 'HIS101',
  description: 'Study of ancient, medieval, and modern world history.',
  creditHours: 4,
),
Course(
  courseName: 'Geography',
  courseCode: 'GEO101',
  description: 'Physical and human geography with an emphasis on environmental studies.',
  creditHours: 4,
),
Course(
  courseName: 'Political Science',
  courseCode: 'POL101',
  description: 'Introduction to political systems, governance, and public administration.',
  creditHours: 6),

    Course(
      courseName: 'Data Structures and Algorithms',
      courseCode: 'CSE201',
      description: 'Introduction to efficient data handling and algorithm design.',
      creditHours: 4,
    ),
    Course(
      courseName: 'Operating Systems',
      courseCode: 'CSE301',
      description: 'Study of OS design, process management, and memory handling.',
      creditHours: 3,
    ),
    Course(
      courseName: 'Database Management Systems',
      courseCode: 'CSE305',
      description: 'Fundamentals of relational databases and SQL.',
      creditHours: 3,
    ),
    Course(
      courseName: 'Computer Networks',
      courseCode: 'CSE401',
      description: 'Overview of networking principles and protocols.',
      creditHours: 4,
    ),
    Course(
      courseName: 'Artificial Intelligence',
      courseCode: 'CSE501',
      description: 'Introduction to AI concepts and machine learning basics.',
      creditHours: 3,
    ),
    Course(
      courseName: 'Software Engineering',
      courseCode: 'CSE405',
      description: 'Study of software development life cycle and methodologies.',
      creditHours: 3,
    ),
  ].obs;
  var selectedcourses=[].obs;
  

  // Getter for course list
  List<Course> get courses => _courseList;

  // Method to add a course
  void addCourse(Course course) {
    selectedcourses.add(course);
  
  }

  void toggleCourse(Course course) {
    if (selectedcourses.contains(course)) {
      selectedcourses.remove(course);
    } else {
      selectedcourses.add(course);
    }
  }

  // Method to remove a course
  void removeCourse(Course course) {
    selectedcourses.remove(course);
    
  }

  // Method to get a course by index
  Course getCourse(int index) {
    if (index >= 0 && index < _courseList.length) {
      return _courseList[index];
    } else {
      throw Exception('Index out of bounds');
    }
  }

  List getSelectedCourses() {
    return selectedcourses; // Method to get selected courses
  }

  // Method to clear all courses
  void clearCourses() {
    selectedcourses.clear();
    update();
  }
}