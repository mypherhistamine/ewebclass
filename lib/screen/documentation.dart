import 'package:flutter/material.dart';

class Doc extends StatelessWidget {
  final String ans;
  final String q;
  Doc({this.ans, this.q});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("$q")),
      body: Container(
        height: size.height,
        width: size.width,
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.black,
        //   ),
        // ),
        padding: EdgeInsets.only(left: 20, top: 40, right: 20),
        child: Column(
          children: [
            Text(
              q,
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
            SizedBox(height: 50),
            Text(
              ans,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            )
          ],
        ),
      ),
    );
  }
}
