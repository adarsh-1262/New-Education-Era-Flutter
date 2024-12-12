import 'dart:math';

import 'package:flutter/material.dart';

class MotivationalScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MotivationalScreen(),
    );
  }
}

class MotivationalScreen extends StatefulWidget {
  @override
  _MotivationalScreenState createState() => _MotivationalScreenState();
}

class _MotivationalScreenState extends State<MotivationalScreen> {
  final Map<String, List<String>> quotes = {
    "Motivational": [
      "The only way to do great work is to love what you do. - Steve Jobs",
      "Don’t watch the clock; do what it does. Keep going.",
      "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
      "Hard work beats talent when talent doesn’t work hard.",
      "Success usually comes to those who are too busy to be looking for it."
    ],
    "Educational": [
      "Education is the most powerful weapon which you can use to change the world. - Nelson Mandela",
      "Live as if you were to die tomorrow. Learn as if you were to live forever. - Mahatma Gandhi",
      "An investment in knowledge pays the best interest. - Benjamin Franklin",
      "The beautiful thing about learning is that nobody can take it away from you. - B.B. King",
      "Education is not preparation for life; education is life itself. - John Dewey"
    ],
  };

  final Random random = Random();
  String currentCategory = "Motivational";
  String currentQuote = "Tap the button to get inspired!";

  void changeQuote() {
    setState(() {
      final categoryQuotes = quotes[currentCategory]!;
      currentQuote = categoryQuotes[random.nextInt(categoryQuotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Motivational & Educational Quotes"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Card(
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    currentQuote,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                color: Color.fromARGB(255, 117, 110, 50),
                child: Card(
                  child: DropdownButton<String>(
                    value: currentCategory,
                    items: quotes.keys.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        currentCategory = value!;
                        currentQuote =
                            "Tap the button to get inspired by $currentCategory quotes!";
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: changeQuote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Get Inspired!",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
