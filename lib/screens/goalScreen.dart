import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:learnly/controller/goalcontroller.dart';





class GoalsPage extends StatelessWidget {
  final GoalsController goalsController = Get.put(GoalsController());
  final TextEditingController goalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){
        showDialog(context: context, builder:(BuildContext context)
        {return Center(
          child: Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText:'Enter Goal',
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                 controller: goalController, 
                ),
              Divider(thickness: 3,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.green),
                  onPressed:(){goalsController.addGoal(goalController.text);Get.back();}, child:Text('Add')),
                ElevatedButton(onPressed:(){Get.back();}, child:Text('Cancel'),style: ElevatedButton.styleFrom(backgroundColor:Colors.red),),
               ],)
              ],
            )
          ),
        );});
        }),
      body: Column(
        children: [

          Text('Goals to Achieve',style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          if(goalsController.goals.isEmpty) Column(
            children: [
              Text('No Goals'),
            
            ],
          ),
          
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: goalsController.goals.length,
                itemBuilder: (context, index) {
                  final goal = goalsController.goals[index];
                  return ListTile(
                    title: Text(
                      goal.title,
                      style: TextStyle(
                        decoration: goal.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: Checkbox(
                      value: goal.isCompleted,
                      onChanged: (value) {
                        goalsController.toggleGoalCompletion(index);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}