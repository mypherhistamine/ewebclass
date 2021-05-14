import 'package:ewebclass/controllers/userdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final userDataController = Get.put(StudentData());
  @override
  void initState() {
    nameController.text = userDataController.userName.value;
    regController.text = userDataController.regNo.value;
    schController.text = userDataController.school.value;
    emailController.text = userDataController.userEmail.value;
    phoneController.text = userDataController.mobileNo.value;
    addressController.text = userDataController.address.value;
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController regController = new TextEditingController();
  TextEditingController schController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: TextField(),
              //        Text("Rishabh Mishra", style: nameStyle),
              // SizedBox(height: 20),
              // rightAlignText(text: "Reg No - 19BCE2088"),
              // SizedBox(height: 20),
              // rightAlignText(text: "School - SCOPE"),
              // SizedBox(height: 20),
              // rightAlignText(text: "Email - rishabhmishra23599@gmail.com"),
              // SizedBox(height: 20),
              // rightAlignText(text: "Mobile No - 9560106736"),
              // SizedBox(height: 20),
              // rightAlignText(
              //     text: "Address - H.No. 44,Gali No-3 , Sant Nagar Burari"),
              // SizedBox(height: 20),
              // rightAlignText(text: "City - Delhi")
            ),
            Container(
              child: TextField(
                controller: nameController,
              ),
            ),
            Container(
              child: TextField(
                controller: regController,
              ),
            ),
            Container(
              child: TextField(
                controller: schController,
              ),
            ),
            Container(
              child: TextField(
                controller: emailController,
              ),
            ),
            Container(
              child: TextField(
                controller: phoneController,
              ),
            ),
            Container(
              child: TextField(
                controller: addressController,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  userDataController.userName.value = nameController.text;
                  userDataController.regNo.value = regController.text;
                  userDataController.school.value = schController.text;
                  userDataController.userEmail.value = emailController.text;
                  userDataController.mobileNo.value = phoneController.text;
                  userDataController.address.value = addressController.text;

                  userDataController.ocenia();
                  await userDataController.changeDetails();
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
