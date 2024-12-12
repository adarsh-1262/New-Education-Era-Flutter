import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnly/components/courses.dart';
import 'package:learnly/controller/coursecontr.dart';
import 'package:learnly/screens/home.dart';


class CourseSelectionPage extends StatefulWidget {
  @override
  State<CourseSelectionPage> createState() => _CourseSelectionPageState();
}

class _CourseSelectionPageState extends State<CourseSelectionPage> {
  final CourseController courseController = Get.put(CourseController());
  bool isSelected=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Select Courses'),
            IconButton(onPressed:(){
             List selected = courseController.getSelectedCourses();
          Get.defaultDialog(
            title: 'Selected Courses',
            content: Column(
              children: selected.map((course) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(color: Colors.red[300],
                
                  child: Text(course?.courseName)),
              )).toList(),
            ),
            cancel: ElevatedButton(onPressed:(){Get.back();}, child:Text('Back')),
            confirm: ElevatedButton(
              onPressed: (){Get.to(Home());},
              child: Text('Submit'),
            ),
          );
            }, icon:Icon(Icons.shopping_cart))
          ],
        ),

        
      ),
      body:Obx(() {
        return ListView.builder(
          itemCount: courseController.courses.length,
          itemBuilder: (context, index) {
            final course = courseController.courses[index];
            //final isSelected = courseController.selectedcourses.contains(course);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: CheckboxListTile(
                  title: Text(course.courseName), // Display the course name
                  subtitle: Text(course.description), // Optionally display the course description
                  value:courseController.selectedcourses.contains(course),
                  onChanged: (bool? value) {
                    // Handle course selection
                    courseController.toggleCourse(course);
                    if (value == true) {
                      
                       setState(() {
                         isSelected=true;
                       });
                      Get.snackbar('Course Selected', '${course.courseName} has been selected',duration:Duration(milliseconds: 0));
                    } else {
                      setState(() {
                        isSelected=false;
                      });
                      Get.snackbar('Course Removed', '${course.courseName} has been removed',duration: Duration(milliseconds: 0));
                    }
                  },
                ),
              ),
            );
          },
        );
        })
    
    );
  }
}
