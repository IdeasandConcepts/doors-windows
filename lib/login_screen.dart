
import 'dart:convert';

import 'package:doorsandwindows/src/components/consts.dart';
import 'package:doorsandwindows/src/components/default_button.dart';
import 'package:doorsandwindows/src/screens/clients/clients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'controller/shared/shared_prefrances.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late String idstr, passwordstr;

  bool _obscureText=false;
  void toggle(){
    setState(() {
      _obscureText=!_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color:kprimaryColor,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: 545.w,
                height: 0.65.sh,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(35.r)),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/appBackground.jpeg"),
                      fit: BoxFit.cover,
                    )),
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: 346.h,
                      height: 600.h,
                      padding: EdgeInsets.all(25.w).copyWith(bottom: 0),
                      decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left:15.h,right: 15.h),
                              child: Container(
                                child: Image.asset(
                                  "assets/images/img.png",
                                ),
                              ),
                            ),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "Shelf".toUpperCase(),
                            //       style: TextStyle(
                            //           fontSize: 40.sp,
                            //           color: kprimaryColor,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     Text(
                            //       "Pro".toUpperCase(),
                            //       style: TextStyle(
                            //           fontSize: 40.sp,
                            //           color: kSecondColor,
                            //           fontWeight: FontWeight.bold),
                            //     )
                            //   ],
                            // ),
                             SizedBox(height: 20.h),
                            Material(
                                elevation: 15,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  width: 300.w,
                                  height:  60.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular( 20),
                                  ),
                                  child: TextFormField(
                                    // maxLines: 1,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    // controller: username,
                                    decoration: InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 10),
                                      //prefixIcon: Icon(Icons.person),
                                        //(idcontroller.text=="")
                                        suffixIcon:
                                        (emailController.text!="")?
                                        IconButton(
                                        onPressed: (){
                                          //toggle();
                                        },
                                        icon: Icon(Icons.check,color: kprimaryColor,),
                                      ):null,
                                      border: InputBorder.none,
                                      labelText: "User name".tr,
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp),
                                    ),
                                    onSaved: (newValue) {
                                      idstr = newValue!;
                                      idstr = emailController.text;
                                    },
                                    onChanged: (newValue) {
                                      idstr = newValue;
                                      idstr = emailController.text;
                                    },
                                  ),
                                )),
                            SizedBox(height: 29.h),

                            Material(
                              //color:kBackgroundColor,
                                borderRadius: BorderRadius.circular(0),
                                elevation: 15,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  width: 300.w,
                                  height:  60.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular( 0),
                                    //color: const Color(0xffF6F6F6),
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    obscureText: !_obscureText,
                                    controller: passwordController,
                                    // controller: username,
                                    decoration: InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                      // floatingLabelBehavior: FloatingLabelBehavior.always,
                                      //prefixIcon: Icon(Icons.lock,color: Colors.black,),
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          toggle();
                                        },
                                        icon: Icon(Icons.visibility,color: Colors.black,),
                                      ),
                                      border: InputBorder.none,
                                      labelText: "Password".tr,
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          //const Color(0xff9B9B9B),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp),
                                      // border: InputBorder.none,
                                    ),

                                    // labelText: "Password",
                                    onSaved: (newValue) {
                                      idstr = newValue!;
                                      idstr = passwordController.text;
                                    },
                                    onChanged: (newValue) {
                                      idstr = newValue;
                                      idstr = passwordController.text;
                                    },
                                  ),
                                )),
                            SizedBox(height: 51.h),
                            GestureDetector(
                              onTap: (){
                                _signIn();
                               // if (_formkey.currentState?.validate() == true)
                                  //_formkey.currentState?.save();
                                // {
                                //   try {


                              },
                              child: DefualtButton(
                                text: "LOGIN".tr,
                                selected: true,
                                // onTap: () {
                                //   Get.to(() =>  AndroidAuthPage());
                                // },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  //! the Function Sing In => Api
  Map<String,dynamic>? dataMap;
  Map<String,dynamic>? doneDataMap;
  List<dynamic>? data;

  _signIn() async {
    final body = json.encode({
      "email": emailController.text,
      "password": passwordController.text,
    });
    http.Response response = await http.post(
      Uri.parse('${baseUrl}/api/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      dataMap=jsonDecode(response.body);
      doneDataMap=dataMap!['data'];
    data=doneDataMap!['assignedClients'];
    /// for single data
      /// print data
      print(doneDataMap.toString());
      // print(doneDataMap!['assignedClients']);
      // print(doneDataMap!['id'].toString());
      // print(doneDataMap!['id'].toString());
      // print(doneDataMap!['id'].toString());

      // var errorResponse = json.decode(response.body);
      // var errorMessage = errorResponse['data']['_id'];
      // print(errorMessage);
      // print(response.statusCode);
      // print('Success');

      emailController.clear();
      passwordController.clear();
      Get.offAll(ClientsScreen(
      //   clientsId: data!,
      // employeeId:doneDataMap!['_id'],
      ));
      // ignore: use_build_context_synchronously
     // Navigator.pushNamed(context, '/SigninPage');
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