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
                  MaterialPageRoute(
                      builder: (context) => EditProfileScreen()),
                );
              })
        ],
        title: Text("Profile"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              height: 150,
              width: 150,
              child: ClipOval(
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Rishabh Mishra", style: nameStyle),
            SizedBox(height: 20),
            rightAlignText(text: "Reg No - 19BCE2088"),
            SizedBox(height: 20),
            rightAlignText(text: "School - SCOPE"),
            SizedBox(height: 20),
            rightAlignText(text: "Email - rishabhmishra23599@gmail.com"),
            SizedBox(height: 20),
            rightAlignText(text: "Mobile No - 9560106736"),
            SizedBox(height: 20),
            rightAlignText(
                text: "Address - H.No. 44,Gali No-3 , Sant Nagar Burari"),
            SizedBox(height: 20),
            rightAlignText(text: "City - Delhi")
          ],
        ),
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
                Navigator.popAndPushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
