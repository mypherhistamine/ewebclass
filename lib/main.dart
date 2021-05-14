import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/screen/course_material.dart';
import 'package:ewebclass/screen/home.dart';
import 'package:ewebclass/screen/profile.dart';
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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final getcontroller = Get.put(StudentData());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/',
      // home: Obx(
      //   () {
      //     if (getcontroller.userloggedIn.value == true) {
      //       return HomePage();
      //     } else {
      //       return AuthPage();
      //     }

      //     // HomePage()
      //   },
      // ),
      
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
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
        CourseMaterials.routeName : (context) => CourseMaterials() 

      },
    );
  }
}
