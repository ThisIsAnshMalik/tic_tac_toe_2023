import 'package:flutter/material.dart';
import 'package:tic_tac_toe_2023/res/Colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  var validator;
  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.blue, blurRadius: 5, spreadRadius: 2)
      ]),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            fillColor: AppColor.primaryColor, filled: true, hintText: hintText),
      ),
    );
  }
}
