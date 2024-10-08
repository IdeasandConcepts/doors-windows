// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class Have_an_account_Signup_text extends StatelessWidget {
  const Have_an_account_Signup_text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have an account?',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/SignUp');
          },
          child: const Text(
            ' Sign up',
            style: TextStyle(
              color: Color(0xff3787FF),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}