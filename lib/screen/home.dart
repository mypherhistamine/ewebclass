import 'package:ewebclass/widget/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String welcomeString = "Welcome to the E-Web Class Portal\n\n";

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
          ],
        ),
      ),
    );
  }
}
