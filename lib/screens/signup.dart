import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/screens/signin.dart';
import 'package:e_commerce_app/widgets/change_screen.dart';
import 'package:e_commerce_app/widgets/my_button.dart';
import 'package:e_commerce_app/widgets/my_text_form_field.dart';
import 'package:e_commerce_app/widgets/password_text_form_field.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
final TextEditingController email = TextEditingController();
final TextEditingController userName = TextEditingController();
final TextEditingController phoneNumber = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController address = TextEditingController();

bool isMale = true;
bool isLoading = false;

class _SignUpState extends State<SignUp> {
  void submit() async {
    UserCredential result;
    try {
      setState(() {
        isLoading = true;
      });
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      print(result);
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message!;
      }
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));

      print(error);
    }
    // FirebaseFirestore.instance.collection("User").doc(result.user.uid).set({
    //   "UserName": userName.text,
    //   "UserId": result.user.uid,
    //   "UserEmail": email.text,
    //   "UserAddress": address.text,
    //   "UserGender": isMale == true ? "Male" : "Female",
    //   "UserNumber": phoneNumber.text,
    // });
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    setState(() {
      isLoading = false;
    });
  }

  void validation() async {
    if (userName.text.isEmpty &&
        email.text.isEmpty &&
        password.text.isEmpty &&
        phoneNumber.text.isEmpty &&
        address.text.isEmpty) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("All Flied Are Empty"),
        ),
      );
    } else if (userName.text.length < 6) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
        ),
      );
    } else if (email.text.isEmpty) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Please Try Valid Email"),
        ),
      );
    } else if (password.text.isEmpty) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else if (password.text.length < 8) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Password  Is Too Short"),
        ),
      );
    } else if (phoneNumber.text.length < 11 || phoneNumber.text.length > 11) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Phone Number Must Be 11 "),
        ),
      );
    } else if (address.text.isEmpty) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Address Is Empty "),
        ),
      );
    } else {
      submit();
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            name: "UserName",
            controller: userName,
          ),
          SizedBox(
            height: 10,
          ),
          MyTextFormField(
            name: "Email",
            controller: email,
          ),
          SizedBox(
            height: 10,
          ),
          PasswordTextFormField(
            obserText: obserText,
            controller: password,
            name: "Password",
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = !isMale;
              });
            },
            child: Container(
              height: 60,
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      isMale == true ? "Male" : "Female",
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MyTextFormField(
            name: "Phone Number",
            controller: phoneNumber,
          ),
          SizedBox(
            height: 10,
          ),
          MyTextFormField(
            name: "Address",
            controller: address,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          SizedBox(
            height: 10,
          ),
          isLoading == false
              ? MyButton(
                  name: "SignUp",
                  onPressed: () {
                    validation();
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
          ChangeScreen(
            name: "Login",
            whichAccount: "I Have Already An Account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => SignIn(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        children: [
          Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            child: _buildBottomPart(),
          ),
        ],
      ),
    );
  }
}
