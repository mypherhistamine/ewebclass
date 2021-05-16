import 'package:ewebclass/model/assignment.dart';
import 'package:ewebclass/screen/upload_screen.dart';
import 'package:ewebclass/widget/button.dart';
import 'package:flutter/material.dart';

class CustomAissgmentCard extends StatefulWidget {
  final Assignment assignment;

  const CustomAissgmentCard({Key key, this.assignment}) : super(key: key);

  @override
  _CustomAissgmentCardState createState() => _CustomAissgmentCardState();
}

class _CustomAissgmentCardState extends State<CustomAissgmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 150,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.assignment.title}",
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text('${widget.assignment.subject}'),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 15, bottom: 15),
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.black,
                //   ),
                // ),
                child: Row(
                  children: [
                    Spacer(),
                    CustomButton(
                      buttonColor: Colors.blue,
                      content: "More Info",
                      contentSize: 15,
                      cornerRadius: 20,
                      function: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UploadScreen(
                              marks: widget.assignment.marks,
                              dueDate: widget.assignment.dueDate,
                              question: widget.assignment.question,
                            ),
                          ),
                        );
                      },
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
