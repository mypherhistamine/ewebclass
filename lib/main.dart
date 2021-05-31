import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/screen/course_material.dart';
import 'package:ewebclass/screen/home.dart';
import 'package:ewebclass/screen/profile.dart';
import 'package:ewebclass/screen/quiz_screen.dart';
import 'package:ewebclass/screen/quizzesAndAssignments.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'screen/authscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final getcontroller = Get.put(StudentData());
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // getcontroller.reSignIn();
    // setAuthID();
  }

  void setAuthID() {
    // if (auth.currentUser.uid != null) {
    // getcontroller.authResultId.value = auth.currentUser.uid;
    // print(getcontroller.authResultId);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User> userSnapshot) {
          if (userSnapshot.hasData) {
            //return ChatPage();

            return HomePage();
          }
          return AuthPage();
        },
      ),
      routes: {
        // '/': (context) => AuthPage(),
        ProfilePage.profileRoute: (context) => ProfilePage(),
        CourseMaterials.routeName: (context) => CourseMaterials(),
        QuizAndAssignmentScreen.routeName: (context) =>
            QuizAndAssignmentScreen(),
        QuizScreen.routeName: (context) => QuizScreen()
      },
    );
  }
}
