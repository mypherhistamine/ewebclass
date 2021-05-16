import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFN,
    this.isLoading,
  );

  final bool isLoading;
  final void Function(String email, String password, String username,
      bool isLogin, BuildContext ctx) submitFN;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var regNo = '';
  var school = '';
  var address = '';
  var city = '';
  var mobileNo = '';
  final getXController = Get.put(StudentData());

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFN(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        _isLogin,
        context,
      );
      // print(_userEmail);
      // print(_userName);
      // print(_userPassword);
      // widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
      //     _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                child: TextFormField(
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none,
                      labelText: 'Email address'),
                  onSaved: (value) {
                    _userEmail = value;
                    getXController.ocenia();
                    getXController.userEmail.value = value;
                  },
                ),
              ),
              if (!_isLogin)
                Card(
                  child: TextFormField(
                    key: ValueKey('username'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 4) {
                        return 'Please enter at least 4 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none,
                    ),
                    onSaved: (value) {
                      _userName = value;
                      getXController.ocenia();
                      getXController.userName.value = value;
                    },
                  ),
                ),
              if (!_isLogin)
                Card(
                  child: TextFormField(
                    key: ValueKey('regNo'),
                    validator: (value) {
                      print(value.substring(2, 5).toLowerCase());
                      if (value.substring(2, 5).toLowerCase() != "bce") {
                        return 'Please enter a valid registraion number !';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        labelText: 'Registration number (in small letters)'),
                    onSaved: (value) {
                      regNo = value;
                      getXController.ocenia();
                      getXController.regNo.value = value;
                    },
                  ),
                ),
              if (!_isLogin)
                Card(
                  child: TextFormField(
                    key: ValueKey('school'),
                    validator: (value) {
                      print(value.substring(2, 5).toLowerCase());
                      if (value.substring(0, value.length).toLowerCase() !=
                          "scope") {
                        return 'Not a valid school';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'School',
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none,
                    ),
                    onSaved: (value) {
                      getXController.ocenia();
                      getXController.school.value = value;
                    },
                  ),
                ),
              if (!_isLogin)
                Card(
                  child: TextFormField(
                    key: ValueKey('mobileNo'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 10) {
                        return 'Please enter a 10 digit phone number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        labelText: 'Mobile Number'),
                    onSaved: (value) {
                      // mobileNo = value;
                      getXController.ocenia();
                      getXController.mobileNo.value = value;
                    },
                  ),
                ),
              if (!_isLogin)
                Card(
                  child: TextFormField(
                    key: ValueKey('address'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a valid address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        labelText: 'Address'),
                    onSaved: (value) {
                      // address = value;
                      getXController.ocenia();
                      getXController.address.value = value;
                    },
                  ),
                ),
              if (!_isLogin)
                Card(
                  child: TextFormField(
                    key: ValueKey('city'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field can not be empty ! ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        labelText: 'City'),
                    onSaved: (value) {
                      // city = value;
                      getXController.ocenia();
                      getXController.city.value = value;
                    },
                  ),
                ),
              Card(
                child: TextFormField(
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 7) {
                      return 'Password must be at least 7 characters long.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none,
                      labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) {
                    _userPassword = value;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              if (widget.isLoading) CircularProgressIndicator(),
              if (!widget.isLoading)
                CustomButton(
                  cornerRadius: 60,
                  height: 50,
                  width: size.width * 0.7,
                  buttonColor: Colors.blue,
                  contentSize: 15,
                  content: _isLogin ? 'Login' : 'Signup',
                  function: _trySubmit,
                  // onPressed: _trySubmit,
                ),
              if (!widget.isLoading)
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(_isLogin
                      ? 'Create new account'
                      : 'I already have an account'),
                  onPressed: () {
                    setState(
                      () {
                        _isLogin = !_isLogin;
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
