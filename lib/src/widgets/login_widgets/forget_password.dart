import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: Color(0xff3787FF),
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xff3787FF),
            ),
          ),
        ),
      ],
    );
  }
}