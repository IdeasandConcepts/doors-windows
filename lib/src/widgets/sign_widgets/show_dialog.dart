import 'package:doorsandwindows/src/widgets/sign_widgets/dialog.dart';
import 'package:flutter/material.dart';

Future<dynamic> showdialog(BuildContext context, Size screenSize) {
  String accountName = 'Ahmed Mohamed Saad';
  String email = 'email@gmail.com';
  String appName = 'TikTak';
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Rounded corners for dialog
        ),
        alignment: Alignment.center,
        child: AccountSelectionWidget(
          screenSize: screenSize,
          accountName: accountName, //! Example account name
          email: email, //! Example email
          appName: appName, //! Example application name
        ),
      );
    },
  );
}