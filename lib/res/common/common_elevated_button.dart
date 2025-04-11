import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CommonButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        elevation: 4,
        minimumSize: Size(400, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
