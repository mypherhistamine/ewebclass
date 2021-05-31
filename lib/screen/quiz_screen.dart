import 'package:ewebclass/dummy_data/quiz_data.dart';
import 'package:ewebclass/screen/quiz_live.dart';
import 'package:ewebclass/widget/button.dart';
import 'package:ewebclass/widget/drawer.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = "/quiz_screen";
  QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  CustomData customData = CustomData();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MyDrawer(context),
      appBar: AppBar(
        title: Text("Quizzes"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return CustomQuizCard(
                    quizSubject: "Human Computer Interaction",
                    quizTitle: "Quiz - 1",
                  );
                },
                itemCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomQuizCard extends StatefulWidget {
  String quizTitle;
  String quizSubject;
  String subjectCode;
  String quizDate;

  CustomQuizCard(
      {this.quizTitle, this.quizSubject, this.quizDate, this.subjectCode});

  @override
  _CustomQuizCardState createState() => _CustomQuizCardState();
}

class _CustomQuizCardState extends State<CustomQuizCard> {
  CustomData customData = CustomData();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 150,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Quiz 1", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text('Human Computer and Interaction'),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 15, bottom: 15),
                child: Row(
                  children: [
                    Spacer(),
                    CustomButton(
                      buttonColor: Colors.blue,
                      content: "Start Quiz",
                      contentSize: 15,
                      cornerRadius: 20,
                      function: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => QuizLiveScreen()),
                        );
                      },
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
