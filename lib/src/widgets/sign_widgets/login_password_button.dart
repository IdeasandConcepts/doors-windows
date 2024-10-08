import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity,
            screenSize.height * 0.07), // Button height based on screen size
        backgroundColor:
        const Color.fromARGB(255, 255, 255, 255), // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
      ),
      onPressed:
          () {}, // Action when "Forgot password?" is pressed (currently empty)
      child: const Text(
        'Forgot password',
        style: TextStyle(
          color: Color(0xff3787FF),
        ),
      ),
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/VerificationCode');
      }, // Action when login button is pressed (currently empty)

      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity,
            screenSize.height * 0.07), // Button height based on screen size
        backgroundColor: Colors.blue, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
      ),
      child: const Text(
        'Log in',
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}