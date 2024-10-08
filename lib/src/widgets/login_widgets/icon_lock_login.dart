import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class TheLook_in_Login extends StatelessWidget {
  const TheLook_in_Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 78,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff3787FF),
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SvgPicture.asset(
          'assets/images/Lock.svg',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}