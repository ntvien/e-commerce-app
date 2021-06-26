import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String name;
  final void Function(String)? onChanged;

  MyTextFormField({required this.validator, required this.name, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
