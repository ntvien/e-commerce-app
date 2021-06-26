import 'package:e_commerce_app/screens/signin.dart';
import 'package:e_commerce_app/screens/signup.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 600,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/shopping.png"),
                        ),
                      ),
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ready To Start Shopping Sign Up",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "To get Started",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 45,
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            color: Color(0xff746bc9),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => SignUp(),
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xff746bc9)),
                              ),
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
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



// https://www.youtube.com/playlist?list=PLQrn8asEsczpy2AxA3sKSD99wMMWXeAlL
