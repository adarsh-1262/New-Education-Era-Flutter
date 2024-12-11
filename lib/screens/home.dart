import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:learnly/Customs/roadmap.dart';
import 'package:learnly/components/courses.dart';
import 'package:learnly/controller/coursecontr.dart';
import 'package:learnly/screens/QuizScreen.dart';
import 'package:learnly/screens/VirtualTutor.dart';
import 'package:learnly/screens/motivation.dart';
import 'package:learnly/screens/profile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learnly/Customs/roadmap.dart';
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

  



  
  Widget _buildJobOpportunities() {
    List<String> items=['Scholarships','Motivational Contents',
    'Grants','Community Forums','Online Tutoring',
    'Loans','FAQs'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'EXCLUSIVELY FOR STUDENTS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.green),
          ),
        ),
            
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){if(items[index]=='Online Tutoring'){Get.to(VirtualClassesScreen());}
              else if(items[index]=='Scholarships'){Get.to(ScholarshipScreen());}
               else Get.to(MotivationalScreen());},
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Card(
                     shadowColor: Colors.yellow,
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                            
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(items[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text('Learn more')
                                ],
                              ),
                            ),
                          ),
                          Container(decoration: BoxDecoration(shape: BoxShape.rectangle,color: Colors.grey),)
                        ],
                      ),
                    ),
                  
                    
                    ),
                    SizedBox(height: 10,)
                ],
              ),
              );
            
                
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
      child: Scaffold(
      
          appBar: AppBar(
            backgroundColor: Colors.orange,
            
            title: Center(child: Text('Learnly',style: TextStyle(fontSize: 30),)),),
            drawer: Drawer(backgroundColor:Color.fromARGB(255, 37, 36, 36),
            child: ListView(children: [DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 134, 41)),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: CircleAvatar()),
                  Text('Jeniffer'),
                  Text('xyz@gmail.com')
                ],
              ),),
            ListTile(title: Text('Profile'),leading: Icon(Icons.person),onTap: (){Get.to(ProfileScreen());},),
            Divider(thickness: 1,),
            ListTile(title:Text('Quizzes'),leading:Icon(Icons.cast_for_education),onTap:(){Get.to(QuizPage());}),
             Divider(thickness: 1,),
            ListTile(title: Text('Roadmap'),leading: Icon(Icons.browser_updated),
            
              onTap:(){Get.to(RoadmapWebView(url: 'https://roadmap.sh/',titler: 'Roadmaps',));},),
             Divider(thickness: 1,),
            ListTile(title:Text('Resource Library'),leading:Icon(Icons.book),onTap:(){}),
             Divider(thickness: 1,),
            ListTile(title:Text('Offline Content'),leading:Icon(Icons.download),onTap:(){}),
             Divider(thickness: 1,),
              ListTile(title:Text('Contact Us'),leading: Icon(Icons.mail),onTap: (){
    
  },),
  Divider(thickness: 2,color:Colors.black12,),
  ListTile(title: Text('About Us'),onTap:(){Get.defaultDialog(title: "LearnLy",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Learnly"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: (){Get.back();} ,//AuthenticationRepository.instance.logout(),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                          child: const Text("ok"),
                        ),
                      ),);}
  ),
  SizedBox(height: 40,),
  
  Center(child: Text('Powered by @AJAX Developers'))
              ],),),
            body :SingleChildScrollView(
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Container(
                    
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.orange,Colors.brown,Colors.grey],), boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],),
                    child: Carousel(),),
                    _buildJobOpportunities(),
                  ]
                      ),
              
            ),
            ),
    );
            

     
        
  }
}

