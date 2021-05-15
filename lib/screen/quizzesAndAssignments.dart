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
        title: Text("Quizzes and Assignments"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
