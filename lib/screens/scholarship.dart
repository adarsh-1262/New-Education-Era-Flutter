import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ScholarshipScreen extends StatefulWidget {
  @override
  _ScholarshipScreenState createState() => _ScholarshipScreenState();
}

class _ScholarshipScreenState extends State<ScholarshipScreen> {
  final List<Scholarship> scholarships = [
    Scholarship(
      name: "National Means-Cum-Merit Scholarship",
      description: "Aimed at financially weaker students in India to encourage them to continue their studies.",
      eligibility: "Students of Class 9 with a family income less than ₹1.5 lakh per annum.",
      applicationLink: "https://www.scholarships.gov.in/",
    ),
    Scholarship(
      name: "INSPIRE Scholarship",
      description: "Scholarship for students pursuing science courses after Class 12.",
      eligibility: "Top 1% performers in Class 12 board exams or JEE/NEET rank holders.",
      applicationLink: "https://online-inspire.gov.in/",
    ),
    Scholarship(
      name: "Kishore Vaigyanik Protsahan Yojana (KVPY)",
      description: "Scholarship to promote research careers in basic sciences.",
      eligibility: "Students from Class 11 to undergraduate science courses.",
      applicationLink: "http://kvpy.iisc.ernet.in/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scholarships in India"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: scholarships.length,
        itemBuilder: (context, index) {
          return ScholarshipCard(scholarship: scholarships[index]);
        },
      ),
    );
  }
}

class Scholarship {
  final String name;
  final String description;
  final String eligibility;
  final String applicationLink;

  Scholarship({
    required this.name,
    required this.description,
    required this.eligibility,
    required this.applicationLink,
  });
}

class ScholarshipCard extends StatelessWidget {
  final Scholarship scholarship;

  const ScholarshipCard({required this.scholarship});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              scholarship.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              scholarship.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Eligibility: ${scholarship.eligibility}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () => _openApplicationLink(context, scholarship.applicationLink),
              child: Text(
                "Apply Now",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openApplicationLink(BuildContext context, String url) {
    // Implement the URL launcher or Navigator for the link.
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Navigate to $url"),
      ),);
      _launchURL(url);
    ;
  }
}
