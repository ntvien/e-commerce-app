import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String name;
  final String whichAccount;
  final Function()? onTap;
  ChangeScreen(
      {required this.name, required this.whichAccount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(whichAccount),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: TextStyle(fontSize: 20, color: Colors.cyan),
          ),
        )
      ],
    );
  }
}
