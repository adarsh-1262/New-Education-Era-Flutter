import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Question {
  String ques;
  bool ans;
  String category;

  Question(this.ques, this.ans, this.category);
}

class Quiz {
  int _quesN = 0;
  
  String _currentCategory = 'Science';

  List<Question> questions = [
  // Science Questions
  Question('The Earth revolves around the Sun.', true, 'Science'),
  Question('Humans have four lungs.', false, 'Science'),
  Question('Water is made up of two hydrogen atoms and one oxygen atom.', true, 'Science'),
  Question('The chemical symbol for gold is Au.', true, 'Science'),
  Question('Sound travels faster in air than in water.', false, 'Science'),
  Question('The human body has 206 bones.', true, 'Science'),
  Question('Photosynthesis occurs in the roots of plants.', false, 'Science'),
  Question('The speed of light is approximately 300,000 kilometers per second.', true, 'Science'),
  Question('The heart is a muscle.', true, 'Science'),
  Question('Oxygen is the most abundant element in the universe.', false, 'Science'),

  // Sports Questions
  Question('Soccer is played with a round ball.', true, 'Sports'),
  Question('The Super Bowl is the championship game of the NBA.', false, 'Sports'),
  Question('Michael Phelps is a famous swimmer.', true, 'Sports'),
  Question('Tennis is played on a rectangular court.', true, 'Sports'),
  Question('The Tour de France is a car race.', false, 'Sports'),
  Question('Basketball was invented in 1891.', true, 'Sports'),
  Question('The World Series is played in Europe.', false, 'Sports'),
  Question('Golf is played on a field with 18 holes.', true, 'Sports'),
  Question('The Olympics were first held in ancient Greece.', true, 'Sports'),
  Question('Baseball is known as the "beautiful game".', false, 'Sports'),

  // Technical Questions
  Question('Python is a type of snake.', false, 'Technical'),
  Question('JavaScript is primarily used for web development.', true, 'Technical'),
  Question('CSS stands for Cascading Style Sheets.', true, 'Technical'),
  Question('A byte consists of 8 bits.', true, 'Technical'),
  Question('HTML is used for styling web pages.', false, 'Technical'),
  Question('SQL is used for managing databases.', true, 'Technical'),
  Question('A VPN is used to enhance internet security.', true, 'Technical'),
  Question('The first computer virus was created in the 1980s.', true, 'Technical'),
  Question('Linux is a type of software.', false, 'Technical'),
  Question('Machine learning is a subset of artificial intelligence.', true, 'Technical'),

  // General Questions
  Question('The Great Wall of China is visible from space.', false, 'General'),
  Question('The currency of Japan is the Yen.', true, 'General'),
  Question('Shakespeare wrote "Romeo and Juliet".', true, 'General'),
  Question('The human brain is the largest organ in the body.', false, 'General'),
  Question('Mount Kilimanjaro is located in Africa.', true, 'General'),
  Question('The Mona Lisa was painted by Vincent van Gogh.', false, 'General'),
  Question('The Pacific Ocean is the largest ocean on Earth.', true, 'General'),
  Question('The first man on the moon was Neil Armstrong.', true, 'General'),
  Question('Australia is both a country and a continent.', true, 'General'),
  Question('The Eiffel Tower is located in London.', false, 'General'),
];

  

  void setCategory(String category) {
    _currentCategory = category;
    _quesN = 0;
  }

    String getCurrentCategory() {
    return _currentCategory;
  }

  void nextQues() {
    if (_quesN < _filteredQuestions().length - 1) _quesN++;
  }

  bool getAnswer() {
    return _filteredQuestions()[_quesN].ans;
  }

  String getQues() {
    return _filteredQuestions()[_quesN].ques;
  }

  void clear() {
    _quesN = 0;
  }

  bool isFinished() {
    if (_quesN >= _filteredQuestions().length - 1) {
      return true;
    }
    return false;
  }

  List<Question> _filteredQuestions() {
    return questions
        .where((question) => question.category == _currentCategory)
        .toList();
  }
}

