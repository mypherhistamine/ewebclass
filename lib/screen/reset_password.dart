import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/utils/theme.dart';
import 'package:ewebclass/widget/button.dart';
import 'package:ewebclass/widget/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final headingStyle = TextStyle(fontSize: 20, color: Utils.textColor);
  final authController = Get.put(StudentData());
  // final emalidController = TextEditingController();
  final authInstance = FirebaseAuth.instance;

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Container(
        child: new AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title:
              new Text('Reset Password', style: TextStyle(color: Colors.blue)),
          content: Text(
              "Link sent to your email for resetting the password of your account"),
          actions: <Widget>[
            CustomButton(
              height: 30,
              buttonColor: Colors.blueAccent,
              content: "OK",
              cornerRadius: 5,
              contentSize: 14,
              function: () {
                // Navigator.of(context, rootNavigator: true).pop();
                authController.resetPassword(
                    email: authInstance.currentUser.email);
                authInstance.signOut();
                authController.userloggedIn.value = false;
                // await Future.delayed(Duration(seconds: 4));

                Navigator.popAndPushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }

  Future buildShowDialog2(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Container(
        child: new AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: new Text('Delete Account',
              style: TextStyle(color: Colors.redAccent)),
          content: Text(
              "This action is irreversible, once your account is deleted you won't be able to retrieve it "),
          actions: <Widget>[
            CustomButton(
              height: 30,
              buttonColor: Colors.blueAccent,
              content: "CANCEL",
              cornerRadius: 5,
              contentSize: 14,
              function: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
            CustomButton(
              height: 30,
              buttonColor: Colors.redAccent,
              content: "DELETE",
              cornerRadius: 5,
              contentSize: 14,
              function: () async {
                await FirebaseFirestore.instance
                    .collection("uses")
                    .doc("${authController.authResultId.value}")
                    .delete();
                authController.deleteUSer();

                Navigator.of(context, rootNavigator: true).pop();
                authInstance.signOut();
                authController.userloggedIn.value = false;
                Navigator.popAndPushNamed(context, '/');
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Settings"),
      ),
      drawer: MyDrawer(context),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text("Reset Password", style: headingStyle),
            SizedBox(height: 20),
            CustomButton(
              buttonColor: Colors.blueAccent,
              content: "Reset Password",
              contentSize: 15,
              cornerRadius: 15,
              function: () async {
                // await authController.resetPassword(
                //     email: "${FirebaseAuth.instance.currentUser.email}");

                await buildShowDialog(context);
              },
              height: 40,
              width: 200,
            ),
            Spacer(),
            // Divider(),

            Text("Delete Account", style: headingStyle),
            SizedBox(height: 20),
            CustomButton(
              buttonColor: Colors.redAccent,
              content: "Delete Account",
              contentSize: 15,
              cornerRadius: 15,
              function: () async {
                await buildShowDialog2(context);
              },
              height: 40,
              width: 200,
            ),
            // SizedBox(height: 50),
            Spacer()
          ],
        ),
      ),
    );
  }
}
