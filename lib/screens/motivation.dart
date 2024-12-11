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
  final List<String> quotes = [
    "The only way to do great work is to love what you do. - Steve Jobs",
    "Success is not the key to happiness. Happiness is the key to success.",
    "Don’t watch the clock; do what it does. Keep going.",
    "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
    "Hard work beats talent when talent doesn’t work hard."
  ];

  final Random random = Random();

  String currentQuote = "Tap the button for motivation!";

  void changeQuote() {
    setState(() {
      currentQuote = quotes[random.nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Motivational Screen"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Image.asset(
                'assets/motivation.png', // Add a motivational image in your assets folder
                height: 200,
                width: 200,
              ),*/
              SizedBox(height: 20),
              Text(
                currentQuote,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[700],
                ),
              ),
              SizedBox(height: 30),
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