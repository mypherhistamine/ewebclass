import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/screen/edit_profile.dart';
import 'package:ewebclass/widget/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final nameStyle = TextStyle(color: Colors.black45, fontSize: 25);
  final regStyle = TextStyle(color: Colors.grey, fontSize: 20);
  static const profileRoute = "profileRoute";
  final studentController = Get.put(StudentData());
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Widget rightAlignText({String text}) {
    return Row(
      children: [
        SizedBox(width: 20),
        Text(
          "$text",
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
        Spacer()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthRatio = size.width / 411;
    final heightRatio = size.height / 820;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              })
        ],
        title: Text("Profile"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(studentController.authResultId.value)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                studentController.city.value = snapshot.data['city'];
                studentController.regNo.value = snapshot.data['regNo'];

                print(studentController.city.value);
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Container(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Container(
                        child: Image.network(
                          "https://i.ibb.co/vVRHdMy/me.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("${snapshot.data['username']}", style: nameStyle),
                  SizedBox(height: 20),
                  rightAlignText(
                      text:
                          "Reg No - ${snapshot.data['regNo'].toString().toUpperCase()}"),
                  SizedBox(height: 20),
                  rightAlignText(text: "School - ${snapshot.data['school']}"),
                  SizedBox(height: 20),
                  rightAlignText(text: "Email - ${snapshot.data['email']}"),
                  SizedBox(height: 20),
                  rightAlignText(
                      text: "Mobile No - ${snapshot.data['mobileNo']}"),
                  SizedBox(height: 20),
                  rightAlignText(text: "Address - ${snapshot.data['address']}"),
                  SizedBox(height: 20),
                  rightAlignText(text: "City - ${snapshot.data['city']}")
                ],
              );
            }),
      ),
      drawer: Drawer(
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
              onTap: () {},
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
      ),
    );
  }
}
