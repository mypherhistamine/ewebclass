import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewebclass/controllers/assignment_controller.dart';
import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/model/assignment.dart';
import 'package:ewebclass/utils.dart/theme.dart';
import 'package:ewebclass/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadScreen extends StatefulWidget {
  // final String question;
  // final String dueDate;
  // final String marks;
  final Assignment assignment;
  final String docId;
  UploadScreen({this.assignment, this.docId});

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String get frmtString {
    String stringVal = widget.assignment.question;
    var result = stringVal.replaceAll(r'\n', "\n");
    return result;
  }

  bool isSubmitting = false;
  final authController = Get.put(StudentData());
  final AssignmentController assignmentController = AssignmentController();
  final tempString = FirebaseFirestore.instance.collection('users');

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "${widget.assignment.subject}",
              style: TextStyle(fontSize: 26, color: Utils.textColor),
            ),
            SizedBox(height: 10),
            Text(
              "${widget.assignment.subjectCode}",
              style: TextStyle(fontSize: 18, color: Utils.textColor),
            ),
            SizedBox(height: 30),
            Text('Questions:\n\n $frmtString',
                style: TextStyle(fontSize: 15, color: Utils.textColor)),
            // Divider(),
            SizedBox(height: 20),
            Text("Marks - ${widget.assignment.marks}",
                style: TextStyle(fontSize: 17, color: Utils.textColor)),
            SizedBox(height: 10),
            Text("Due date - ${widget.assignment.dueDate}",
                style: TextStyle(fontSize: 17, color: Utils.textColor)),
            SizedBox(height: 10),
            Text("Only PDF Files allowed ",
                style: TextStyle(color: Colors.red)),
            SizedBox(height: 200),

            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(authController.authResultId.value)
                  .collection("assignments")
                  .doc(widget.docId)
                  .snapshots(),
              builder:
                  (BuildContext ctx, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Some error occured ! "));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  print(snapshot.data['title']);

                  return !snapshot.data['hasSubmitted']
                      ? Center(
                          child: CustomButton(
                            textColor: Colors.white,
                            content: "Upload work",
                            cornerRadius: 5,
                            buttonColor: Colors.blueAccent,
                            contentSize: 16,
                            height: 35,
                            function: () async {
                              await Future.delayed(Duration(seconds: 2));
                              await assignmentController.submitWork();
                            },
                          ),
                        )
                      : Center(child: CircularProgressIndicator());
                }
                return Text("Lol");
              },
            ),
            // Text("Doc id : ${widget.docId}")
          ],
        ),
      ),
    );
  }
}
