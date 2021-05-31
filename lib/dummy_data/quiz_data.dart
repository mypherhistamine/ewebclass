import 'dart:developer';

import 'package:get/get.dart';

class CustomData {
  List<Quiz> dummyData = [
    Quiz(
        title: "Human Computer Interaction",
        courseCode: "CSE4015",
        date: "24 May 2021",
        duration: "15 mins",
        marks: "10"),
    Quiz(
        title: "Network and Communication",
        courseCode: "CSE1004",
        date: "24 May 2021",
        duration: "15 mins",
        marks: "10")
  ];

  int get dataLength {
    return dummyData.length;
  }
}

class Quiz extends GetxController {
  final String title;
  final String duration;
  final String date;
  final String marks;
  final String courseCode;

  Quiz({this.title, this.duration, this.date, this.marks, this.courseCode});

  final List<Question> questions = [
    Question(
      marks: 1,
      question: "What is the name of the task which has no further expansion",
      options: [
        Option(isCorrectAns: true, optionText: "Unit Task"),
        Option(isCorrectAns: false, optionText: "Selective Task"),
        Option(isCorrectAns: false, optionText: "Hiererchical Task"),
        Option(isCorrectAns: false, optionText: "Sequential Task")
      ],
    ),
    Question(
      marks: 1,
      question: "In JSD the sequence are respresented by",
      options: [
        Option(isCorrectAns: true, optionText: "Unmarked boxes"),
        Option(isCorrectAns: false, optionText: "Boxes marked with circles"),
        Option(isCorrectAns: false, optionText: "Asterisk box"),
        Option(isCorrectAns: false, optionText: "None of the above")
      ],
    ),
    Question(
      marks: 1,
      question: "What are the elements of the Gulf of Execution",
      options: [
        Option(
            isCorrectAns: false,
            optionText:
                "Information processing elemtns involved in working out how to interact with the system"),
        Option(
            isCorrectAns: false,
            optionText:
                "Process the interface,interpreting interface information, and assesing information meaning"),
        Option(
            isCorrectAns: false,
            optionText:
                "Information processing elements involved in working out what the system did"),
        Option(
            isCorrectAns: true,
            optionText:
                "Forming intentions, specifyin right action, selecting interface mechanism")
      ],
    ),
    Question(
      marks: 1,
      question:
          'What is the fundamental insight underlying the "cognitive walk through" method of evaluation',
      options: [
        Option(
            isCorrectAns: false,
            optionText:
                "The idea that usera can sometimes be left out of the evaluation"),
        Option(
            isCorrectAns: false,
            optionText:
                "The idea that cognitive processes are the most important aspect of the user experience"),
        Option(
            isCorrectAns: false,
            optionText:
                "The idea that user can earn by exploring an interface"),
        Option(
            isCorrectAns: true,
            optionText:
                "the idea that experts need to work hand in hand with users to develop an optimal user experience"),
      ],
    ),
    Question(
      marks: 1,
      question: "How many main categories of principles to support usability",
      options: [
        Option(isCorrectAns: false, optionText: "5"),
        Option(isCorrectAns: false, optionText: "6"),
        Option(isCorrectAns: false, optionText: "7"),
        Option(isCorrectAns: true, optionText: "3")
      ],
    ),
    Question(
      marks: 1,
      question: "In petri net tokens are represented by",
      options: [
        Option(isCorrectAns: false, optionText: "circle"),
        Option(isCorrectAns: true, optionText: "small circle"),
        Option(isCorrectAns: false, optionText: "arc"),
        Option(isCorrectAns: false, optionText: "black dots")
      ],
    ),
    Question(
      marks: 1,
      question: "The human computer interaction is a core subject of ",
      options: [
        Option(isCorrectAns: false, optionText: "psychology"),
        Option(isCorrectAns: true, optionText: "software engineering"),
        Option(isCorrectAns: false, optionText: "anthropology"),
        Option(isCorrectAns: false, optionText: "none")
      ],
    ),
    Question(
      marks: 1,
      question:
          "The user output in human computer interaction is happens through",
      options: [
        Option(isCorrectAns: true, optionText: "motor controls"),
        Option(isCorrectAns: false, optionText: "experience"),
        Option(isCorrectAns: false, optionText: "senses"),
        Option(isCorrectAns: false, optionText: "education")
      ],
    ),
    Question(
      marks: 1,
      question: "The optical illusion used in deisngs effects page is",
      options: [
        Option(isCorrectAns: true, optionText: "composition"),
        Option(isCorrectAns: false, optionText: "symmetry"),
        Option(isCorrectAns: false, optionText: "borders"),
        Option(isCorrectAns: false, optionText: "asymmetry")
      ],
    ),
    Question(
      marks: 1,
      question: "The image is made at the back side of eye in the form of ",
      options: [
        Option(isCorrectAns: false, optionText: "straight image"),
        Option(isCorrectAns: false, optionText: "horizontal image"),
        Option(isCorrectAns: true, optionText: "upside down image"),
        Option(isCorrectAns: false, optionText: "vertical image")
      ],
    ),
  ].obs;

  void printQuestions(List<Question> questions) {
    for (int i = 0; i < questions.length; i++) {
      print('''
Question No: ${i + 1}
Marks:  ${questions[i].marks}
Question: ${questions[i].question}
      ''');
      questions[i].printAllOptions(questions[i].options);
      print("-------------------------------------");
    }
  }

  int calculateMarks({List<Question> questions2}) {
    int score = 0;
    // for (int i = 0; i < questions2.length; i++) {
    //   for (int j = 0; j < questions2[i].options.length; j++) {
    //     if (questions2[i].options[j].isCorrectAns &&
    //         questions2[i].options[i].userHasSelectedThisOption) {
    //       score += questions2[i].marks;
    //     }
    //   }
    // }

    questions.forEach((Question singleQuestion) {
      singleQuestion.options.forEach((Option singleOption) {
        if (singleOption.isCorrectAns &&
            singleOption.userHasSelectedThisOption) {
          score += singleQuestion.marks;
        }
      });
    });
    print(score);
    return score;
  }
}

class Question {
  String question;
  int marks;
  List<Option> options = [];

  Question({this.question, this.marks, this.options});

  String printAllOptions(List<Option> options2) {
    for (int i = 0; i < options2.length; i++) {
      print("optionText: ${options2[i].optionText}");
      print("isCorrect Answer : ${options2[i].isCorrectAns}");
      print(
          "userHasSelecltedthisAnswer: ${options2[i].userHasSelectedThisOption}");
      print("******");
    }
  }
}

class Option {
  String optionText;
  bool isCorrectAns;
  bool userHasSelectedThisOption = false;

  Option(
      {this.optionText,
      this.isCorrectAns,
      this.userHasSelectedThisOption = false});
}
