import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:learnly/Customs/roadmap.dart';
import 'package:learnly/components/courses.dart';
import 'package:learnly/controller/coursecontr.dart';
import 'package:learnly/screens/Community.dart';
import 'package:learnly/screens/QuizScreen.dart';
import 'package:learnly/screens/VirtualTutor.dart';
import 'package:learnly/screens/about.dart';
import 'package:learnly/screens/contactus.dart';
import 'package:learnly/screens/events.dart';
import 'package:learnly/screens/faq.dart';
import 'package:learnly/screens/goalScreen.dart';
import 'package:learnly/screens/meditation.dart';
import 'package:learnly/screens/motivation.dart';
import 'package:learnly/screens/profile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learnly/Customs/roadmap.dart';
import 'package:learnly/screens/resource.dart';
import 'package:learnly/screens/scholarship.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:social_share/social_share.dart';
import 'package:whatsapp_share/whatsapp_share.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   List<String> items=['Goals','Motivational Contents',
    'Meditation','Community Forums','Scholarships',
    'Online Tutoring',
    'Stay healthy',
    'Events','FAQs'];

    List<String> locations=['assets/images/goal.jpg','assets/images/moti.jpeg','assets/images/medi.jpg','assets/images/community.png'];
   void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

    // ignore: non_constant_identifier_names
  Widget Carousel()
  { final List<Map<String, String>> events=[
    {'name':'Nipuna Bharat Yojna',
    'image':'assets/images/nipuna.png',
    'url':'https://nipunbharat.education.gov.in/'},
  {'name':'Career Counselling',
  'image':'assets/images/couns.jpeg',
    'url':'https://rojgaarsangam.up.gov.in/LMS/CareerCounselling.aspx'},
    {'name':'PM Internship Scheme',
    'image':'assets/images/pmintern.png',
    'url':'https://pminternship.mca.gov.in/login/'}
    ];


    return CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 1),
            enlargeCenterPage: true,
            aspectRatio: 16 / 8,
            viewportFraction: 0.8,
          ),
          items: events.map((event) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: (){Get.to(RoadmapWebView(url:event['url']!,titler: event['name']!,));
                 // RoadmapWebView(url:event['url']!);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        SizedBox(height: 20,),
                        Stack(
                          children: [Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width-10,
                          
                            child: Image.asset(event['image']!, fit: BoxFit.fill),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(color: const Color.fromARGB(255, 221, 191, 191)),
                                                    child:Text(event['name']!,style: TextStyle(fontSize: 20),)),
                          )]
                        ),
                        
                      ]
                        
                      ),
                      
                    
                    
                
                );
              },
            );
          }).toList(),
        );
      
  }
  Widget _buildJob()

  { 
    return Container(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 4, // Number of grid items (can be changed as needed)
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (items[index]) {
  case 'Goals':
    Get.to(GoalsPage());
    break;
  case 'Motivational Contents':
    Get.to(MotivationalScreen());
    break;
    case 'Community Forums':
    Get.to(ForumPage());
    break;
  default:
    Get.to(() => MeditationScreen());
    break;
}

                    },
                    child: Card(
                      shadowColor: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index],
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            SizedBox(height: 70,
                                  child: Image.asset(locations[index]),),
                           // Text('Learn more')
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            

            // ListView for the rest of the items
            
            );
          
      
      
    
            
    }
  



  
 

  


@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(child: Text('Learnly', style: TextStyle(fontSize: 30))),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 221, 197, 197),
        child: ListView(
          children: [
            DrawerHeader(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFFFF8A00), Color(0xFFFFC837)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Circular avatar with styling
      CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          'https://example.com/profile_image.jpg', // Replace with an actual image URL
        ),
      ),
      SizedBox(height: 12), // Add spacing between avatar and text
      // Name with styling
      Text(
        'Jennifer',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 4), // Add slight spacing between name and email
      // Email with styling
      Text(
        'xyz@gmail.com',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white70,
        ),
      ),
      SizedBox(height: 8),
      // Decorative button or action
      
    ],
  ),
),

            ListTile(title: Text('Profile'), leading: Icon(Icons.person), onTap: () { Get.to(StudentDashboard()); }),
            Divider(thickness: 1),
            ListTile(title: Text('Quizzes'), leading: Icon(Icons.cast_for_education), onTap: () { Get.to(QuizApp()); }),
            Divider(thickness: 1),
            ListTile(title: Text('Roadmap'), leading: Icon(Icons.browser_updated), onTap: () { Get.to(RoadmapWebView(url: 'https://roadmap.sh/', titler: 'Roadmaps')); }),
            Divider(thickness: 1),
            ListTile(title: Text('Resource Library'), leading: Icon(Icons.book), onTap: () {Get.to(ResourceLibraryScreen());}),
            Divider(thickness: 1),
            ListTile(title: Text('Offline Content'), leading: Icon(Icons.download), onTap: () {}),
            Divider(thickness: 1),
            ListTile(title: Text('Contact Us'), leading: Icon(Icons.mail), onTap: () { Get.to(ContactScreen()); }),
            Divider(thickness: 2, color: Colors.black12),
           
            ListTile(title: Text('About Us'), onTap: () { Get.to(AboutScreen()); }),
            SizedBox(height: 40),
            Center(child: Text('Powered by @AJAX Developers')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.orange, Colors.brown, Colors.grey]),
                boxShadow: [
                  BoxShadow(color: Colors.white.withOpacity(0.3), spreadRadius: 2, blurRadius: 10, offset: Offset(0, 5)),
                ],
              ),
              child: Carousel(),
            ),
            _buildJob(),
            Divider(thickness: 3,),
            // Using GridView without wrapping in SingleChildScrollView
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('For Students',style: TextStyle(color: Colors.green,fontSize: 20),),

            ),
            // Handling remaining items
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length - 4, // Remaining items
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (items[index + 4] == 'Online Tutoring') {
                      Get.to(VirtualClassesScreen());
                    } else if (items[index + 4] == 'Scholarships') {
                      Get.to(ScholarshipScreen());
                    }else if(items[index+4]=='Events') Get.to(EventScreen());
                    else if(items[index+4]=='FAQs' )  Get.to(FAQPage());
                     else {
                      Get.to(MotivationalScreen());
                    }
                  },
                  child: Column(
                    children: [
                      Card(
                        shadowColor: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(items[index + 4], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Text('Learn more'),
                                  ],
                                ),
                              ),
                              Container(color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
}