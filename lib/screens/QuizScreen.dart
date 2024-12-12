import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnly/quiz/Quiz.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final Quiz quiz = Quiz();

  bool? userAnswer;
  List<String> categories = ['Science', 'Sports', 'Technical', 'General'];

  int score = 0; 
  
  void showScore() {
  Get.defaultDialog(
    title: 'Your Score',
    middleText: 'Your current score is: $score',
    onConfirm: () {
      Get.back(); // Close the dialog
    },
    textConfirm: 'OK',
  );
}// Initialize score variable

void checkAnswer(bool answer) {
  setState(() {
    // Check if the user's answer is correct
    if (answer == quiz.getAnswer()) {
      userAnswer = true; // Set userAnswer to true if correct
      score++; // Increment score for correct answer
    } else {
      userAnswer = false; // Set userAnswer to false if incorrect
    }

    // Check if the quiz is finished
    if (quiz.isFinished()) {
      Get.defaultDialog(
        title: 'Quiz Finished!',
        middleText: 'You have completed the quiz. Your score is $score.',
        onConfirm: () {
          quiz.clear();
          score = 0; // Reset score for the next quiz
          Get.back();
        },
        textConfirm: 'Restart',
      );
    } else {
      quiz.nextQues(); // Move to the next question
    }
  });
}

  @override
  Widget build(BuildContext context) {
    
    return 
      Scaffold(
        appBar: AppBar(
          title: const Text('Category Quiz'),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            DropdownButton<String>(
              value: quiz.getCurrentCategory(),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    quiz.setCategory(newValue);
                  }
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Card(
                  color: Color.fromARGB(255, 201, 142, 142),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      quiz.getQues(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            if (userAnswer != null)
              Text(
                userAnswer! ? 'Correct!' : 'Incorrect!',
                style: TextStyle(
                  color: userAnswer! ? Colors.green : Colors.red,
                  fontSize: 18,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () { checkAnswer(true);},
                    child: const Text('True'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {checkAnswer(false);},
                    child: const Text('False'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              child: Card(color: Colors.orange,
                child: TextButton(onPressed:(){showScore();}, child:Text('Show Score'))),
            )
          ],
        ),
      
    );
  }
}


