import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Function()? onPressed;

  MyButton({required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        color: Color(0xff746bc9),
        onPressed: onPressed,
      ),
    );
  }
}

