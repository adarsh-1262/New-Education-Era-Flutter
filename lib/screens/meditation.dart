import 'package:flutter/material.dart';

class MeditationScreen extends StatefulWidget {
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation'),
        backgroundColor: Colors.blueAccent,
      ),
      body: 
         Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/meditation.jpg'),
            fit: BoxFit.cover,
          ),
        ),),
              Text(
                'Welcome to Meditation',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.blueGrey,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Meditation is a powerful tool to reduce stress and increase focus. Here are some ways to meditate:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      elevation: 5,
                      child: ListTile(
                        tileColor: Colors.grey,
                        title: Text('Mindful Breathing'),
                        subtitle: Text('Focus on your breath, feel the sensation of the air entering and leaving your nostrils'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MindfulBreathingScreen()),
                          );
                        },
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        tileColor: Colors.grey,
                        title: Text('Body Scan'),
                        subtitle: Text('Lie down or sit comfortably, and bring your attention to different parts of your body, starting from your toes and moving up to the top of your head'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BodyScanScreen()),
                          );
                        },
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                      tileColor: Colors.grey,
                        title: Text('Loving-Kindness Meditation'),
                        subtitle: Text('Focus on sending kindness and compassion to yourself and others'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          
                        },
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        
                        tileColor: Colors.grey,
                        title: Text('Guided Meditation'),
                        subtitle: Text('Listen to a guided audio recording that will lead you through a meditation practice'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}

class MindfulBreathingScreen extends StatefulWidget {
  @override
  _MindfulBreathingScreenState createState() => _MindfulBreathingScreenState();
}

class _MindfulBreathingScreenState extends State<MindfulBreathingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindful Breathing'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.grey,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Find a quiet and comfortable place to sit or lie down',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.grey,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Close your eyes and take a deep breath in through your nose',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.grey,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hold your breath for a few seconds',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Slowly exhale through your mouth',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyScanScreen extends StatefulWidget {
  @override
  _BodyScanScreenState createState() => _BodyScanScreenState();
}

class _BodyScanScreenState extends State<BodyScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Scan'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lie down or sit comfortably with your back straight',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Close your eyes and bring your attention to your toes',
            )])));}}