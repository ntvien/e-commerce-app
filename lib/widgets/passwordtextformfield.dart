import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final String? Function(String?)? validator;
  final String name;
  final Function()? onTap;
  final void Function(String)? onChanged;

  PasswordTextFormField(
      {required this.obserText,
      required this.validator,
      required this.name,
      required this.onTap,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obserText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
