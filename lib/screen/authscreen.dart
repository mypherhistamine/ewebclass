import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/screen/home.dart';
import 'package:ewebclass/utils/theme.dart';
import 'package:get/get.dart';

import '../widget/authform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  final getXController = Get.put(StudentData());

  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential authResult;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        getXController.authResultId.value = authResult.user.uid;
        getXController.userloggedIn.value = true;
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        getXController.authResultId.value = authResult.user.uid;

        getXController.hasSubmitted.value = true;
        getXController.userloggedIn.value = true;
        getXController.submitDetails();
        Navigator.of(context).popAndPushNamed(HomePage.routeName);
        // FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(authResult.user.uid)
        //     .set({
        //   'username': username,
        //   'email': email,
        // });
      }
    } on PlatformException catch (err) {
      var message = 'An error occured';

      if (err.message != null) {
        message = err.message;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).errorColor,
      ));

      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      var message = 'An error occured';

      if (err.message != null) {
        message = err.message;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).errorColor,
      ));

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(color: Utils.bgColor2
              // gradient: LinearGradient(
              //     transform: GradientRotation(pi / 2), colors: Utils.bgColor)
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage('assets/images/bg.jpg'),
              // ),
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text('E Class', style: TextStyle(fontSize: 50)),
              Opacity(
                opacity: 1,
                child: AuthForm(
                  _submitAuthForm,
                  _isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
