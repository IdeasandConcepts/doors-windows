import 'package:flutter/material.dart';

class EmailAddressInputField extends StatelessWidget {
  const EmailAddressInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        labelText: 'email address', // Label for email input
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30), // Rounded input border
        ),
      ),
    );
  }
}

class UsernameInputField extends StatelessWidget {
  const UsernameInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        labelText: 'User name', // Label for username input
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30), // Rounded input border
        ),
      ),
    );
  }
}