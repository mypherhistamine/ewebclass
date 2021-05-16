import 'package:flutter/material.dart';

import 'documentation.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    String ans =
                        "Step: 1 Login/Signup\nStep:2 Open the drawer from top left corner\nStep:3 Click on assignments and quizzes\nStep4:Choose the particular assignment\n Step:4 Locate the file that you want to upload on your phone \n Step:5Finally click on upload button  ";
                    String q = "How to Upload Assignmments";
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Doc(
                                ans: ans,
                                q: q,
                              )),
                    );
                  },
                  child: Container(
                    child: Text("How to Upload Assignmments"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    String ans =
                        "Step: 1 Login/Signup\nStep:2 Open the drawer from top left corner\nStep:3 Click on Course Materials\nStep4:Choose the particular Material\n Step:4 Click On Download Button \n Step:5 Finally open the file from the downloads folder of your device  ";
                    String q = "How to Download Material";
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Doc(
                                ans: ans,
                                q: q,
                              )),
                    );
                  },
                  child: Container(
                    child: Text("How to Download Material"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    String ans =
                        "Step: 1 Login/Signup\nStep:2 Open the drawer from top left corner\nStep:3 Click on Profile\nStep4:Click on the pencil icon on the top right corner \n Step:4 Update the information \n Step:5 Finally click on the submit button ";
                    String q = "How to Edit Profile";

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Doc(
                                  ans: ans,
                                  q: q,
                                )));
                  },
                  child: Container(
                    child: Text("How to Edit Profile"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    String ans =
                        "Step:1 Click on Login Button\nStep:2 Click on Forget Password\nStep:3 Enter your Email,where there will be a link through which you can change the password";
                  },
                  child: Container(
                    child: Text("How to Change Passowrd"),
                  ),
                ),
                Container(child: Text("Report for any Bugs")),
                Container(
                  child: Text("FeedBack"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
