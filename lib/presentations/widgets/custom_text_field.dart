import 'package:flutter/material.dart';
class CustomTextFields extends StatelessWidget {
  const CustomTextFields({
    Key? key,
    required this.controller,
    required this.iconData,
    this.isobs = false,
    required this.title,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData iconData;
  final String title;
  final bool isobs;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isobs,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusColor: Colors.white,
        hintText: title,
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}