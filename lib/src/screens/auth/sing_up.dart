// ignore_for_file: unused_element, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:doorsandwindows/src/components/consts.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/button_sign_up.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/icon_lock_login.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/text.dart';
import 'package:doorsandwindows/src/widgets/login_widgets/text_field.dart';

import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isVisibility = true;
  bool isVisibility2 = true;
  final TextEditingController gmailControl = TextEditingController();
  final TextEditingController passControl = TextEditingController();
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController passForControl = TextEditingController();
  final GlobalKey<FormState> _gkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                          return 'Enter your Name';
                        }
                        return null;
                      },
                      controller: nameControl,
                      obscureText: false,
                      lrefixIcons: const Icon(Icons.email_outlined),
                      labelText: 'Name',
                    ),
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

                    ResponsiveTextField(
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    ResponsiveTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your ForgetPassword';
                        }
                        return null;
                      },
                      controller: passForControl,
                      obscureText: isVisibility2,
                      lrefixIcons: IconButton(
                        onPressed: () {
                          setState(() {
                            //! Toggle visibility of the password
                            isVisibility2 = !isVisibility2;
                          });
                        },
                        icon: isVisibility2
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(
                          Icons.visibility_outlined,
                        ),
                      ),
                      labelText: 'ForgetPassword',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //! Button Sign in
                    BottomSignin(
                      onTap: () {
                        if (_gkey.currentState!.validate()) {
                          _signUp();
                        }
                      },
                      name: "Sign in",
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //! OR
                    const Text("(or)", style: TextStyle(fontSize: 16)),

                    //! Botton login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(' Enter your an Account'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/LoginPage');
                          },
                          child: const Text('LogIn'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//! Sign Up Function
  _signUp() async {
    var bodyResponse = json.encode({
      "name": nameControl.text,
      "email": gmailControl.text,
      "password": passControl.text,
      "passwordConfirm": passForControl.text
    });

    http.Response response = await http.post(
      Uri.parse('${baseUrl}/api/auth/signup'),
      headers: {"Content-Type": "application/json"},
      body: bodyResponse,
    );
    if (response.statusCode == 201) {
      var responseDecode = json.decode(response.body);
      var status = responseDecode['data'];
      print(status);
      print('Sasses');
      const ScaffoldMessenger(
        child: SnackBar(
          content: Text('Success'),
        ),
      );
      nameControl.clear();
      passForControl.clear();
      gmailControl.clear();
      passControl.clear();
      Navigator.pushNamed(context, '/LoginPage');
    } else {
      var responseDecode = json.decode(response.body);
      var errorMessage = responseDecode["errors"][0]["msg"];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage.toString()),
      ));
      print(errorMessage);
      print(response.statusCode);
    }
  }
}