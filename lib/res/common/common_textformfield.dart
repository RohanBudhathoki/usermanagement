import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  const CommonTextField({
    super.key,
    this.hintText,
    this.controller,
    required this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,

        decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(
              color: Colors.blue,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(28),
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
        validator: validator,
      ),
    );
  }
}
