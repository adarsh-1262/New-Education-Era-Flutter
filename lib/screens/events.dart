

import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events for Students up to 12th'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/events.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Upcoming Events for Students up to 12th',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Science Fair'),
                      subtitle: Text('Date: 15th March, Time: 10:00 AM'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScienceFairScreen()),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Math Olympiad'),
                      subtitle: Text('Date: 20th March, Time: 2:00 PM'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MathOlympiadScreen()),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Coding Competition'),
                      subtitle: Text('Date: 25th March, Time: 10:00 AM'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        
                      },
                    ),
                    ListTile(
                      title: Text('Debate Competition'),
                      subtitle: Text('Date: 30th March, Time: 2:00 PM'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                       
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScienceFairScreen extends StatefulWidget {
  @override
  _ScienceFairScreenState createState() => _ScienceFairScreenState();
}

class _ScienceFairScreenState extends State<ScienceFairScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Science Fair'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Science Fair Details',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'Date: 15th March, Time: 10:00 AM',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Venue: School Auditorium',
                  style: TextStyle(fontSize: 18),
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
        ),
      ),
    );
  }
}

class MathOlympiadScreen extends StatefulWidget {
  @override
  _MathOlympiadScreenState createState() => _MathOlympiadScreenState();
}

class _MathOlympiadScreenState extends State<MathOlympiadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math Olympiad'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Math Olympiad Details',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'Date: 20th March, Time: 2:00 PM',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Venue: School Auditorium',
                  style: TextStyle(fontSize: 18),
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
        ),
      ),
    );
  }
}
