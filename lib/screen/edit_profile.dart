import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewebclass/controllers/userdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final userDataController = Get.put(StudentData());
  final firebaseRef = FirebaseFirestore.instance.collection("users");
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initFields();
  }

  void initFields() async {
    firebaseRef
        .doc('${userDataController.authResultId.value}')
        .get()
        .then((value) {
      // print(value.data());
      // regController.text = value.data()['regNo'];
      // schController.text = value.data()['school'];
      // emailController.text = value.data()['email'];
      // phoneController.text = value.data()['mobileNo'];
      // addressController.text = value.data()['address'];
      // cityController.text = value.data()['city'];
    });

    // regController.text = userDataController.regNo.value;
    // schController.text = userDataController.school.value;
    // emailController.text = userDataController.userEmail.value;
    // phoneController.text = userDataController.mobileNo.value;
    // addressController.text = userDataController.address.value;
    // cityController.text = userDataController.city.value;
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController regController = new TextEditingController();
  TextEditingController schController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  final getXController = Get.put(StudentData());

  bool isSubmitting = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    regController.dispose();
    schController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: 700,
          child: Form(
            key: _formKey,
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
                    child: TextFormField(
                      validator: (text) {
                        if (text.isEmpty) {
                          return "This filed can't be empty";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Name',
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Name',
                          border: InputBorder.none),
                      controller: nameController,
                    ),
                  ),
                ),

                // Container(
                //   height: 60,
                //   child: Card(
                //     elevation: 8,
                //     child: Padding(
                //       padding: const EdgeInsets.all(10.0),
                //       child: Row(
                //         children: [
                //           Text(
                //             "${regController.text}",
                //             style:
                //                 TextStyle(fontSize: 16, color: Colors.black38),
                //           ),
                //           SizedBox(width: 10),
                //           Text(
                //             "*This field can't be changed",
                //             style: TextStyle(
                //                 fontSize: 16, color: Colors.redAccent),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                Container(
                  child: Card(
                    elevation: 8,
                    child: TextFormField(
                      validator: (text) {
                        if (text.isEmpty) {
                          return "This filed can't be empty";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Registration Number',
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'School',
                          border: InputBorder.none),
                      controller: regController,
                    ),
                  ),
                ),

                Container(
                  child: Card(
                    elevation: 8,
                    child: TextFormField(
                      validator: (text) {
                        if (text.isEmpty) {
                          return "This filed can't be empty";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'School',
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
                    child: TextFormField(
                      validator: (text) {
                        if (text.isEmpty) {
                          return "This filed can't be empty";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Email',
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
                    child: TextFormField(
                      validator: (text) {
                        if (text.isEmpty) {
                          return "This filed can't be empty";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Contact No',
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
                    child: TextFormField(
                      validator: (text) {
                        if (text.isEmpty) {
                          return "This filed can't be empty";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Address',
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Address',
                          border: InputBorder.none),
                      controller: addressController,
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    elevation: 8,
                    child: TextFormField(
                      validator: (text) {
                        if (text.isEmpty) {
                          return "This filed can't be empty";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'City',
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'City',
                          border: InputBorder.none),
                      controller: cityController,
                    ),
                  ),
                ),
                !isSubmitting
                    ? Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  isSubmitting = true;
                                });
                                userDataController.userName.value =
                                    nameController.text;
                                userDataController.city.value =
                                    cityController.text;
                                userDataController.regNo.value =
                                    regController.text;
                                userDataController.school.value =
                                    schController.text;
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
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.blueAccent,
                                  content: const Text(
                                      'Your Profile has been updated'),
                                  duration: const Duration(seconds: 2),
                                  // action: SnackBarAction(
                                  //   label: 'Your Profile has been updated',
                                  //   onPressed: () {},
                                  // ),
                                ));
                              }
                            },
                            child: Text("Edit Profile")),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                SizedBox(height: 10),
                // Container(
                //   width: 300,
                //   child: Text(
                //     " * Your registration number is managed by your organization. To change your registration number please contact the the admin, for more details check the help section ",
                //     style: TextStyle(fontSize: 16, color: Colors.redAccent),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
