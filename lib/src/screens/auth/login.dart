// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:doorsandwindows/src/components/consts.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/button_sign_up.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/finget_print.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/google_sign_in.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/have_an_account.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/icon_lock_login.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/text.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/text_field.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisibility = true;
  final TextEditingController gmailControl = TextEditingController();
  final TextEditingController passControl = TextEditingController();
  final GlobalKey<FormState> _gkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE4F1F8),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Form(
                key: _gkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    //! The look is in Container
                    const TheLook_in_Login(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //! Text welcome back
                    const TextWelcome(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    //! Text subtitle welcome back
                    const TextSubtitle(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    //! TextField for email
                    ResponsiveTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Email';
                        }
                        return null;
                      },
                      controller: gmailControl,
                      obscureText: false,
                      lrefixIcons: const Icon(Icons.email_outlined),
                      labelText: 'Email',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //! TextField for password

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ResponsiveTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Password';
                              }
                              return null;
                            },
                            controller: passControl,
                            obscureText: isVisibility,
                            lrefixIcons: IconButton(
                              onPressed: () {
                                setState(() {
                                  //! Toggle visibility of the password
                                  isVisibility = !isVisibility;
                                });
                              },
                              icon: isVisibility
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(
                                Icons.visibility_outlined,
                              ),
                            ),
                            labelText: 'Password',
                          ),
                        ),
                        FingerPrint(screenWidth: screenWidth),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //! Button Sign in
                    BottomSignin(
                      onTap: () {
                        if (_gkey.currentState!.validate()) {}
                        _signIn();
                      },
                      name: "Sign in",
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //! OR
                    const Text("(or)", style: TextStyle(fontSize: 16)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //! Sign in with Google
                    const SignIn_with_Google(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //! Text Have an account Signup
                    const Have_an_account_Signup_text(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//! the Function Sing In => Api
  _signIn() async {
    final body = json.encode({
      "email": gmailControl.text,
      "password": passControl.text,
    });
    http.Response response = await http.post(
      Uri.parse('${baseUrl}api/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      var errorResponse = json.decode(response.body);
      var errorMessage = errorResponse['data']['_id'];
      print(errorMessage);
      print(response.statusCode);
      print('Success');

      gmailControl.clear();
      passControl.clear();
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/SigninPage');
    } else {
      var errorResponse = json.decode(response.body);
      var errorMessage = errorResponse["errors"][0]["msg"];
      print(errorMessage);
      print(response.statusCode);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage.toString()),
      ));
      print('Error');
    }
  }
}