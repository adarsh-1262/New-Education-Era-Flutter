import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:learnly/components/goal.dart';

class GoalsController extends GetxController {
  var goals = <Goal>[].obs;

  void addGoal(String title) {
    if (title.isNotEmpty) {
      goals.add(Goal(title: title));
    }
  }

  void toggleGoalCompletion(int index) {
    if (index >= 0 && index < goals.length) {
      goals[index].isCompleted = !goals[index].isCompleted;
      goals.refresh(); // Refresh the UI
    }
  }
}