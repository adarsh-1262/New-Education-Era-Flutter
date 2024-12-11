import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VirtualClassesScreen extends StatelessWidget {

  final List<ClassDetails> classes = [
    ClassDetails(
        tutorName: "John Doe",
        timing: "10:00 AM - 11:00 AM",
        venue: "Google Meet",
        subject: "Mathematics"),
    ClassDetails(
        tutorName: "Sarah Lee",
        timing: "11:30 AM - 12:30 PM",
        venue: "Zoom",
        subject: "Science"),
    ClassDetails(
        tutorName: "Michael Brown",
        timing: "2:00 PM - 3:00 PM",
        venue: "Microsoft Teams",
        subject: "History"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Virtual Classes"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return ClassCard(classDetails: classes[index]);
        },
      ),
    );
  }
}

class ClassDetails {
  final String tutorName;
  final String timing;
  final String venue;
  final String subject;

  ClassDetails({
    required this.tutorName,
    required this.timing,
    required this.venue,
    required this.subject,
  });
}

class ClassCard extends StatelessWidget {
  final ClassDetails classDetails;

  const ClassCard({required this.classDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){showDialog(context: context, builder:(BuildContext context)
      {return AlertDialog(
        content: Text('You want to register for this tutor?'),
        actions: [TextButton(onPressed:(){}, child: Text('Confirm')),
        TextButton(onPressed:(){Get.back();}, child:Text('Cancel'))
        ],

      );}
      );},
      child: Card(
        color: Colors.grey[700],
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                classDetails.subject,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Tutor: ${classDetails.tutorName}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                "Timing: ${classDetails.timing}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                "Venue: ${classDetails.venue}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
