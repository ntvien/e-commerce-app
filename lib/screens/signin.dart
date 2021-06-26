import 'package:e_commerce_app/screens/signup.dart';
import 'package:e_commerce_app/widgets/change_screen.dart';
import 'package:e_commerce_app/widgets/my_text_form_field.dart';
import 'package:e_commerce_app/widgets/password_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/my_button.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText = true;

String email = "";
String password = "";

class _SignInState extends State<SignIn> {
  void validation() async {
    final FormState? _form = _formKey.currentState;
    if (!_form!.validate()) {
      try {
        AuthResult userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential.user!.uid);
      } on PlatformException catch (e) {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
          ),
        );
      }
    } else {
      print("No");
    }
  }

  Widget _buildAllPart() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Sign In",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
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
                print(email);
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
            name: "Password",
            onChanged: (value) {
              setState(() {
                password = value;
                print(password);
              });
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText != obserText;
              });
            },
          ),
          MyButton(
            name: "Login",
            onPressed: () {
              validation();
            },
          ),
          ChangeScreen(
            name: "Sign Up",
            whichAccount: "I Have Not Account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => SignUp(),
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
        body: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAllPart(),
              ],
            ),
          ),
        ));
  }
}
