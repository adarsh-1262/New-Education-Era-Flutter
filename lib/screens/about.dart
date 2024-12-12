import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.shade50,
                Colors.blue.shade100,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section
              Text(
                'About EduHub',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),

              // Introduction
              _buildIntroductionSection(),
            

              

              // Challenges Visualization
              

              SizedBox(height: 20),

              // Solutions Section
              _buildSolutionsSection(),

              SizedBox(height: 20),

              // Impact Section
              _buildImpactSection(),

              SizedBox(height: 20),

              // Call to Action
              _buildCallToActionSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroductionSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to EduHub',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'EduHub is more than a platform; it’s a movement to redefine the educational landscape by tackling challenges like dropout rates, accessibility, and engagement. Our innovative solutions create an inclusive future for learners at all stages.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
                       

  Widget _buildSolutionsSection() {
    final solutions = [
      {
        'title': 'AI-Driven Early Warning System',
        'description': 'Identifies at-risk students and enables timely interventions to prevent dropouts.'
      },
      {
        'title': 'Community Learning Hub',
        'description': 'Provides digital resources, virtual mentoring, and online classes to underserved areas.'
      },
      {
        'title': 'Parental Engagement Portal',
        'description': 'Strengthens collaboration between parents and educators with real-time insights.'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Solutions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: solutions.length,
          
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 127, 192, 245),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        solutions[index]['title']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        solutions[index]['description']!,
                        style: TextStyle(fontSize: 14, height: 1.4),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            );
            
          },
        ),
      ],
    );
  }

  Widget _buildImpactSection() {
    return Row(
      children: [
        
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Impact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Reduced dropout rates by providing timely support to students.\nImproved access to quality education in underserved regions.\nEnhanced collaboration between parents, students, and educators.',
                style: TextStyle(height: 1.5),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openLink(String url) {
    // Implement the URL launcher or Navigator for the link.
    
    
      _launchURL(url);
    ;
  }

  Widget _buildCallToActionSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade500,
            Colors.blue.shade700,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Join Us in Revolutionizing Education',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Together, we can make education more accessible, impactful, and inclusive. Let’s create a brighter future for generations to come.',
            style: TextStyle(
              color: Colors.white70,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Get Started'),
            onPressed: () {_openLink( 'https://new-education-era.vercel.app/');},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.blue.shade200,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            
          ),
        ],
      ),
    );
  }
}
