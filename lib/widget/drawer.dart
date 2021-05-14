import 'package:ewebclass/controllers/userdata.dart';
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
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(ProfilePage.profileRoute);
            },
          ),
          ListTile(
            title: Text('Course Materials'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Quizzes-Assignments'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Discussion Interface'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Help'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              studentController.userloggedIn.value = false;
            },
          ),
        ],
      ),
    );
  }
}
