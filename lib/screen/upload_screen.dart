import 'package:ewebclass/widget/button.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  final String question;
  final String dueDate;
  UploadScreen({Key key, this.question, this.dueDate, String marks}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.question}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 40),
            CustomButton(
              content: "Submit work",
              cornerRadius: 12,
              buttonColor: Colors.blue,
              contentSize: 20,
              height: 30,
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
