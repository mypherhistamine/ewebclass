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
  final getXController = Get.put(StudentData());

  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 700,
          child: Card(
            child: Column(
              children: [
                // Container(
                //   width: double.infinity,
                //   child: TextField(),
                //   //        Text("Rishabh Mishra", style: nameStyle),
                //   // SizedBox(height: 20),
                //   // rightAlignText(text: "Reg No - 19BCE2088"),
                //   // SizedBox(height: 20),
                //   // rightAlignText(text: "School - SCOPE"),
                //   // SizedBox(height: 20),
                //   // rightAlignText(text: "Email - rishabhmishra23599@gmail.com"),
                //   // SizedBox(height: 20),
                //   // rightAlignText(text: "Mobile No - 9560106736"),
                //   // SizedBox(height: 20),
                //   // rightAlignText(
                //   //     text: "Address - H.No. 44,Gali No-3 , Sant Nagar Burari"),
                //   // SizedBox(height: 20),
                //   // rightAlignText(text: "City - Delhi")
                // ),
                Container(
                  child: Card(
                    elevation: 8,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Name',
                          border: InputBorder.none),
                      controller: nameController,
                    ),
                  ),
                ),

                Container(
                  height: 60,
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "${getXController.regNo}",
                            style: TextStyle(fontSize: 16, color: Colors.black38),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "This field can't be changed",
                            style: TextStyle(fontSize: 16, color: Colors.black38),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  child: Card(
                    elevation: 8,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'School',
                          border: InputBorder.none),
                      controller: schController,
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    elevation: 8,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Email',
                          border: InputBorder.none),
                      controller: emailController,
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    elevation: 8,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Mobile No',
                          border: InputBorder.none),
                      controller: phoneController,
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    elevation: 8,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Address',
                          border: InputBorder.none),
                      controller: addressController,
                    ),
                  ),
                ),
                !isSubmitting
                    ? ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isSubmitting = true;
                          });
                          userDataController.userName.value =
                              nameController.text;
                          userDataController.regNo.value = regController.text;
                          userDataController.school.value = schController.text;
                          userDataController.userEmail.value =
                              emailController.text;
                          userDataController.mobileNo.value =
                              phoneController.text;
                          userDataController.address.value =
                              addressController.text;

                          userDataController.ocenia();
                          await userDataController.changeDetails();
                          setState(() {
                            isSubmitting = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.blueAccent,
                            content:
                                const Text('Your Profile has been updated'),
                            duration: const Duration(seconds: 2),
                            // action: SnackBarAction(
                            //   label: 'Your Profile has been updated',
                            //   onPressed: () {},
                            // ),
                          ));
                        },
                        child: Text("Edit Profile"))
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
