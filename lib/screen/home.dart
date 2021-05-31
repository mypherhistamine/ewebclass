import 'package:ewebclass/widget/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String welcomeString =
      "Welcome to the E-Web Class Portal\n\nSlide your finger to the left to know more";

  String helpString =
      "If you get stuck at any time you can always go to the help section.";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Theme.of(context).primaryColor,
        // actions: [
        //   DropdownButton(
        //     icon: Icon(
        //       Icons.more_vert,
        //       color: Theme.of(context).primaryIconTheme.color,
        //     ),
        //     items: [
        //       DropdownMenuItem(
        //         child: Container(
        //           child: Row(
        //             children: <Widget>[
        //               Icon(
        //                 Icons.exit_to_app,
        //                 color: Colors.black,
        //               ),
        //               SizedBox(
        //                 width: 8,
        //               ),
        //               Text(('Logout'))
        //             ],
        //           ),
        //         ),
        //         value: 'logout',
        //       ),
        //     ],
        //     onChanged: (itemIdentifier) {
        //       if (itemIdentifier == 'logout') {
        //         FirebaseAuth.instance.signOut();
        //       }
        //     },
        //   ),
        // ],
      ),
      drawer: MyDrawer(context),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage(
        //         'assets/images/e_class2.jpg',
        //       ),
        //       colorFilter: new ColorFilter.mode(
        //           Colors.black.withOpacity(0.2), BlendMode.dstATop),
        //       fit: BoxFit.fill),
        // ),
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$welcomeString",
              style: TextStyle(
                  fontSize: 23, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 20),
            Text(
              '$helpString',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
