import 'package:doorsandwindows/src/screens/auth/login.dart';
import 'package:doorsandwindows/src/screens/auth/sing_up.dart';
import 'package:doorsandwindows/src/screens/auth/verify_phone.dart';
import 'package:flutter/material.dart';
// import 'package:onlin_learning_app/src/Booking_and_Time/view/timer.dart';
// import 'package:onlin_learning_app/src/Different_versions_of_Login_Screens/views/login_page.dart';
// import '../../src/Booking_and_Time/view/booking.dart';
// import '../../src/Course_page_Detailes/views/details.dart';
// import '../../src/Different_versions_of_Login_Screens/views/sign_up_page.dart';
// import '../../src/Different_versions_of_Login_Screens/views/signin_page.dart';
// import '../../src/Different_versions_of_Login_Screens/views/sin_up_verification_code.dart';
// import '../../src/Different_versions_of_Login_Screens/views/verify_phone.dart';
// import '../../src/onboarding/views/pages/home_screen.dart';

//! the file Route
class RouteGenerator {
  //! the Function Route to switch Screens

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    //! home screen
     // case '/':
       // return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/LoginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/SigninPage':
        return MaterialPageRoute(builder: (_) => const SignUp());
      case '/VerifyPhonePage':
        return MaterialPageRoute(builder: (_) => PhoneVerificationPage());
      // case '/VerificationCode':
      //   return MaterialPageRoute(builder: (_) => VerificationCode());

      // case '/Booking':
      //   return MaterialPageRoute(builder: (_) => const Booking());
      // case '/TimerPage':
      //   return MaterialPageRoute(builder: (_) => const TimerPage());
      // case '/DetailsScreen':
      //   return MaterialPageRoute(builder: (_) => const DetailsScreen());
      // case '/SignUp':
      //   return MaterialPageRoute(builder: (_) => const SignUp());
      default:
      //!Home Page If the path does not exist, the page is displayed.
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}