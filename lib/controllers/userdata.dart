import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _authRef = FirebaseAuth.instance;
  var userEmailIdForAuth = ''.obs;

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

  Future<void> reSignIn() async {
    var authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "rishabhmishra23599@gmail.com", password: "Mypher@99");
    authResultId.value = authResult.user.uid;
  }

  Future<void> resetPassword({String email}) async {
    await _authRef.sendPasswordResetEmail(email: email);

    // await _authRef.confirmPasswordReset(code: code, newPassword: newPassword);
  }

  void deleteUSer() async {
    try {
      await FirebaseAuth.instance.currentUser.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }
}
