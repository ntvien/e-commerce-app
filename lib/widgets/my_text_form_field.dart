import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String? name;
  final TextEditingController? controller;

  MyTextFormField({required this.name, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
