import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnly/quiz/Quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> sc = [];
  int score=0;
  quizz Q = quizz();
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = Q.getanswer();

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (Q.isFinished() == true) {
        Get.defaultDialog(
          barrierDismissible: false, // Prevent tapping outside to dismiss
              onWillPop: () async => false,
          confirm: ElevatedButton(child: Text('restart'),onPressed: (){Q.Clear();score=0;Get.back();},),
          title: 'Quiz Finished',
        cancel: ElevatedButton(child: Text('Show Score'),onPressed: (){Get.defaultDialog(title: 'Score Obtained',content:Text('${score}/${Q.N}') );},),
          content: Text('You\'ve reached the end of the quiz.'),
        );
        Q.Clear();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        sc = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          sc.add(Icon(
            Icons.check,
            color: Colors.green,
            
          ));
          score++;
        } else {
          sc.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        Q.nextQues();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              Q.getQues(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
        TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green),
            onPressed: () {
              checkAnswer(true);
            },
            child: Text(
              'True',
              style: TextStyle(fontSize: 20.0),
            )),
            SizedBox(height: 20,),
        TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red),
            onPressed: () {
              checkAnswer(false);
            },
            child: Text(
              'False',
              style: TextStyle(fontSize: 20.0),
            )),
        //TODO:add a score keeper
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: sc),
        ),
        Row(
          children: [
            TextButton(
              child: Icon(
                Icons.clear_rounded,
              ),
              onPressed: () {
                setState(() {
                  sc.clear();
                  Q.Clear();
                  score=0;
                });
              },
            ),
            TextButton(child: Text('Show Score'),onPressed: (){Get.defaultDialog(
              barrierDismissible: false, // Prevent tapping outside to dismiss
              onWillPop: () async => false,
              title: 'Score Obtained',content:Text('${score}/${Q.N}') );},)
          ],
        )
      ],
    );
  }
}