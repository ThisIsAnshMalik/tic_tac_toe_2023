import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final String buttonText;
  const CustomButton({Key? key, required this.ontap, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.blue, blurRadius: 5, spreadRadius: 0)
      ]),
      child: ElevatedButton(
        onPressed: ontap,
        style:
            ElevatedButton.styleFrom(minimumSize: Size(width, height * 0.06)),
        child: Text(buttonText),
      ),
    );
  }
}
