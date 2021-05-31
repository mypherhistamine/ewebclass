import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewebclass/widget/button.dart';
import 'package:ewebclass/widget/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'documentation.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final bugReportController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    bugReportController.dispose();
  }

  Future buildShowDialog(BuildContext context,
      {String title,
      String helperText,
      String inputFieldText,
      Color titleColor}) {
    return showDialog(
      context: context,
      builder: (context) => Container(
        child: new AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: new Text('$title', style: TextStyle(color: titleColor)),
          content: Container(
            height: 250,
            width: 350,
            child: Column(
              children: [
                Text('$helperText'),
                SizedBox(height: 20),
                Container(
                  height: 150,
                  width: 300,
                  child: Card(
                    elevation: 4,
                    child: TextField(
                      maxLines: 10,
                      controller: bugReportController,
                      decoration: InputDecoration(
                        // icon: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Icon(Icons.file_copy),
                        // ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 20, right: 20),
                        hintText: "$inputFieldText",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            new ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pop(); // dismisses only the dialog and returns nothing
              },
              child: new Text('OK'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Help and Documentation"),
      ),
      drawer: MyDrawer(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              buildCard(
                  context: context,
                  question: "How to Upload Assignmments",
                  answer:
                      "Step: 1 Login/Signup\n\nStep:2 Open the drawer from top left corner\n\nStep:3 Click on assignments and quizzes\n\nStep4: Choose the particular assignment\n\nStep:5 Locate the file that you want to upload on your phone\n\nStep:6 Finally click on upload button"),
              buildCard(
                  context: context,
                  question: "How to Download Class Materials",
                  answer:
                      "Step: 1 Login/Signup\n\nStep:2 Open the drawer from top left corner\n\nStep:3 Click on Course Materials\n\nStep4:Choose the particular Material\n\n Step:4 Click On Download Button \n\n Step:5 Finally open the file from the downloads folder of your device  "),
              buildCard(
                  context: context,
                  question: "How to Edit Profile",
                  answer:
                      "Step: 1 Login/Signup\n\nStep:2 Open the drawer from top left corner\n\nStep:3 Click on Profile\n\nStep4:Click on the pencil icon on the top right corner \n\n Step:4 Update the information \n\n Step:5 Finally click on the submit button "),
              buildCard(
                  context: context,
                  question: "How to Reset your password",
                  answer:
                      "Step: 1 Go to the Account Settings section\n\nStep: 2 Click on the reset password button\n\nStep: 3 After clicking on the reset password button you will be logged out\n\nStep 4: Then go to your Email Inbox\n\nStep 5: Click on the link provided on the reset email\n\nStep 6: Enter your new password\n\nStep 7: Then you can login with your new password in the  E Web Class Application"),
              // GestureDetector(
              //   onTap: () {
              //     String ans =
              //         "Step:1 Click on Login Button\n\n\n\nStep:2 Click on Forget Password\n\nStep:3 Enter your Email,where there will be a link through which you can change the password";
              //   },
              //   child: Container(
              //     child: Text("How to Change Passowrd"),
              //   ),
              // ),
              // Container(child: Text("Report for any Bugs")),
              Spacer(),

              CustomButton(
                content: "Feedback",
                buttonColor: Colors.blueAccent,
                contentSize: 16,
                cornerRadius: 20,
                function: () async {
                  await buildShowDialog(context,
                      title: 'Feedback',
                      helperText:
                          'We are happy to hear that you are liking this application.\nAny feedback will improve the application in the future',
                      inputFieldText: 'Type your feedback here ',
                      titleColor: Theme.of(context).primaryColor
                      );
                },
                height: 40,
                width: size.width * 0.8,
              ),
              SizedBox(height: 20),
              CustomButton(
                content: "Report any bugs",
                buttonColor: Colors.redAccent,
                contentSize: 16,
                cornerRadius: 20,
                height: 40,
                width: size.width * 0.8,
                function: () async {
                  await buildShowDialog(context,
                      title: 'Bug Report',
                      helperText:
                          'We are sorry to hear that you faced problems with our applccation\n\nFeel free to report any bugs to us',
                      inputFieldText: 'Enter the bug you encountered',
                      titleColor: Colors.redAccent);

                  // await FirebaseFirestore.instance
                  //     .collection('bugs')
                  //     .add({"bug": "Chod"});
                },
              ),
              SizedBox(height: 80)
            ],
          ),
        ),
      ),
    );
  }

  Container buildCard({BuildContext context, String question, String answer}) {
    return Container(
      height: 50,
      child: Card(
        elevation: 2,
        child: GestureDetector(
          onTap: () {
            String ans = answer;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Doc(
                  ans: ans,
                  q: question,
                ),
              ),
            );
          },
          child: Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$question",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.next_plan,
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
