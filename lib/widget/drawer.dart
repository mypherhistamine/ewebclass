import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/screen/course_material.dart';
import 'package:ewebclass/screen/help.dart';
import 'package:ewebclass/screen/profile.dart';
import 'package:ewebclass/screen/quizzesAndAssignments.dart';
import 'package:ewebclass/screen/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  final BuildContext context;
  final studentController = Get.put(StudentData());

  MyDrawer(this.context);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('E-Web Class'),
          ),
          // Divider(),
          ListTile(
            leading: Icon(Icons.gamepad, color: Colors.blueAccent),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(ProfilePage.profileRoute);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book, color: Colors.blueAccent),
            title: Text('Course Materials'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(CourseMaterials.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.assessment, color: Colors.blueAccent),
            title: Text('Assignments'),
            onTap: () {
              Navigator.of(context)
                  .popAndPushNamed(QuizAndAssignmentScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.assessment, color: Colors.blueAccent),
            title: Text('Quizzes'),
            onTap: () {
              Navigator.of(context)
                  .popAndPushNamed(QuizAndAssignmentScreen.routeName);
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.help, color: Colors.blueAccent),
            title: Text('Help'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Help()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.reset_tv,
              color: Colors.blueAccent,
            ),
            title: Text('Account Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetPasswordPage()),
              );
            },
          ),
          // Divider(),

          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.redAccent),
            title: Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              studentController.userloggedIn.value = false;
              Navigator.popAndPushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
