import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class StudentData extends GetxController {
  var userEmail = ''.obs;
  var userName = ''.obs;
  var userPassword = ''.obs;
  var regNo = ''.obs;
  var school = ''.obs;
  var address = ''.obs;
  var city = ''.obs;
  var mobileNo = ''.obs;
  var authResultId = ''.obs;
  var hasSubmitted = false.obs;
  var userloggedIn = false.obs;

  void submitDetails() {
    if (!hasSubmitted.value) {
      return;
    }
    ocenia();
    FirebaseFirestore.instance.collection('users').doc(authResultId.value).set({
      'username': userName.value,
      'email': userEmail.value,
      'address': address.value,
      'school': school.value,
      'mobileNo': mobileNo.value,
      'city': city.value,
      'regNo': regNo.value
    });
  }

  Future<void> changeDetails() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(authResultId.value)
        .update({
      'username': userName.value,
      'email': userEmail.value,
      'address': address.value,
      'school': school.value,
      'mobileNo': mobileNo.value,
      'city': city.value,
      'regNo': regNo.value
    });
  }

  void ocenia() {
    print(userName);
    print(userEmail);
    print(userPassword);
    print(regNo);
    print(school);
    print(mobileNo);
    print(city);
  }

  void reSignIn(){
    
  }
}
