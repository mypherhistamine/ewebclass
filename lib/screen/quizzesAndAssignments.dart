import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/model/assignment.dart';
import 'package:ewebclass/widget/assignmentWidget.dart';
import 'package:ewebclass/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizAndAssignmentScreen extends StatefulWidget {
  static const routeName = "/quizzes";
  @override
  _QuizAndAssignmentScreenState createState() =>
      _QuizAndAssignmentScreenState();
}

class _QuizAndAssignmentScreenState extends State<QuizAndAssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(StudentData());
    final assignmentStream = FirebaseFirestore.instance
        .collection('users')
        .doc(authController.authResultId.value)
        .collection("assignments")
        .snapshots();
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
              child: StreamBuilder<QuerySnapshot>(
                  stream: assignmentStream,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("Some error occured ! "));
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (ctx, i) {
                          return CustomAissgmentCard(
                            docId: snapshot.data.docs[i].id,
                            assignment: Assignment(
                                title: snapshot.data.docs[i]['title'],
                                subject: snapshot.data.docs[i]['subject'],
                                marks: snapshot.data.docs[i]['marks'],
                                dueDate: snapshot.data.docs[i]['dueDate'],
                                question: snapshot.data.docs[i]['question'],
                                hasSubmitted: snapshot.data.docs[i]
                                    ['hasSubmitted'],
                                subjectCode: snapshot.data.docs[i]
                                    ['subjectCode']),
                          );
                        },
                        itemCount: snapshot.data.docs.length,
                      );
                    }
                    return Container();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
