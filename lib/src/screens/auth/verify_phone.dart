import 'package:doorsandwindows/src/widgets/sign_widgets/opt_text_field.dart';
import 'package:flutter/material.dart';


// ignore: use_key_in_widget_constructors
class PhoneVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4F1F8),
      appBar: AppBar(
          backgroundColor: const Color(0xffE4F1F8),
          centerTitle: true,
          title: const Text('Verify Phone'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Code is sent to 283 835 2999 ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20.0),
              const OTPTextFields(), // إضافة حقول OTP هنا
              const SizedBox(height: 20.0),
              const Text(
                'Didn’t recieve code? Request again',
                style: TextStyle(
                    color: Color(0xff767372),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40.0),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color(0xff3787FF),
                  ),
                ),
                onPressed: () {
                  // أضف منطق التحقق من OTP هنا
                },
                child: const Text(
                  'Verify and Create Account',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}