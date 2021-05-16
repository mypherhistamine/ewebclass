import 'package:ewebclass/model/assignment.dart';
import 'package:ewebclass/widget/assignmentWidget.dart';
import 'package:ewebclass/widget/drawer.dart';
import 'package:flutter/material.dart';

class QuizAndAssignmentScreen extends StatefulWidget {
  static const routeName = "/quizzes";
  @override
  _QuizAndAssignmentScreenState createState() =>
      _QuizAndAssignmentScreenState();
}

class _QuizAndAssignmentScreenState extends State<QuizAndAssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MyDrawer(context),
      appBar: AppBar(
        title: Text("Assignments"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<dynamic>(
                stream: null,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemBuilder: (ctx, i) {
                      return CustomAissgmentCard(
                        assignment: Assignment(
                            title: "LAB ASSIGNMENT - 5",
                            subject: "Network and Communication",
                            marks: "10th",
                            dueDate: "23 May",
                            question: "Lol"),
                      );
                    },
                    itemCount: 2,
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
