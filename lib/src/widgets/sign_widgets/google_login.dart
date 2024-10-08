import 'package:doorsandwindows/src/widgets/sign_widgets/show_dialog.dart';
import 'package:flutter/material.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    // Get the screen size to define proportions
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        // Show a dialog when the button is pressed
        showdialog(context, screenSize);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Button background color
          borderRadius: BorderRadius.circular(50), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.01, // Padding for vertical spacing
          horizontal: 16, // Padding for horizontal spacing
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/google.png', // Replace this with your image asset path
              height: 40, // Adjust the size of the image
            ), // Google image as icon
            SizedBox(
              width: screenSize.width * 0.1,
            ), // Space between icon and text
            const Text(
              'Log in with Google',
              style: TextStyle(
                  color: Colors.black, fontSize: 16), // Text color and size
            ),
          ],
        ),
      ),
    );
  }
}

class FacebookLoginBotton extends StatelessWidget {
  const FacebookLoginBotton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show a dialog when the button is pressed
        showdialog(context, screenSize);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Button background color
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.01, // Padding for vertical spacing
          horizontal: 16, // Padding for horizontal spacing
        ),
        child: Row(
          children: [
            const Icon(
              Icons.facebook,
              color: Colors.blue, // Facebook icon color
              size: 40, // Adjust the size of the icon
            ),
            SizedBox(
              width: screenSize.width * 0.1,
            ), // Space between icon and text
            const Text(
              'Log in with Facebook',
              style: TextStyle(
                  color: Colors.black, fontSize: 16), // Text color and size
            ),
          ],
        ),
      ),
    );
  }
}