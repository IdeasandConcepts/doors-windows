// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class SignIn_with_Google extends StatelessWidget {
  const SignIn_with_Google({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/SigninPage');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/google.png',
              width: 21,
              height: 25,
            ),
          ),
          const Text(
            'Sign in with Google',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 17.28,
            ),
          ),
        ],
      ),
    );
  }
}