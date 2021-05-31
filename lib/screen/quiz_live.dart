import 'dart:async';

import 'package:ewebclass/dummy_data/quiz_data.dart';
import 'package:ewebclass/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuizLiveScreen extends StatefulWidget {
  QuizLiveScreen({Key key}) : super(key: key);

  @override
  _QuizLiveScreenState createState() => _QuizLiveScreenState();
}

class _QuizLiveScreenState extends State<QuizLiveScreen> {
  Quiz quiz = Quiz();

  // List<Question> questions = [
  //   Question(
  //     marks: 1,
  //     question: "What is the name of the task which has no further expansion",
  //     options: [
  //       Option(isCorrectAns: true, optionText: "Unit Task"),
  //       Option(isCorrectAns: false, optionText: "Selective Task"),
  //       Option(isCorrectAns: false, optionText: "Hiererchical Task"),
  //       Option(isCorrectAns: false, optionText: "Sequential Task")
  //     ],
  //   ),

  // ];

  Quiz controller = Get.put(Quiz());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [TimerWidget()],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (ctx, index) {
                  return CustomQuestionCard(
                    quiz.questions[index],
                    index: index,
                  );
                },
                itemCount: quiz.questions.length,
                separatorBuilder: (ctx, index) {
                  return SizedBox(height: 5);
                },
              ),
            ),
            CustomButton(
              buttonColor: Theme.of(context).primaryColor,
              cornerRadius: 5,
              content: "Submit",
              contentSize: 15,
              function: () {
                controller.calculateMarks(controller.questions);
              },
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

class CustomQuestionCard extends StatefulWidget {
  Question question;
  final index;

  CustomQuestionCard(this.question, {this.index});

  @override
  _CustomQuestionCardState createState() => _CustomQuestionCardState();
}

class _CustomQuestionCardState extends State<CustomQuestionCard> {
  Color unSelectedColor = Colors.white;
  Color selectedColor = Colors.blue.shade400;
  Quiz quizChecker;

  Quiz controller = Get.put(Quiz());

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Q${widget.index + 1} ${controller.questions[widget.index].question}",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Container(
                      // height: 50,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.questions[widget.index].options[index]
                                    .userHasSelectedThisOption =
                                !controller.questions[widget.index]
                                    .options[index].userHasSelectedThisOption;
                          });
                        },
                        child: Card(
                          color: controller.questions[widget.index]
                                  .options[index].userHasSelectedThisOption
                              ? selectedColor
                              : unSelectedColor,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  child: Text("${index + 1}"),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                    "${controller.questions[widget.index].options[index].optionText}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: widget.question.options.length,
                  separatorBuilder: (ctx, index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  TimerWidget({Key key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer myTimer;
  DateTime currentTime = DateTime.now();
  DateTime realTimeLeft;
  int decrementor;

  DateFormat timeFormatter = DateFormat.ms();

  @override
  Future<void> initState() {
    // final data = Provider.of<QuestionPaper>(context, listen: false);
    decrementor = 600;

    realTimeLeft = DateTime.now().add(Duration(seconds: 600));
    myTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!currentTime.isAfter(realTimeLeft)) {
        setState(() {
          decrementor = decrementor - 1;
          realTimeLeft = realTimeLeft.subtract(Duration(seconds: 1));
        });
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration timeDifference = realTimeLeft.difference(currentTime);
    final String properMinuteString = timeDifference.toString().substring(2, 4);
    final String properSecondsString =
        timeDifference.toString().substring(5, 7);
    return Padding(
        padding: EdgeInsets.only(top: 20, right: 20),
        child: Text(
          "$properMinuteString : $properSecondsString",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }
}
