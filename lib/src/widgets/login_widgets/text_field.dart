// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ResponsiveTextField extends StatelessWidget {
  const ResponsiveTextField({
    super.key,
    required this.labelText,
    required this.lrefixIcons,
    required this.obscureText,
    required this.controller,
    required this.validator,
  });
  final String labelText;
  final Widget lrefixIcons;
  final bool obscureText;
  final controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: lrefixIcons,
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}