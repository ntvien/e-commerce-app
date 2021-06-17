import 'package:e_commerce_app/widgets/changescreen.dart';
import 'package:e_commerce_app/widgets/mybutton.dart';
import 'package:e_commerce_app/widgets/mytextformfield.dart';
import 'package:e_commerce_app/widgets/passwordtextformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'signin.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// Regular Expressions
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText = true;

String email = "";
String password = "";

class _SignUpState extends State<SignUp> {
  void validation() async {
    final FormState? _form = _formKey.currentState;
    if (!_form!.validate()) {
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(result.user.uid);
      } on PlatformException catch (e) {
        print(e.message.toString());
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
          ),
        );
      }
    } else {
      print("dddd");
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      height: 330,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            validator: (value) {
              if (value == "") {
                return "Please Fill UserName";
              } else if (value!.length < 6) {
                return "UserName Is Too Short";
              }
              return "";
            },
            name: "User Name",
          ),
          MyTextFormField(
            validator: (value) {
              if (value == "") {
                return "Please Fill Email";
              } else if (!regExp.hasMatch(value!)) {
                return "Email Is Not Invalid";
              }
              return "";
            },
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
            name: "Email",
          ),
          PasswordTextFormField(
            obserText: obserText,
            validator: (value) {
              if (value == "") {
                return "Please Fill Password";
              } else if (value!.length < 8) {
                return "Password Is Too Short";
              }
              return "";
            },
            onChanged: (value) {
              setState(() {
                password = value;
                print(password);
              });
            },
            name: "Password",
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText != obserText;
              });
            },
          ),
          MyTextFormField(
            validator: (value) {
              if (value == "") {
                return "Please Fill Phone Number";
              } else if (value!.length != 10) {
                return "Phone Number Must Be 10";
              }
              return "";
            },
            name: "Phone Number",
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAllTextFormField(),
          MyButton(
            name: "SignUp",
            onPressed: () {
              validation();
            },
          ),
          ChangeScreen(
            name: "Sign In",
            whichAccount: "I Have Already An Account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => SignIn(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
