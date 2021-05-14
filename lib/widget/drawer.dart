import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/screen/course_material.dart';
import 'package:ewebclass/screen/profile.dart';
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
          Divider(),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(ProfilePage.profileRoute);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Course Materials'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(CourseMaterials.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Quizzes-Assignments'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Discussion Interface'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Help'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
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
